import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:keenpockets/features/adashi/presentation/view_models/adashi_view.dart';

part 'adashi_rotation_state.freezed.dart';

@freezed
abstract class AdashiRotationState with _$AdashiRotationState {
  const factory AdashiRotationState({
    @Default(StateStatus.initial) StateStatus status,
    AdashiRotationView? rotation,
  }) = _AdashiRotationState;
}
