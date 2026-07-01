import 'package:core/core.dart';

import 'package:keenpockets/features/discovery/data/dtos/discover_item_dto.dart';
import 'package:keenpockets/features/discovery/domain/entities/discover_item.dart';

DiscoverItemType _type(String raw) =>
    raw == 'adashi' ? DiscoverItemType.adashi : DiscoverItemType.pocket;

DiscoverBadge _badge(String raw) => switch (raw) {
  'official' => DiscoverBadge.official,
  'adashi' => DiscoverBadge.adashi,
  _ => DiscoverBadge.kycVerified,
};

extension DiscoverItemDtoMapper on DiscoverItemDto {
  DiscoverItem toEntity() => DiscoverItem(
    id: id,
    name: name,
    type: _type(type),
    emoji: emoji,
    adminName: adminName,
    badge: _badge(badge),
    contribution: Money(contribution),
    contributionUnit: contributionUnit,
    metricValue: metricValue,
    metricIsStartDate: metricIsStartDate,
    rating: rating,
    memberCount: memberCount,
  );
}
