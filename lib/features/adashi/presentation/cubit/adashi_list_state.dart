import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:keenpockets/features/adashi/presentation/view_models/adashi_view.dart';

part 'adashi_list_state.freezed.dart';

@freezed
abstract class AdashiListState with _$AdashiListState {
  const factory AdashiListState({
    @Default(StateStatus.initial) StateStatus status,
    @Default(<AdashiSummaryView>[]) List<AdashiSummaryView> circles,
  }) = _AdashiListState;
}
