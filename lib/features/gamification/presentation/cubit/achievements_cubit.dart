import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/gamification/presentation/cubit/achievements_state.dart';
import 'package:keenpockets/features/gamification/presentation/view_models/achievements_view.dart';

/// PRESENTATION-ONLY: placeholder badges + leaderboard; swap for a use case.
@injectable
class AchievementsCubit extends Cubit<AchievementsState> {
  AchievementsCubit() : super(const AchievementsState());

  Future<void> load() async {
    emit(state.copyWith(status: StateStatus.loading));
    emit(
      state.copyWith(
        status: StateStatus.success,
        data: const AchievementsView(
          badges: [
            BadgeView(id: 'b1', label: 'First Save', earned: true),
            BadgeView(id: 'b2', label: '3-Cycle Streak', earned: true),
            BadgeView(id: 'b3', label: 'Trusted Organiser', earned: false),
          ],
          leaderboard: [
            LeaderboardEntryView(
              rank: 1,
              name: 'Funke',
              keens: 1280,
              isMe: false,
            ),
            LeaderboardEntryView(rank: 2, name: 'Ada', keens: 1110, isMe: true),
            LeaderboardEntryView(
              rank: 3,
              name: 'Chidi',
              keens: 980,
              isMe: false,
            ),
          ],
        ),
      ),
    );
  }
}
