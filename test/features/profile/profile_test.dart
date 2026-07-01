import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/features/profile/domain/entities/profile.dart';
import 'package:keenpockets/features/profile/domain/usecases/get_profile.dart';
import 'package:keenpockets/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:keenpockets/features/profile/presentation/cubit/profile_state.dart';
import 'package:keenpockets/features/profile/presentation/pages/profile_page.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/pump_app.dart';

class _MockGetProfile extends Mock implements GetProfile {}

const _profile = Profile(
  name: 'Ada',
  phone: '+1 (555) 0123-4567',
  level: 12,
  trustScore: 92,
  tier: 'Keen Pioneer',
  tierBlurb: 'Top 5%',
  kycVerified: true,
  paymentReliability: 98,
  pocketsJoined: 12,
  adashisCompleted: 5,
  avgRating: 4.9,
);

void main() {
  late _MockGetProfile getProfile;

  setUpAll(() => registerFallbackValue(const NoParams()));

  setUp(() {
    getProfile = _MockGetProfile();
    when(
      () => getProfile(any()),
    ).thenAnswer((_) async => const Right(_profile));
  });

  group('ProfileCubit', () {
    blocTest<ProfileCubit, ProfileState>(
      'emits [loading, success] and projects the profile name',
      build: () => ProfileCubit(getProfile),
      act: (cubit) => cubit.load(),
      expect: () => [
        isA<ProfileState>().having(
          (s) => s.status,
          'status',
          StateStatus.loading,
        ),
        isA<ProfileState>()
            .having((s) => s.status, 'status', StateStatus.success)
            .having((s) => s.profile?.name, 'name', 'Ada'),
      ],
    );

    blocTest<ProfileCubit, ProfileState>(
      'emits [loading, failure] when the use case fails',
      setUp: () => when(
        () => getProfile(any()),
      ).thenAnswer((_) async => const Left(NetworkFailure())),
      build: () => ProfileCubit(getProfile),
      act: (cubit) => cubit.load(),
      expect: () => [
        isA<ProfileState>().having(
          (s) => s.status,
          'status',
          StateStatus.loading,
        ),
        isA<ProfileState>()
            .having((s) => s.status, 'status', StateStatus.failure)
            .having((s) => s.failure, 'failure', isA<NetworkFailure>()),
      ],
    );
  });

  testWidgets('ProfilePage shows the identity and trust score', (tester) async {
    getIt.registerFactory<ProfileCubit>(() => ProfileCubit(getProfile));
    addTearDown(getIt.reset);

    await tester.pumpApp(const ProfilePage());
    await tester.pumpAndSettle();

    expect(find.text('Ada'), findsOneWidget);
    expect(find.text('TRUST SCORE'), findsOneWidget);
    expect(find.byIcon(KpIcons.settings), findsOneWidget);
  });

  testWidgets('tapping the trust score opens the reputation profile', (
    tester,
  ) async {
    getIt.registerFactory<ProfileCubit>(() => ProfileCubit(getProfile));
    addTearDown(getIt.reset);

    var openedTrust = false;
    await tester.pumpApp(ProfilePage(onOpenTrust: () => openedTrust = true));
    await tester.pumpAndSettle();

    await tester.tap(find.text('TRUST SCORE'));
    await tester.pump();

    expect(openedTrust, isTrue);
  });

  testWidgets('ProfilePage reflows to the three-column tablet layout', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(1500, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    getIt.registerFactory<ProfileCubit>(() => ProfileCubit(getProfile));
    addTearDown(getIt.reset);

    await tester.pumpApp(const ProfilePage());
    await tester.pumpAndSettle();

    expect(find.text('Ada'), findsOneWidget);
    expect(find.text('Achievements'), findsOneWidget);
    expect(find.text('Recent Reviews'), findsOneWidget);
  });

  testWidgets('the settings gear opens Settings with a working logout', (
    tester,
  ) async {
    getIt.registerFactory<ProfileCubit>(() => ProfileCubit(getProfile));
    addTearDown(getIt.reset);

    var loggedOut = false;
    await tester.pumpApp(ProfilePage(onLogout: () => loggedOut = true));
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(KpIcons.settings));
    await tester.pumpAndSettle();

    await tester.scrollUntilVisible(
      find.text('Log out'),
      200,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.tap(find.text('Log out'));
    expect(loggedOut, isTrue);
  });
}
