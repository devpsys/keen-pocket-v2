import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:keenpockets/features/gamification/presentation/view_models/leaderboard_view.dart';

part 'leaderboard_state.freezed.dart';

@freezed
abstract class LeaderboardState with _$LeaderboardState {
  const factory LeaderboardState({
    @Default(StateStatus.initial) StateStatus status,
    @Default(LeaderboardScope.thisWeek) LeaderboardScope scope,
    @Default(<PodiumEntry>[]) List<PodiumEntry> podium,
    @Default(<LeaderboardEntry>[]) List<LeaderboardEntry> rows,
    LeaderboardStanding? standing,
  }) = _LeaderboardState;
}
