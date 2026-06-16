import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:keenpockets/features/adashi/presentation/view_models/adashi_view.dart';

part 'adashi_detail_state.freezed.dart';

@freezed
abstract class AdashiDetailState with _$AdashiDetailState {
  const factory AdashiDetailState({
    @Default(StateStatus.initial) StateStatus status,
    AdashiDetailView? adashi,
  }) = _AdashiDetailState;
}
