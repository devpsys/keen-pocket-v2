import 'package:core/core.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/notifications/domain/repositories/notifications_repository.dart';

/// Marks every notification read (`POST /notifications/read-all`).
@injectable
class MarkAllRead implements UseCase<void, NoParams> {
  const MarkAllRead(this._repository);

  final NotificationsRepository _repository;

  @override
  Future<Result<void>> call(NoParams params) => _repository.markAllRead();
}
