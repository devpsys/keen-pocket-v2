import 'package:freezed_annotation/freezed_annotation.dart';

part 'trust_profile.freezed.dart';

/// A single peer rating on a member's reputation.
@freezed
abstract class Rating with _$Rating {
  const factory Rating({
    required String author,
    required int stars, // 1..5
    required String comment,
    String? context, // e.g. "Travel Pocket • July 2023"
    String? avatarUrl,
  }) = _Rating;
}

/// A member's reputation profile (`GET /me/trust` or `/users/{id}/trust`).
@freezed
abstract class TrustProfile with _$TrustProfile {
  const factory TrustProfile({
    required int score, // 0..100
    required String band, // e.g. "Excellent"
    required bool kycVerified,
    required List<Rating> ratings,
    String? memberName,
    String? memberSince,
    String? rank,
    String? avatarUrl,
    @Default(0) int paymentReliability, // 0..100
    @Default(0) int pocketsJoined,
    @Default(0) int adashisCompleted,
    @Default(0) double avgRating, // 0..5
  }) = _TrustProfile;
}
