import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:keenpockets/features/trust/presentation/view_models/trust_view.dart';

part 'trust_state.freezed.dart';

@freezed
abstract class TrustState with _$TrustState {
  const factory TrustState({
    @Default(StateStatus.initial) StateStatus status,
    TrustView? trust,
    Failure? failure,
  }) = _TrustState;
}
