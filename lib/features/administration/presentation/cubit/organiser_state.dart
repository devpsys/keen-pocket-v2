import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:keenpockets/features/administration/presentation/view_models/organiser_view.dart';

part 'organiser_state.freezed.dart';

@freezed
abstract class OrganiserState with _$OrganiserState {
  const factory OrganiserState({
    @Default(StateStatus.initial) StateStatus status,
    OrganiserView? data,
  }) = _OrganiserState;
}
