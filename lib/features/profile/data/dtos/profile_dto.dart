import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_dto.freezed.dart';
part 'profile_dto.g.dart';

/// Wire model for `GET /me` (see docs/API_SPEC.md §2).
@freezed
abstract class ProfileDto with _$ProfileDto {
  const factory ProfileDto({
    @JsonKey(name: 'full_name') required String name,
    required String phone,
    required int level,
    @JsonKey(name: 'trust_score') required int trustScore,
    required String tier,
    @JsonKey(name: 'tier_blurb') required String tierBlurb,
    @JsonKey(name: 'kyc_verified') required bool kycVerified,
    @JsonKey(name: 'payment_reliability') required int paymentReliability,
    @JsonKey(name: 'pockets_joined') required int pocketsJoined,
    @JsonKey(name: 'adashis_completed') required int adashisCompleted,
    @JsonKey(name: 'avg_rating') required double avgRating,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
  }) = _ProfileDto;

  factory ProfileDto.fromJson(Map<String, dynamic> json) =>
      _$ProfileDtoFromJson(json);
}
