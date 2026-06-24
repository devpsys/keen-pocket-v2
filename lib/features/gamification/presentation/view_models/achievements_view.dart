/// The kind of badge — drives its icon and accent tint.
enum AchievementBadge { reliablePayer, topOrganizer, recruiter, bigSaver }

/// An upcoming-milestone kind (tablet) — drives its icon and tint.
enum MilestoneKind { consistentContributor, groupGuardian }

/// UI-shaped gamification projections (presentation-only placeholder for now).
class BadgeView {
  const BadgeView({
    required this.id,
    required this.kind,
    required this.label,
    required this.caption,
    required this.earned,
  });

  final String id;
  final AchievementBadge kind;
  final String label;
  final String caption;
  final bool earned;
}

/// An "Upcoming Milestones" row (tablet design).
class MilestoneView {
  const MilestoneView({
    required this.kind,
    required this.label,
    required this.percent,
  });

  final MilestoneKind kind;
  final String label;
  final double percent; // 0..1
}

/// The achievements/badges screen projection (designs `my_achievements_badges`
/// / `_tablet`).
class AchievementsView {
  const AchievementsView({
    required this.streakWeeks,
    required this.streakDaysDone,
    required this.streakDaysTotal,
    required this.freezes,
    required this.earnedCount,
    required this.badges,
    this.eliteGoalDone = 0,
    this.eliteGoalTotal = 0,
    this.milestones = const [],
  });

  final int streakWeeks;
  final int streakDaysDone;
  final int streakDaysTotal;
  final int freezes;
  final int earnedCount;
  final List<BadgeView> badges;

  // Tablet motivation hero + milestones.
  final int eliteGoalDone;
  final int eliteGoalTotal;
  final List<MilestoneView> milestones;

  int get totalBadges => badges.length;

  double get streakProgress =>
      streakDaysTotal == 0 ? 0 : streakDaysDone / streakDaysTotal;
}
