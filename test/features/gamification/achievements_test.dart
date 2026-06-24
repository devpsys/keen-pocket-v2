import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/session/session_manager.dart';
import 'package:keenpockets/core/session/session_user.dart';
import 'package:keenpockets/features/gamification/presentation/cubit/achievements_cubit.dart';
import 'package:keenpockets/features/gamification/presentation/cubit/achievements_state.dart';
import 'package:keenpockets/features/gamification/presentation/pages/achievements_page.dart';
import 'package:keenpockets/features/gamification/presentation/widgets/achievements_tablet_widgets.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/pump_app.dart';

class _MockSessionManager extends Mock implements SessionManager {}

void main() {
  group('AchievementsCubit', () {
    blocTest<AchievementsCubit, AchievementsState>(
      'emits [loading, success] with streak and badges',
      build: AchievementsCubit.new,
      act: (cubit) => cubit.load(),
      expect: () => [
        isA<AchievementsState>().having(
          (s) => s.status,
          'status',
          StateStatus.loading,
        ),
        isA<AchievementsState>()
            .having((s) => s.status, 'status', StateStatus.success)
            .having((s) => s.data?.badges, 'badges', isNotEmpty)
            .having((s) => s.data?.streakWeeks, 'streak', 5),
      ],
    );
  });

  testWidgets('phone renders streak, freezes and badges', (tester) async {
    tester.view.physicalSize = const Size(420, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    getIt.registerFactory<AchievementsCubit>(AchievementsCubit.new);
    addTearDown(getIt.reset);

    await tester.pumpApp(const AchievementsPage());
    await tester.pumpAndSettle();

    expect(find.text('CURRENT MOMENTUM'), findsOneWidget);
    expect(find.text('Your Badges'), findsOneWidget);
    expect(find.text('3 / 4 Earned'), findsOneWidget);
    expect(find.text('🏅 Reliable Payer'), findsOneWidget);
  });

  testWidgets('tablet renders the two-column dashboard', (tester) async {
    tester.view.physicalSize = const Size(1600, 1200);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final session = _MockSessionManager();
    when(() => session.currentUser).thenReturn(
      const SessionUser(id: 'u1', name: 'Yusuf G.', kycVerified: true),
    );
    getIt
      ..registerFactory<AchievementsCubit>(AchievementsCubit.new)
      ..registerSingleton<SessionManager>(session);
    addTearDown(getIt.reset);

    await tester.pumpApp(const AchievementsPage());
    await tester.pumpAndSettle();

    expect(find.byType(AchievementsTabletView), findsOneWidget);
    expect(find.text('Upcoming Milestones'), findsOneWidget);
    expect(find.text("You're on a roll!"), findsOneWidget);
  });
}
