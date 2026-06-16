import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:keenpockets/features/pockets/domain/entities/pocket.dart';

part 'pockets_state.freezed.dart';

/// State for the pockets list. Exposes the universal [StateStatus] surface.
@freezed
abstract class PocketsState with _$PocketsState {
  const factory PocketsState({
    @Default(StateStatus.initial) StateStatus status,
    @Default(<Pocket>[]) List<Pocket> pockets,
    Failure? failure,
  }) = _PocketsState;
}
