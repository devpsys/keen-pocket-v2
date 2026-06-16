import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:keenpockets/features/charity/presentation/view_models/charity_view.dart';

part 'charity_state.freezed.dart';

@freezed
abstract class CharityState with _$CharityState {
  const factory CharityState({
    @Default(StateStatus.initial) StateStatus status,
    CharityView? drive,
  }) = _CharityState;
}
