import 'package:core/core.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/notifications/domain/entities/app_notification.dart';
import 'package:keenpockets/features/notifications/domain/repositories/notifications_repository.dart';

/// Fetches the inbox (`GET /notifications`).
@injectable
class GetNotifications implements UseCase<List<AppNotification>, NoParams> {
  const GetNotifications(this._repository);

  final NotificationsRepository _repository;

  @override
  Future<Result<List<AppNotification>>> call(NoParams params) =>
      _repository.getNotifications();
}
