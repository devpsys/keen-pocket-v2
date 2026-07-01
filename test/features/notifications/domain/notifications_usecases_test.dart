import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/features/notifications/domain/entities/app_notification.dart';
import 'package:keenpockets/features/notifications/domain/repositories/notifications_repository.dart';
import 'package:keenpockets/features/notifications/domain/usecases/get_notifications.dart';
import 'package:keenpockets/features/notifications/domain/usecases/mark_all_read.dart';
import 'package:mocktail/mocktail.dart';

class _MockNotificationsRepository extends Mock
    implements NotificationsRepository {}

const _items = <AppNotification>[
  AppNotification(
    id: 'n1',
    title: 'Payment Success',
    body: 'ok',
    isRead: false,
    timeAgo: '2m ago',
  ),
];

void main() {
  late _MockNotificationsRepository repository;

  setUp(() => repository = _MockNotificationsRepository());

  test('GetNotifications delegates and returns the inbox', () async {
    when(
      () => repository.getNotifications(),
    ).thenAnswer((_) async => const Right(_items));

    final result = await GetNotifications(repository)(const NoParams());

    expect(result.toNullable(), _items);
    verify(() => repository.getNotifications()).called(1);
  });

  test('MarkAllRead delegates to the repository', () async {
    when(
      () => repository.markAllRead(),
    ).thenAnswer((_) async => const Right(null));

    final result = await MarkAllRead(repository)(const NoParams());

    expect(result.isRight(), isTrue);
    verify(() => repository.markAllRead()).called(1);
  });

  test('GetNotifications propagates failures', () async {
    when(
      () => repository.getNotifications(),
    ).thenAnswer((_) async => const Left(NetworkFailure()));

    final result = await GetNotifications(repository)(const NoParams());

    expect(result.getLeft().toNullable(), isA<NetworkFailure>());
  });
}
