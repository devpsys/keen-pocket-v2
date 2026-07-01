// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileDto _$ProfileDtoFromJson(Map<String, dynamic> json) => _ProfileDto(
  name: json['full_name'] as String,
  phone: json['phone'] as String,
  level: (json['level'] as num).toInt(),
  trustScore: (json['trust_score'] as num).toInt(),
  tier: json['tier'] as String,
  tierBlurb: json['tier_blurb'] as String,
  kycVerified: json['kyc_verified'] as bool,
  paymentReliability: (json['payment_reliability'] as num).toInt(),
  pocketsJoined: (json['pockets_joined'] as num).toInt(),
  adashisCompleted: (json['adashis_completed'] as num).toInt(),
  avgRating: (json['avg_rating'] as num).toDouble(),
  avatarUrl: json['avatar_url'] as String?,
);

Map<String, dynamic> _$ProfileDtoToJson(_ProfileDto instance) =>
    <String, dynamic>{
      'full_name': instance.name,
      'phone': instance.phone,
      'level': instance.level,
      'trust_score': instance.trustScore,
      'tier': instance.tier,
      'tier_blurb': instance.tierBlurb,
      'kyc_verified': instance.kycVerified,
      'payment_reliability': instance.paymentReliability,
      'pockets_joined': instance.pocketsJoined,
      'adashis_completed': instance.adashisCompleted,
      'avg_rating': instance.avgRating,
      'avatar_url': instance.avatarUrl,
    };
