import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/session/session_manager.dart';
import 'package:keenpockets/core/session/session_user.dart';
import 'package:keenpockets/features/notifications/presentation/cubit/notifications_cubit.dart';
import 'package:keenpockets/features/notifications/presentation/cubit/notifications_state.dart';
import 'package:keenpockets/features/notifications/presentation/pages/notifications_page.dart';
import 'package:keenpockets/features/notifications/presentation/widgets/notifications_tablet_widgets.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/pump_app.dart';

class _MockSessionManager extends Mock implements SessionManager {}

void main() {
  group('NotificationsCubit', () {
    blocTest<NotificationsCubit, NotificationsState>(
      'loads items then marks all read',
      build: NotificationsCubit.new,
      act: (cubit) async {
        await cubit.load();
        cubit.markAllRead();
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
      build: NotificationsCubit.new,
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
    getIt.registerFactory<NotificationsCubit>(NotificationsCubit.new);
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
      ..registerFactory<NotificationsCubit>(NotificationsCubit.new)
      ..registerSingleton<SessionManager>(session);
    addTearDown(getIt.reset);

    await tester.pumpApp(const NotificationsPage());
    await tester.pumpAndSettle();

    expect(find.byType(NotificationsInboxTabletView), findsOneWidget);
    expect(find.text('Goal Progress'), findsOneWidget);
    expect(find.text("Mr. K's Tip:"), findsOneWidget);
  });
}
