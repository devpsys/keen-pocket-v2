// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationDto _$NotificationDtoFromJson(Map<String, dynamic> json) =>
    _NotificationDto(
      id: json['id'] as String,
      title: json['title'] as String,
      body: json['body'] as String,
      isRead: json['is_read'] as bool,
      timeAgo: json['time_ago'] as String,
      kind: json['kind'] as String,
      dateLabel: json['date_label'] as String?,
      category: json['category'] as String?,
      detailBody: json['detail_body'] as String?,
      goalPercent: (json['goal_percent'] as num?)?.toDouble(),
      savedLabel: json['saved_label'] as String?,
      targetLabel: json['target_label'] as String?,
      relatedPocket: json['related_pocket'] as String?,
      relatedPocketImageUrl: json['related_pocket_image_url'] as String?,
      sourceAccount: json['source_account'] as String?,
      mascotTip: json['mascot_tip'] as String?,
    );

Map<String, dynamic> _$NotificationDtoToJson(_NotificationDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'is_read': instance.isRead,
      'time_ago': instance.timeAgo,
      'kind': instance.kind,
      'date_label': instance.dateLabel,
      'category': instance.category,
      'detail_body': instance.detailBody,
      'goal_percent': instance.goalPercent,
      'saved_label': instance.savedLabel,
      'target_label': instance.targetLabel,
      'related_pocket': instance.relatedPocket,
      'related_pocket_image_url': instance.relatedPocketImageUrl,
      'source_account': instance.sourceAccount,
      'mascot_tip': instance.mascotTip,
    };
