import 'package:keenpockets/features/notifications/data/dtos/notification_dto.dart';
import 'package:keenpockets/features/notifications/domain/entities/app_notification.dart';

NotificationKind _kind(String raw) => switch (raw) {
  'member' => NotificationKind.member,
  'invite' => NotificationKind.invite,
  'reminder' => NotificationKind.reminder,
  'security' => NotificationKind.security,
  'adashi' => NotificationKind.adashi,
  'support' => NotificationKind.support,
  _ => NotificationKind.payment,
};

extension NotificationDtoMapper on NotificationDto {
  AppNotification toEntity() => AppNotification(
    id: id,
    title: title,
    body: body,
    isRead: isRead,
    timeAgo: timeAgo,
    kind: _kind(kind),
    dateLabel: dateLabel,
    category: category,
    detailBody: detailBody,
    goalPercent: goalPercent,
    savedLabel: savedLabel,
    targetLabel: targetLabel,
    relatedPocket: relatedPocket,
    relatedPocketImageUrl: relatedPocketImageUrl,
    sourceAccount: sourceAccount,
    mascotTip: mascotTip,
  );
}
