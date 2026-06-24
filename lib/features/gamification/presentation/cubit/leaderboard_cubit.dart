import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/gamification/presentation/cubit/leaderboard_state.dart';
import 'package:keenpockets/features/gamification/presentation/leaderboard_fixtures.dart';
import 'package:keenpockets/features/gamification/presentation/view_models/leaderboard_view.dart';

/// PRESENTATION-ONLY: sample-backed leaderboard (designs `leaderboard_rankings`
/// / `_tablet`). Swap for a real ranking use case when the API exists.
@injectable
class LeaderboardCubit extends Cubit<LeaderboardState> {
  LeaderboardCubit() : super(const LeaderboardState());

  Future<void> load() async {
    emit(state.copyWith(status: StateStatus.loading));
    emit(
      state.copyWith(
        status: StateStatus.success,
        podium: kLeaderboardPodium,
        rows: kLeaderboardRows,
        standing: kLeaderboardStanding,
      ),
    );
  }

  void setScope(LeaderboardScope scope) => emit(state.copyWith(scope: scope));
}
