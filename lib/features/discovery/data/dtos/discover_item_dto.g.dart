// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discover_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DiscoverItemDto _$DiscoverItemDtoFromJson(Map<String, dynamic> json) =>
    _DiscoverItemDto(
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      emoji: json['emoji'] as String,
      adminName: json['admin_name'] as String,
      badge: json['badge'] as String,
      contribution: (json['contribution'] as num).toInt(),
      contributionUnit: json['contribution_unit'] as String,
      metricValue: json['metric_value'] as String,
      metricIsStartDate: json['metric_is_start_date'] as bool,
      rating: (json['rating'] as num).toDouble(),
      memberCount: (json['member_count'] as num).toInt(),
    );

Map<String, dynamic> _$DiscoverItemDtoToJson(_DiscoverItemDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'emoji': instance.emoji,
      'admin_name': instance.adminName,
      'badge': instance.badge,
      'contribution': instance.contribution,
      'contribution_unit': instance.contributionUnit,
      'metric_value': instance.metricValue,
      'metric_is_start_date': instance.metricIsStartDate,
      'rating': instance.rating,
      'member_count': instance.memberCount,
    };
