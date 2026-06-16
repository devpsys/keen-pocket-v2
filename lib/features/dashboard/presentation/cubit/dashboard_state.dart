import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:keenpockets/features/dashboard/presentation/view_models/dashboard_view.dart';

part 'dashboard_state.freezed.dart';

@freezed
abstract class DashboardState with _$DashboardState {
  const factory DashboardState({
    @Default(StateStatus.initial) StateStatus status,
    DashboardView? data,
  }) = _DashboardState;
}
