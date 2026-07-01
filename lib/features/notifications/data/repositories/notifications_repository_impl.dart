import 'package:core/core.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/core/network/connectivity_checker.dart';
import 'package:keenpockets/features/notifications/data/datasources/notifications_remote_datasource.dart';
import 'package:keenpockets/features/notifications/data/mappers/notification_mapper.dart';
import 'package:keenpockets/features/notifications/domain/entities/app_notification.dart';
import 'package:keenpockets/features/notifications/domain/repositories/notifications_repository.dart';

@LazySingleton(as: NotificationsRepository, env: ['prod', 'staging'])
class NotificationsRepositoryImpl implements NotificationsRepository {
  const NotificationsRepositoryImpl(this._remote, this._connectivity);

  final NotificationsRemoteDataSource _remote;
  final ConnectivityChecker _connectivity;

  @override
  Future<Result<List<AppNotification>>> getNotifications() async {
    if (!await _connectivity.isConnected) {
      return const Left(NetworkFailure());
    }
    try {
      final dtos = await _remote.getNotifications();
      return Right(dtos.map((d) => d.toEntity()).toList());
    } on AppException catch (e) {
      return Left(_mapException(e));
    }
  }

  @override
  Future<Result<void>> markAllRead() async {
    if (!await _connectivity.isConnected) {
      return const Left(NetworkFailure());
    }
    try {
      await _remote.markAllRead();
      return const Right(null);
    } on AppException catch (e) {
      return Left(_mapException(e));
    }
  }

  Failure _mapException(AppException e) => switch (e) {
    NetworkException() => NetworkFailure(message: e.message, cause: e),
    UnauthorizedException() => AuthFailure(message: e.message, cause: e),
    ValidationException() => ValidationFailure(
      message: e.message,
      fieldErrors: e.fieldErrors,
      cause: e,
    ),
    CacheException() => CacheFailure(message: e.message, cause: e),
    ServerException() => ServerFailure(
      message: e.message,
      statusCode: e.statusCode,
      cause: e,
    ),
  };
}
