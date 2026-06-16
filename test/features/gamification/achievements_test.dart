import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/features/gamification/presentation/cubit/achievements_cubit.dart';
import 'package:keenpockets/features/gamification/presentation/cubit/achievements_state.dart';
import 'package:keenpockets/features/gamification/presentation/pages/achievements_page.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('AchievementsCubit', () {
    blocTest<AchievementsCubit, AchievementsState>(
      'emits [loading, success] with badges and leaderboard',
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
            .having((s) => s.data?.leaderboard, 'leaderboard', isNotEmpty),
      ],
    );
  });

  testWidgets('AchievementsPage renders badges and leaderboard', (
    tester,
  ) async {
    getIt.registerFactory<AchievementsCubit>(AchievementsCubit.new);
    addTearDown(getIt.reset);

    await tester.pumpApp(const AchievementsPage());
    await tester.pumpAndSettle();

    expect(find.text('Badges'), findsOneWidget);
    expect(find.text('Leaderboard'), findsOneWidget);
    expect(find.text('First Save'), findsOneWidget);
  });
}
