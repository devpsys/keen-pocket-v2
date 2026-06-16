import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:keenpockets/features/gamification/presentation/view_models/achievements_view.dart';

part 'achievements_state.freezed.dart';

@freezed
abstract class AchievementsState with _$AchievementsState {
  const factory AchievementsState({
    @Default(StateStatus.initial) StateStatus status,
    AchievementsView? data,
  }) = _AchievementsState;
}
