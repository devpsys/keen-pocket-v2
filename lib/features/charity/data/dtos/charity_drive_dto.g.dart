// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'charity_drive_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CharityDriveDto _$CharityDriveDtoFromJson(Map<String, dynamic> json) =>
    _CharityDriveDto(
      title: json['title'] as String,
      goal: (json['goal'] as num).toInt(),
      raised: (json['raised'] as num).toInt(),
      donorCount: (json['donor_count'] as num).toInt(),
    );

Map<String, dynamic> _$CharityDriveDtoToJson(_CharityDriveDto instance) =>
    <String, dynamic>{
      'title': instance.title,
      'goal': instance.goal,
      'raised': instance.raised,
      'donor_count': instance.donorCount,
    };
