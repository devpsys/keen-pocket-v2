import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:keenpockets/features/plans/presentation/view_models/plan_view.dart';

part 'plans_state.freezed.dart';

@freezed
abstract class PlansState with _$PlansState {
  const factory PlansState({
    @Default(StateStatus.initial) StateStatus status,
    @Default(<PlanView>[]) List<PlanView> plans,
    Failure? failure,
  }) = _PlansState;
}
