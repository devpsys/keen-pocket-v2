import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:keenpockets/features/notifications/presentation/view_models/notification_view.dart';

part 'notifications_state.freezed.dart';

@freezed
abstract class NotificationsState with _$NotificationsState {
  const factory NotificationsState({
    @Default(StateStatus.initial) StateStatus status,
    @Default(<NotificationView>[]) List<NotificationView> items,
  }) = _NotificationsState;
}
