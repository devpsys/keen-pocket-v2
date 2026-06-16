import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:keenpockets/features/pockets/domain/entities/pocket.dart';

part 'pocket_detail_state.freezed.dart';

/// State for a single pocket's detail view. [role] is the current user's role
/// in the loaded pocket (drives permission-aware UI).
@freezed
abstract class PocketDetailState with _$PocketDetailState {
  const factory PocketDetailState({
    @Default(StateStatus.initial) StateStatus status,
    Pocket? pocket,
    @Default(PocketRole.guest) PocketRole role,
    Failure? failure,
  }) = _PocketDetailState;
}
