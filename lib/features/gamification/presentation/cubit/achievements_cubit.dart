import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/gamification/presentation/achievements_fixtures.dart';
import 'package:keenpockets/features/gamification/presentation/cubit/achievements_state.dart';

/// PRESENTATION-ONLY: sample-backed badges/streak screen (designs
/// `my_achievements_badges` / `_tablet`). Swap for a use case later.
@injectable
class AchievementsCubit extends Cubit<AchievementsState> {
  AchievementsCubit() : super(const AchievementsState());

  Future<void> load() async {
    emit(state.copyWith(status: StateStatus.loading));
    emit(state.copyWith(status: StateStatus.success, data: kAchievements));
  }
}
