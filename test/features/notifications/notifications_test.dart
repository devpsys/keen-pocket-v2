import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/session/session_manager.dart';
import 'package:keenpockets/core/session/session_user.dart';
import 'package:keenpockets/features/notifications/domain/entities/app_notification.dart';
import 'package:keenpockets/features/notifications/domain/usecases/get_notifications.dart';
import 'package:keenpockets/features/notifications/domain/usecases/mark_all_read.dart';
import 'package:keenpockets/features/notifications/presentation/cubit/notifications_cubit.dart';
import 'package:keenpockets/features/notifications/presentation/cubit/notifications_state.dart';
import 'package:keenpockets/features/notifications/presentation/pages/notifications_page.dart';
import 'package:keenpockets/features/notifications/presentation/widgets/notifications_tablet_widgets.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/pump_app.dart';

class _MockSessionManager extends Mock implements SessionManager {}

class _MockGetNotifications extends Mock implements GetNotifications {}

class _MockMarkAllRead extends Mock implements MarkAllRead {}

const _items = <AppNotification>[
  AppNotification(
    id: 'n1',
    kind: NotificationKind.payment,
    title: 'Payment Success',
    body: 'Your contribution was processed.',
    timeAgo: '2m ago',
    isRead: false,
    category: 'TRANSACTION',
    detailBody: 'Your ₦250 contribution to Summer Vibes was processed.',
    goalPercent: 0.82,
    savedLabel: '₦2,450.00 saved',
    targetLabel: 'Target: ₦3,000.00',
    relatedPocket: 'Summer Vibes',
    sourceAccount: 'Main Wallet (*8821)',
    mascotTip: "You're saving faster than 90% of users this month!",
  ),
  AppNotification(
    id: 'n2',
    kind: NotificationKind.member,
    title: 'New Member Joined',
    body: 'Sarah joined your group.',
    timeAgo: '45m ago',
    isRead: false,
  ),
  AppNotification(
    id: 'n3',
    kind: NotificationKind.invite,
    title: 'New Invite',
    body: 'Jake invited you.',
    timeAgo: '2h ago',
    isRead: false,
  ),
  AppNotification(
    id: 'n4',
    kind: NotificationKind.security,
    title: 'Security Alert',
    body: 'New login detected.',
    timeAgo: '4h ago',
    isRead: true,
  ),
  AppNotification(
    id: 'n5',
    kind: NotificationKind.reminder,
    title: 'Payment Reminder',
    body: 'Settle your Electric Bill.',
    timeAgo: 'Yesterday',
    isRead: true,
  ),
];

void main() {
  late _MockGetNotifications getNotifications;
  late _MockMarkAllRead markAllRead;

  setUpAll(() => registerFallbackValue(const NoParams()));

  setUp(() {
    getNotifications = _MockGetNotifications();
    markAllRead = _MockMarkAllRead();
    when(
      () => getNotifications(any()),
    ).thenAnswer((_) async => const Right(_items));
    when(() => markAllRead(any())).thenAnswer((_) async => const Right(null));
  });

  NotificationsCubit build() =>
      NotificationsCubit(getNotifications, markAllRead);

  group('NotificationsCubit', () {
    blocTest<NotificationsCubit, NotificationsState>(
      'loads items then marks all read',
      build: build,
      act: (cubit) async {
        await cubit.load();
        await cubit.markAllRead();
      },
      expect: () => [
        isA<NotificationsState>().having(
          (s) => s.status,
          'status',
          StateStatus.loading,
        ),
        isA<NotificationsState>().having(
          (s) => s.status,
          'status',
          StateStatus.success,
        ),
        isA<NotificationsState>().having(
          (s) => s.items.every((n) => n.isRead),
          'all read',
          isTrue,
        ),
      ],
    );

    blocTest<NotificationsCubit, NotificationsState>(
      'filtering to unread hides the read items',
      build: build,
      act: (cubit) async {
        await cubit.load();
        cubit.setFilter(NotificationFilter.unread);
      },
      verify: (cubit) {
        expect(cubit.state.filter, NotificationFilter.unread);
        expect(cubit.state.visible.every((n) => !n.isRead), isTrue);
        expect(cubit.state.unreadCount, 3);
      },
    );
  });

  testWidgets('phone inbox renders header, filters and cards', (tester) async {
    getIt.registerFactory<NotificationsCubit>(build);
    addTearDown(getIt.reset);

    await tester.pumpApp(const NotificationsPage());
    await tester.pumpAndSettle();

    expect(find.text('Inbox'), findsOneWidget);
    expect(find.text('Mark all read'), findsOneWidget);
    expect(find.text('Unread (3)'), findsOneWidget);
    expect(find.text('Payment Success'), findsOneWidget);
  });

  testWidgets('tablet uses the master-detail layout', (tester) async {
    tester.view.physicalSize = const Size(1600, 1200);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final session = _MockSessionManager();
    when(() => session.currentUser).thenReturn(
      const SessionUser(id: 'u1', name: 'Yusuf G.', kycVerified: true),
    );
    getIt
      ..registerFactory<NotificationsCubit>(build)
      ..registerSingleton<SessionManager>(session);
    addTearDown(getIt.reset);

    await tester.pumpApp(const NotificationsPage());
    await tester.pumpAndSettle();

    expect(find.byType(NotificationsInboxTabletView), findsOneWidget);
    expect(find.text('Goal Progress'), findsOneWidget);
    expect(find.text("Mr. K's Tip:"), findsOneWidget);
  });
}
