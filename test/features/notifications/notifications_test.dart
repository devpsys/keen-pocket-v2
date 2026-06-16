import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/features/notifications/presentation/cubit/notifications_cubit.dart';
import 'package:keenpockets/features/notifications/presentation/cubit/notifications_state.dart';
import 'package:keenpockets/features/notifications/presentation/pages/notifications_page.dart';

import '../../helpers/pump_app.dart';

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
  });

  testWidgets('NotificationsPage renders the inbox', (tester) async {
    getIt.registerFactory<NotificationsCubit>(NotificationsCubit.new);
    addTearDown(getIt.reset);

    await tester.pumpApp(const NotificationsPage());
    await tester.pumpAndSettle();

    expect(find.text('Contribution verified'), findsOneWidget);
    expect(find.text('Mark all read'), findsOneWidget);
  });
}
