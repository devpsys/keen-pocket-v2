/// UI-shaped profile projection. Identity comes from the session; the rest is
/// presentation-only placeholder until the trust/gamification data lands.
class ProfileView {
  const ProfileView({
    required this.name,
    required this.phone,
    required this.level,
    required this.trustScore,
    required this.tier,
    required this.tierBlurb,
    required this.kycVerified,
    required this.paymentReliability,
    required this.pocketsJoined,
    required this.adashisCompleted,
    required this.avgRating,
  });

  final String name;
  final String phone;
  final int level;

  /// 0–100 trust score shown in the ring.
  final int trustScore;

  /// Achievement tier, e.g. "Keen Pioneer".
  final String tier;

  /// Short blurb under the tier badge.
  final String tierBlurb;

  final bool kycVerified;

  /// Percentage of contributions made on time.
  final int paymentReliability;
  final int pocketsJoined;
  final int adashisCompleted;
  final double avgRating;
}
