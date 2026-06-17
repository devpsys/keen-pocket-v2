import 'package:core/core.dart';

/// A featured pocket summary on the dashboard's "My Pockets" rail.
class DashboardPocketView {
  const DashboardPocketView({
    required this.id,
    required this.name,
    required this.handPrice,
    required this.tag,
    required this.scheduleLabel,
  });

  final String id;
  final String name;
  final Money handPrice;
  final String tag; // e.g. "Savings"
  final String scheduleLabel; // e.g. "6 months · 2026"
}

/// A featured adashi summary on the dashboard's "My Adashi" rail.
class DashboardAdashiView {
  const DashboardAdashiView({
    required this.id,
    required this.name,
    required this.perCycle,
    required this.members,
    required this.cycleCurrent,
    required this.cycleTotal,
  });

  final String id;
  final String name;
  final Money perCycle;
  final int members;
  final int cycleCurrent;
  final int cycleTotal;
}

/// UI-shaped dashboard aggregation (presentation-only placeholder for now).
class DashboardView {
  const DashboardView({
    required this.greetingName,
    required this.totalSaved,
    required this.activePockets,
    required this.streakDays,
    required this.weeklyGoalProgress,
    this.adashiGroups = 0,
    this.reputationTier = '',
    this.walletBalance = Money.zero,
    this.freezesLeft = 0,
    this.weeklyGoalComplete = false,
    this.points = 0,
    this.badges = const [],
    this.featuredPockets = const [],
    this.featuredAdashi,
  });

  final String greetingName;
  final Money totalSaved;
  final int activePockets;
  final int streakDays;
  final double weeklyGoalProgress; // 0..1
  final int adashiGroups;
  final String reputationTier; // e.g. "Tier 1"
  final Money walletBalance;
  final int freezesLeft;
  final bool weeklyGoalComplete;
  final int points;
  final List<String> badges; // badge labels
  final List<DashboardPocketView> featuredPockets;
  final DashboardAdashiView? featuredAdashi;
}
