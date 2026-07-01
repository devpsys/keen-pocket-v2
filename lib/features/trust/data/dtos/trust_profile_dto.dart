import 'package:freezed_annotation/freezed_annotation.dart';

part 'trust_profile_dto.freezed.dart';
part 'trust_profile_dto.g.dart';

/// Wire model for a peer rating (see docs/API_SPEC.md §3).
@freezed
abstract class RatingDto with _$RatingDto {
  const factory RatingDto({
    required String author,
    required int stars,
    required String comment,
    String? context,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
  }) = _RatingDto;

  factory RatingDto.fromJson(Map<String, dynamic> json) =>
      _$RatingDtoFromJson(json);
}

/// Wire model for `GET /me/trust` (see docs/API_SPEC.md §3).
@freezed
abstract class TrustProfileDto with _$TrustProfileDto {
  const factory TrustProfileDto({
    required int score,
    required String band,
    @JsonKey(name: 'kyc_verified') required bool kycVerified,
    @Default(<RatingDto>[]) List<RatingDto> ratings,
    @JsonKey(name: 'member_name') String? memberName,
    @JsonKey(name: 'member_since') String? memberSince,
    String? rank,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'payment_reliability') @Default(0) int paymentReliability,
    @JsonKey(name: 'pockets_joined') @Default(0) int pocketsJoined,
    @JsonKey(name: 'adashis_completed') @Default(0) int adashisCompleted,
    @JsonKey(name: 'avg_rating') @Default(0) double avgRating,
  }) = _TrustProfileDto;

  factory TrustProfileDto.fromJson(Map<String, dynamic> json) =>
      _$TrustProfileDtoFromJson(json);
}
