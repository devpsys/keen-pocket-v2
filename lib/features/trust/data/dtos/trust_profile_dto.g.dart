// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trust_profile_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RatingDto _$RatingDtoFromJson(Map<String, dynamic> json) => _RatingDto(
  author: json['author'] as String,
  stars: (json['stars'] as num).toInt(),
  comment: json['comment'] as String,
  context: json['context'] as String?,
  avatarUrl: json['avatar_url'] as String?,
);

Map<String, dynamic> _$RatingDtoToJson(_RatingDto instance) =>
    <String, dynamic>{
      'author': instance.author,
      'stars': instance.stars,
      'comment': instance.comment,
      'context': instance.context,
      'avatar_url': instance.avatarUrl,
    };

_TrustProfileDto _$TrustProfileDtoFromJson(Map<String, dynamic> json) =>
    _TrustProfileDto(
      score: (json['score'] as num).toInt(),
      band: json['band'] as String,
      kycVerified: json['kyc_verified'] as bool,
      ratings:
          (json['ratings'] as List<dynamic>?)
              ?.map((e) => RatingDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <RatingDto>[],
      memberName: json['member_name'] as String?,
      memberSince: json['member_since'] as String?,
      rank: json['rank'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      paymentReliability: (json['payment_reliability'] as num?)?.toInt() ?? 0,
      pocketsJoined: (json['pockets_joined'] as num?)?.toInt() ?? 0,
      adashisCompleted: (json['adashis_completed'] as num?)?.toInt() ?? 0,
      avgRating: (json['avg_rating'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$TrustProfileDtoToJson(_TrustProfileDto instance) =>
    <String, dynamic>{
      'score': instance.score,
      'band': instance.band,
      'kyc_verified': instance.kycVerified,
      'ratings': instance.ratings,
      'member_name': instance.memberName,
      'member_since': instance.memberSince,
      'rank': instance.rank,
      'avatar_url': instance.avatarUrl,
      'payment_reliability': instance.paymentReliability,
      'pockets_joined': instance.pocketsJoined,
      'adashis_completed': instance.adashisCompleted,
      'avg_rating': instance.avgRating,
    };
