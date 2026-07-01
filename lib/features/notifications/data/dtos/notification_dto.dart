import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_dto.freezed.dart';
part 'notification_dto.g.dart';

/// Wire model for an inbox notification (see docs/API_SPEC.md §5).
@freezed
abstract class NotificationDto with _$NotificationDto {
  const factory NotificationDto({
    required String id,
    required String title,
    required String body,
    @JsonKey(name: 'is_read') required bool isRead,
    @JsonKey(name: 'time_ago') required String timeAgo,
    required String
    kind, // payment | member | invite | reminder | security | adashi | support
    @JsonKey(name: 'date_label') String? dateLabel,
    String? category,
    @JsonKey(name: 'detail_body') String? detailBody,
    @JsonKey(name: 'goal_percent') double? goalPercent,
    @JsonKey(name: 'saved_label') String? savedLabel,
    @JsonKey(name: 'target_label') String? targetLabel,
    @JsonKey(name: 'related_pocket') String? relatedPocket,
    @JsonKey(name: 'related_pocket_image_url') String? relatedPocketImageUrl,
    @JsonKey(name: 'source_account') String? sourceAccount,
    @JsonKey(name: 'mascot_tip') String? mascotTip,
  }) = _NotificationDto;

  factory NotificationDto.fromJson(Map<String, dynamic> json) =>
      _$NotificationDtoFromJson(json);
}
