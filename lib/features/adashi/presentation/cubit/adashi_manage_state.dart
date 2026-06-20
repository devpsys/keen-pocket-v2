import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:keenpockets/features/adashi/presentation/view_models/adashi_view.dart';

part 'adashi_manage_state.freezed.dart';

@freezed
abstract class AdashiManageState with _$AdashiManageState {
  const factory AdashiManageState({
    @Default(StateStatus.initial) StateStatus status,
    AdashiManageView? manage,
  }) = _AdashiManageState;
}
