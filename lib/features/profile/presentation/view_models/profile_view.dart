/// UI-shaped profile projection. Identity comes from the session; the rest is
/// presentation-only placeholder until the trust/gamification data lands.
class ProfileView {
  const ProfileView({
    required this.name,
    required this.reputation,
    required this.keens,
    required this.kycVerified,
  });

  final String name;
  final String reputation; // e.g. "Trusted"
  final int keens;
  final bool kycVerified;
}
