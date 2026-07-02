// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'referral_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReferralStatsDto _$ReferralStatsDtoFromJson(Map<String, dynamic> json) =>
    _ReferralStatsDto(
      invited: (json['invited'] as num).toInt(),
      qualified: (json['qualified'] as num).toInt(),
      rewarded: (json['rewarded'] as num).toInt(),
      earned: (json['earned'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ReferralStatsDtoToJson(_ReferralStatsDto instance) =>
    <String, dynamic>{
      'invited': instance.invited,
      'qualified': instance.qualified,
      'rewarded': instance.rewarded,
      'earned': instance.earned,
    };

_ReferralEntryDto _$ReferralEntryDtoFromJson(Map<String, dynamic> json) =>
    _ReferralEntryDto(
      id: json['id'] as String,
      name: json['name'] as String,
      joinedLabel: json['joined_label'] as String,
      status: json['status'] as String,
      detail: json['detail'] as String?,
      rewardAmount: json['reward_amount'] as String?,
    );

Map<String, dynamic> _$ReferralEntryDtoToJson(_ReferralEntryDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'joined_label': instance.joinedLabel,
      'status': instance.status,
      'detail': instance.detail,
      'reward_amount': instance.rewardAmount,
    };

_ReferralDto _$ReferralDtoFromJson(Map<String, dynamic> json) => _ReferralDto(
  inviteUrl: json['invite_url'] as String,
  inviteCode: json['invite_code'] as String,
  stats: ReferralStatsDto.fromJson(json['stats'] as Map<String, dynamic>),
  circle:
      (json['circle'] as List<dynamic>?)
          ?.map((e) => ReferralEntryDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <ReferralEntryDto>[],
);

Map<String, dynamic> _$ReferralDtoToJson(_ReferralDto instance) =>
    <String, dynamic>{
      'invite_url': instance.inviteUrl,
      'invite_code': instance.inviteCode,
      'stats': instance.stats,
      'circle': instance.circle,
    };
