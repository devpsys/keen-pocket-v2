import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:keenpockets/features/notifications/presentation/view_models/notification_view.dart';

part 'notifications_state.freezed.dart';

/// Inbox filter (design `notifications_inbox`): all cases vs unread only.
enum NotificationFilter { all, unread }

@freezed
abstract class NotificationsState with _$NotificationsState {
  const factory NotificationsState({
    @Default(StateStatus.initial) StateStatus status,
    @Default(<NotificationView>[]) List<NotificationView> items,
    @Default(NotificationFilter.all) NotificationFilter filter,
    String? selectedId,
    Failure? failure,
  }) = _NotificationsState;

  const NotificationsState._();

  int get unreadCount => items.where((n) => !n.isRead).length;

  List<NotificationView> get visible => switch (filter) {
    NotificationFilter.all => items,
    NotificationFilter.unread => items.where((n) => !n.isRead).toList(),
  };
}
