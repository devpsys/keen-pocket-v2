import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:keenpockets/features/discovery/presentation/view_models/discover_item_view.dart';

part 'discovery_state.freezed.dart';

@freezed
abstract class DiscoveryState with _$DiscoveryState {
  const factory DiscoveryState({
    @Default(StateStatus.initial) StateStatus status,
    @Default('') String query,
    @Default(<DiscoverItemView>[]) List<DiscoverItemView> results,
  }) = _DiscoveryState;
}
