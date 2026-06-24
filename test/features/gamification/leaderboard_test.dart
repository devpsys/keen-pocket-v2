import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/session/session_manager.dart';
import 'package:keenpockets/core/session/session_user.dart';
import 'package:keenpockets/features/gamification/presentation/cubit/leaderboard_cubit.dart';
import 'package:keenpockets/features/gamification/presentation/cubit/leaderboard_state.dart';
import 'package:keenpockets/features/gamification/presentation/pages/leaderboard_page.dart';
import 'package:keenpockets/features/gamification/presentation/view_models/leaderboard_view.dart';
import 'package:keenpockets/features/gamification/presentation/widgets/leaderboard_tablet_widgets.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/pump_app.dart';

class _MockSessionManager extends Mock implements SessionManager {}

void main() {
  group('LeaderboardCubit', () {
    blocTest<LeaderboardCubit, LeaderboardState>(
      'loads the podium, rows and standing',
      build: LeaderboardCubit.new,
      act: (cubit) => cubit.load(),
      verify: (cubit) {
        expect(cubit.state.status, StateStatus.success);
        expect(cubit.state.podium.length, 3);
        expect(cubit.state.rows, isNotEmpty);
        expect(cubit.state.standing?.rank, 42);
      },
    );

    blocTest<LeaderboardCubit, LeaderboardState>(
      'switches the scope',
      build: LeaderboardCubit.new,
      act: (cubit) async {
        await cubit.load();
        cubit.setScope(LeaderboardScope.allTime);
      },
      verify: (cubit) => expect(cubit.state.scope, LeaderboardScope.allTime),
    );
  });

  testWidgets('phone leaderboard renders podium, rows and standing', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(420, 1400);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    getIt.registerFactory<LeaderboardCubit>(LeaderboardCubit.new);
    addTearDown(getIt.reset);

    await tester.pumpApp(const LeaderboardPage());
    // Not pumpAndSettle: the first-place crown runs a looping bounce animation.
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 50));

    expect(find.text('Leaderboard'), findsOneWidget);
    expect(find.text('This week'), findsOneWidget);
    expect(find.text('Sarah'), findsOneWidget);
    expect(find.text('Casey'), findsOneWidget);
    expect(find.text('Your rank #42'), findsOneWidget);
  });

  testWidgets('tablet leaderboard renders the standing dashboard', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(1600, 1200);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final session = _MockSessionManager();
    when(() => session.currentUser).thenReturn(
      const SessionUser(id: 'u1', name: 'Yusuf G.', kycVerified: true),
    );
    getIt
      ..registerFactory<LeaderboardCubit>(LeaderboardCubit.new)
      ..registerSingleton<SessionManager>(session);
    addTearDown(getIt.reset);

    await tester.pumpApp(const LeaderboardPage());
    // Not pumpAndSettle: the first-place crown runs a looping bounce animation.
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 50));

    expect(find.byType(LeaderboardTabletView), findsOneWidget);
    expect(find.text('RECENTLY CLIMBED'), findsOneWidget);
    expect(find.text('Points Earned'), findsOneWidget);
    expect(find.text('#42'), findsOneWidget);
  });
}
