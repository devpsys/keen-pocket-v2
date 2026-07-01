import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_notification.freezed.dart';

/// Category of a notification — drives the icon, emoji and accent tint.
enum NotificationKind {
  payment,
  member,
  invite,
  reminder,
  security,
  adashi,
  support,
}

/// An inbox notification (`GET /notifications`). Domain entity — pure Dart.
@freezed
abstract class AppNotification with _$AppNotification {
  const factory AppNotification({
    required String id,
    required String title,
    required String body,
    required bool isRead,
    required String timeAgo,
    @Default(NotificationKind.payment) NotificationKind kind,
    String? dateLabel,
    String? category,
    String? detailBody,
    double? goalPercent, // 0..1
    String? savedLabel,
    String? targetLabel,
    String? relatedPocket,
    String? relatedPocketImageUrl,
    String? sourceAccount,
    String? mascotTip,
  }) = _AppNotification;
}
