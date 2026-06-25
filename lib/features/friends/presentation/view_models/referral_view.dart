/// Lifecycle of a referral (design `refer_earn`).
enum ReferralStatus { pending, qualified, rewarded }

/// UI-shaped referral entry in "Your Circle" (presentation-only placeholder).
class ReferralView {
  const ReferralView({
    required this.id,
    required this.name,
    required this.joinedLabel,
    required this.status,
    this.detail,
    this.rewardAmount,
  });

  final String id;
  final String name;
  final String joinedLabel; // phone: "Joined 2 days ago"
  final ReferralStatus status;
  final String? detail; // tablet subtitle: "Pending account setup"
  final String? rewardAmount; // tablet: "₦500.00" when rewarded

  /// First letter of the name for the avatar circle.
  String get initial => name.isEmpty ? '?' : name.substring(0, 1);
}
