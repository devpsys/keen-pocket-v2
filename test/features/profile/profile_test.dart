import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/session/session_manager.dart';
import 'package:keenpockets/core/session/session_user.dart';
import 'package:keenpockets/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:keenpockets/features/profile/presentation/cubit/profile_state.dart';
import 'package:keenpockets/features/profile/presentation/pages/profile_page.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/pump_app.dart';

class _MockSessionManager extends Mock implements SessionManager {}

void main() {
  late _MockSessionManager session;

  setUp(() {
    session = _MockSessionManager();
    when(
      () => session.currentUser,
    ).thenReturn(const SessionUser(id: 'u1', name: 'Ada', kycVerified: true));
  });

  group('ProfileCubit', () {
    blocTest<ProfileCubit, ProfileState>(
      'derives the profile name from the session',
      build: () => ProfileCubit(session),
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
  });

  testWidgets('ProfilePage shows the identity and trust score', (tester) async {
    getIt.registerFactory<ProfileCubit>(() => ProfileCubit(session));
    addTearDown(getIt.reset);

    await tester.pumpApp(const ProfilePage());
    await tester.pumpAndSettle();

    expect(find.text('Ada'), findsOneWidget);
    expect(find.text('TRUST SCORE'), findsOneWidget);
    expect(find.byIcon(KpIcons.settings), findsOneWidget);
  });

  testWidgets('ProfilePage reflows to the three-column tablet layout', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(1500, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    getIt.registerFactory<ProfileCubit>(() => ProfileCubit(session));
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
    getIt.registerFactory<ProfileCubit>(() => ProfileCubit(session));
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
