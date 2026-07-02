import 'package:freezed_annotation/freezed_annotation.dart';

part 'referral.freezed.dart';

/// Lifecycle of a referral.
enum ReferralStatus { pending, qualified, rewarded }

/// A referred friend in "Your Circle".
@freezed
abstract class ReferralEntry with _$ReferralEntry {
  const factory ReferralEntry({
    required String id,
    required String name,
    required String joinedLabel,
    required ReferralStatus status,
    String? detail,
    String? rewardAmount,
  }) = _ReferralEntry;
}

/// The refer-&-earn summary (`GET /referrals`). Domain entity — pure Dart.
@freezed
abstract class Referral with _$Referral {
  const factory Referral({
    required String inviteLink,
    required String referralCode,
    required int invited,
    required int qualified,
    required int rewarded,
    required List<ReferralEntry> circle,
  }) = _Referral;
}
