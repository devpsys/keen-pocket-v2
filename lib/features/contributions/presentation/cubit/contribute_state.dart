import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contribute_state.freezed.dart';

/// State for the contribute form. [status] success means the contribution was
/// submitted; [fieldErrors] carries amount validation errors.
@freezed
abstract class ContributeState with _$ContributeState {
  const factory ContributeState({
    @Default(StateStatus.initial) StateStatus status,
    Failure? failure,
    @Default(<String, String>{}) Map<String, String> fieldErrors,
  }) = _ContributeState;
}
