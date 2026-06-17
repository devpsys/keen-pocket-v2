import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/session/session_manager.dart';
import 'package:keenpockets/core/session/session_user.dart';
import 'package:keenpockets/features/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:keenpockets/features/dashboard/presentation/cubit/dashboard_state.dart';
import 'package:keenpockets/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/pump_app.dart';

class _MockSessionManager extends Mock implements SessionManager {}

void main() {
  late _MockSessionManager session;

  setUp(() {
    session = _MockSessionManager();
    when(
      () => session.currentUser,
    ).thenReturn(const SessionUser(id: 'u1', name: 'Ada'));
  });

  group('DashboardCubit', () {
    blocTest<DashboardCubit, DashboardState>(
      'emits [loading, success] with the greeting from the session',
      build: () => DashboardCubit(session),
      act: (cubit) => cubit.load(),
      expect: () => [
        isA<DashboardState>().having(
          (s) => s.status,
          'status',
          StateStatus.loading,
        ),
        isA<DashboardState>()
            .having((s) => s.status, 'status', StateStatus.success)
            .having((s) => s.data?.greetingName, 'name', 'Ada'),
      ],
    );
  });

  testWidgets('DashboardPage renders the greeting and stat tiles', (
    tester,
  ) async {
    getIt.registerFactory<DashboardCubit>(() => DashboardCubit(session));
    addTearDown(getIt.reset);

    await tester.pumpApp(const DashboardPage());
    await tester.pumpAndSettle();

    expect(find.text('Hello, Ada'), findsOneWidget);
    expect(find.text('TOTAL SAVED'), findsOneWidget);
  });

  testWidgets('DashboardPage reflows to the wide tablet layout', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(1400, 1000);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    getIt.registerFactory<DashboardCubit>(() => DashboardCubit(session));
    addTearDown(getIt.reset);

    await tester.pumpApp(const DashboardPage());
    await tester.pumpAndSettle();

    // Greeting + both section headers render in the two-column wide layout.
    expect(find.textContaining('Hello, Ada'), findsOneWidget);
    expect(find.text('My Pockets'), findsOneWidget);
    expect(find.text('My Adashi'), findsOneWidget);
  });
}
