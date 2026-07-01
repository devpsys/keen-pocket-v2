import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';

/// The signed-in user's profile + reputation snapshot (domain entity).
///
/// Pure Dart — backs the `my_profile` screen. Identity (name/phone/avatar) and
/// reputation stats come from `GET /me`.
@freezed
abstract class Profile with _$Profile {
  const factory Profile({
    required String name,
    required String phone,
    required int level,

    /// 0–100 trust score shown in the ring.
    required int trustScore,

    /// Achievement tier, e.g. "Keen Pioneer".
    required String tier,

    /// Short blurb under the tier badge.
    required String tierBlurb,
    required bool kycVerified,

    /// Percentage of contributions made on time (0–100).
    required int paymentReliability,
    required int pocketsJoined,
    required int adashisCompleted,
    required double avgRating,
    String? avatarUrl,
  }) = _Profile;
}
