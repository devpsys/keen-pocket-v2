import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/network/connectivity_checker.dart';
import 'package:keenpockets/features/notifications/data/datasources/notifications_remote_datasource.dart';
import 'package:keenpockets/features/notifications/data/dtos/notification_dto.dart';
import 'package:keenpockets/features/notifications/data/repositories/notifications_repository_impl.dart';
import 'package:keenpockets/features/notifications/domain/entities/app_notification.dart';
import 'package:mocktail/mocktail.dart';

class _MockRemote extends Mock implements NotificationsRemoteDataSource {}

class _MockConnectivity extends Mock implements ConnectivityChecker {}

const _dto = NotificationDto(
  id: 'n1',
  title: 'Payment Success',
  body: 'ok',
  isRead: false,
  timeAgo: '2m ago',
  kind: 'security',
);

void main() {
  late _MockRemote remote;
  late _MockConnectivity connectivity;
  late NotificationsRepositoryImpl repository;

  setUp(() {
    remote = _MockRemote();
    connectivity = _MockConnectivity();
    repository = NotificationsRepositoryImpl(remote, connectivity);
  });

  test('getNotifications returns NetworkFailure when offline', () async {
    when(() => connectivity.isConnected).thenAnswer((_) async => false);

    final result = await repository.getNotifications();

    expect(result.getLeft().toNullable(), isA<NetworkFailure>());
    verifyNever(() => remote.getNotifications());
  });

  test('getNotifications maps DTOs (incl. kind token) on success', () async {
    when(() => connectivity.isConnected).thenAnswer((_) async => true);
    when(() => remote.getNotifications()).thenAnswer((_) async => [_dto]);

    final result = await repository.getNotifications();

    expect(result.toNullable()?.single.title, 'Payment Success');
    expect(result.toNullable()?.single.kind, NotificationKind.security);
  });

  test('markAllRead succeeds when the remote call completes', () async {
    when(() => connectivity.isConnected).thenAnswer((_) async => true);
    when(() => remote.markAllRead()).thenAnswer((_) async {});

    final result = await repository.markAllRead();

    expect(result.isRight(), isTrue);
    verify(() => remote.markAllRead()).called(1);
  });

  test('markAllRead maps ServerException to ServerFailure', () async {
    when(() => connectivity.isConnected).thenAnswer((_) async => true);
    when(
      () => remote.markAllRead(),
    ).thenThrow(const ServerException('boom', statusCode: 500));

    final result = await repository.markAllRead();

    expect(result.getLeft().toNullable(), isA<ServerFailure>());
  });
}
