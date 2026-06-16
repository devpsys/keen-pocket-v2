/// UI-shaped trust projections (presentation-only placeholder for now).
class RatingView {
  const RatingView({
    required this.author,
    required this.stars,
    required this.comment,
  });

  final String author;
  final int stars; // 1..5
  final String comment;
}

class TrustView {
  const TrustView({
    required this.score,
    required this.band,
    required this.kycVerified,
    required this.ratings,
  });

  final int score; // 0..100
  final String band; // e.g. "Trusted"
  final bool kycVerified;
  final List<RatingView> ratings;
}
