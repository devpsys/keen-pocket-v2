import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
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

  testWidgets('ProfilePage shows the name and a working logout link', (
    tester,
  ) async {
    getIt.registerFactory<ProfileCubit>(() => ProfileCubit(session));
    addTearDown(getIt.reset);

    var loggedOut = false;
    await tester.pumpApp(ProfilePage(onLogout: () => loggedOut = true));
    await tester.pumpAndSettle();

    expect(find.text('Ada'), findsOneWidget);
    expect(find.text('Wallet'), findsOneWidget);

    await tester.tap(find.text('Log out'));
    expect(loggedOut, isTrue);
  });
}
