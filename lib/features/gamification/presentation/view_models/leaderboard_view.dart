/// Leaderboard time window (design `leaderboard_rankings`).
enum LeaderboardScope { thisWeek, allTime }

/// Movement of a ranked player since the last refresh (tablet trend arrows).
enum LeaderboardTrend { up, flat, down }

/// A top-3 podium finisher.
class PodiumEntry {
  const PodiumEntry({
    required this.rank,
    required this.name,
    required this.points,
    required this.avatarUrl,
  });

  final int rank; // 1, 2 or 3
  final String name;
  final int points;
  final String avatarUrl;
}

/// A ranked player below the podium (list row).
class LeaderboardEntry {
  const LeaderboardEntry({
    required this.rank,
    required this.name,
    required this.points,
    required this.avatarUrl,
    this.trend = LeaderboardTrend.flat,
  });

  final int rank;
  final String name;
  final int points;
  final String avatarUrl;
  final LeaderboardTrend trend;
}

/// The signed-in user's standing (phone footer + tablet rail).
class LeaderboardStanding {
  const LeaderboardStanding({
    required this.rank,
    required this.contributions,
    required this.avatarUrl,
    required this.percentile,
    required this.pointsEarned,
    required this.totalContributions,
    this.focusMode = true,
  });

  final int rank; // overall rank, e.g. 42
  final int contributions; // phone subtitle ("7 contributions")
  final String avatarUrl;
  final String percentile; // "Top 15% this week!"
  final int pointsEarned; // tablet stat ("1,240")
  final int totalContributions; // tablet stat ("12")
  final bool focusMode;
}
