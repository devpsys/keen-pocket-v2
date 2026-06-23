/// UI-shaped trust projections (presentation-only placeholder for now).
class RatingView {
  const RatingView({
    required this.author,
    required this.stars,
    required this.comment,
    this.context,
    this.avatarUrl,
  });

  final String author;
  final int stars; // 1..5
  final String comment;
  final String? context; // e.g. "Travel Pocket • July 2023"
  final String? avatarUrl;
}

class TrustView {
  const TrustView({
    required this.score,
    required this.band,
    required this.kycVerified,
    required this.ratings,
    this.memberName,
    this.memberSince,
    this.rank,
    this.avatarUrl,
    this.paymentReliability = 0,
    this.pocketsJoined = 0,
    this.adashisCompleted = 0,
    this.avgRating = 0,
  });

  final int score; // 0..100
  final String band; // e.g. "Trusted"
  final bool kycVerified;
  final List<RatingView> ratings;

  // Optional reputation-block extras (rendered on the profile/trust hub).
  final String? memberName;
  final String? memberSince; // e.g. "Jan 2023"
  final String? rank; // e.g. "Top 5% Contributor"
  final String? avatarUrl;
  final int paymentReliability; // 0..100 (%)
  final int pocketsJoined;
  final int adashisCompleted;
  final double avgRating; // 0..5
}
