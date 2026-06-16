/// UI-shaped gamification projections (presentation-only placeholder for now).
class BadgeView {
  const BadgeView({
    required this.id,
    required this.label,
    required this.earned,
  });

  final String id;
  final String label;
  final bool earned;
}

class LeaderboardEntryView {
  const LeaderboardEntryView({
    required this.rank,
    required this.name,
    required this.keens,
    required this.isMe,
  });

  final int rank;
  final String name;
  final int keens;
  final bool isMe;
}

class AchievementsView {
  const AchievementsView({required this.badges, required this.leaderboard});

  final List<BadgeView> badges;
  final List<LeaderboardEntryView> leaderboard;
}
