import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/notifications/data/dtos/notification_dto.dart';

/// Remote notifications API. The only notifications code that touches HTTP.
abstract interface class NotificationsRemoteDataSource {
  Future<List<NotificationDto>> getNotifications();
  Future<void> markAllRead();
}

@LazySingleton(as: NotificationsRemoteDataSource, env: ['prod', 'staging'])
class NotificationsRemoteDataSourceImpl
    implements NotificationsRemoteDataSource {
  const NotificationsRemoteDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<List<NotificationDto>> getNotifications() async {
    try {
      final response = await _dio.get<List<dynamic>>('/notifications');
      return (response.data ?? <dynamic>[])
          .map((e) => NotificationDto.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }

  @override
  Future<void> markAllRead() async {
    try {
      await _dio.post<void>('/notifications/read-all');
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }
}
