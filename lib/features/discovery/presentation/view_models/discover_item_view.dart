import 'package:core/core.dart';

/// What kind of group a discovery result is.
enum DiscoverItemType { pocket, adashi }

/// Trust/category badge shown on a discovery card.
enum DiscoverBadge { kycVerified, official, adashi }

/// UI-shaped discovery result (presentation-only placeholder for now).
class DiscoverItemView {
  const DiscoverItemView({
    required this.id,
    required this.name,
    required this.type,
    required this.emoji,
    required this.adminName,
    required this.badge,
    required this.contribution,
    required this.contributionUnit,
    required this.metricValue,
    required this.metricIsStartDate,
    required this.rating,
    required this.memberCount,
  });

  final String id;
  final String name;
  final DiscoverItemType type;

  /// Emoji shown in the card's icon tile.
  final String emoji;
  final String adminName;
  final DiscoverBadge badge;

  /// Per-cycle contribution amount and its unit suffix (e.g. "mo", "term").
  final Money contribution;
  final String contributionUnit;

  /// Secondary metric value, e.g. "18/20", "45 Joined" or a start date.
  final String metricValue;

  /// Whether [metricValue] is a start date (label "Start Date") vs members.
  final bool metricIsStartDate;

  final double rating;
  final int memberCount;
}
