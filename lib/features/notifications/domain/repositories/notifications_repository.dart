import 'package:core/core.dart';

import 'package:keenpockets/features/notifications/domain/entities/app_notification.dart';

/// Reads the inbox and marks notifications read (see docs/API_SPEC.md §5).
abstract interface class NotificationsRepository {
  Future<Result<List<AppNotification>>> getNotifications();
  Future<Result<void>> markAllRead();
}
