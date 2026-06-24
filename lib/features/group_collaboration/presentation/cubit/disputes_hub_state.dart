import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:keenpockets/features/group_collaboration/presentation/view_models/dispute_view.dart';

part 'disputes_hub_state.freezed.dart';

@freezed
abstract class DisputesHubState with _$DisputesHubState {
  const factory DisputesHubState({
    @Default(StateStatus.initial) StateStatus status,
    @Default(<DisputeView>[]) List<DisputeView> disputes,
    @Default(false) bool adminView,
    String? selectedId,
    int? resolvedThisMonth,
    String? avgResolution,
  }) = _DisputesHubState;
}
