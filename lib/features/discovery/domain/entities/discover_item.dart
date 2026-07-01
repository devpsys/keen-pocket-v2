import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'discover_item.freezed.dart';

/// What kind of group a discovery result is.
enum DiscoverItemType { pocket, adashi }

/// Trust/category badge shown on a discovery card.
enum DiscoverBadge { kycVerified, official, adashi }

/// A discovery/search result (`GET /discover`). Domain entity — pure Dart.
@freezed
abstract class DiscoverItem with _$DiscoverItem {
  const factory DiscoverItem({
    required String id,
    required String name,
    required DiscoverItemType type,
    required String emoji,
    required String adminName,
    required DiscoverBadge badge,
    required Money contribution,
    required String contributionUnit,
    required String metricValue,
    required bool metricIsStartDate,
    required double rating,
    required int memberCount,
  }) = _DiscoverItem;
}
