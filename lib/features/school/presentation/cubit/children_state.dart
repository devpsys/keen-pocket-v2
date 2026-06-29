import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:keenpockets/features/school/presentation/view_models/child_view.dart';

part 'children_state.freezed.dart';

@freezed
abstract class ChildrenState with _$ChildrenState {
  const factory ChildrenState({
    @Default(StateStatus.initial) StateStatus status,
    @Default(<ChildView>[]) List<ChildView> children,
  }) = _ChildrenState;
}
