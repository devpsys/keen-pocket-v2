import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/session/session_manager.dart';
import 'package:keenpockets/core/session/session_user.dart';
import 'package:keenpockets/features/administration/presentation/cubit/admin_cubit.dart';
import 'package:keenpockets/features/administration/presentation/cubit/admin_state.dart';
import 'package:keenpockets/features/administration/presentation/pages/admin_page.dart';
import 'package:keenpockets/features/administration/presentation/widgets/admin_tablet_widgets.dart';
import 'package:keenpockets/features/administration/presentation/widgets/admin_widgets.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/pump_app.dart';

class _MockSessionManager extends Mock implements SessionManager {}

void main() {
  late _MockSessionManager session;

  setUp(() => session = _MockSessionManager());

  group('AdminCubit authorization', () {
    blocTest<AdminCubit, AdminState>(
      'super-admin sees the console (success)',
      setUp: () => when(() => session.currentUser).thenReturn(
        const SessionUser(id: 'u1', name: 'Ada', isSuperAdmin: true),
      ),
      build: () => AdminCubit(session),
      act: (cubit) => cubit.load(),
      expect: () => [
        isA<AdminState>().having(
          (s) => s.status,
          'status',
          StateStatus.loading,
        ),
        isA<AdminState>()
            .having((s) => s.status, 'status', StateStatus.success)
            .having((s) => s.data, 'data', isNotNull),
      ],
    );

    blocTest<AdminCubit, AdminState>(
      'non-super-admin is denied (permissionDenied, no data loaded)',
      setUp: () => when(
        () => session.currentUser,
      ).thenReturn(const SessionUser(id: 'u2', name: 'Bem')),
      build: () => AdminCubit(session),
      act: (cubit) => cubit.load(),
      expect: () => [
        isA<AdminState>().having(
          (s) => s.status,
          'status',
          StateStatus.loading,
        ),
        isA<AdminState>()
            .having((s) => s.status, 'status', StateStatus.permissionDenied)
            .having((s) => s.data, 'data', isNull),
      ],
    );
  });

  testWidgets('AdminPage shows the permission-denied view for non-admins', (
    tester,
  ) async {
    when(
      () => session.currentUser,
    ).thenReturn(const SessionUser(id: 'u2', name: 'Bem'));
    getIt.registerFactory<AdminCubit>(() => AdminCubit(session));
    addTearDown(getIt.reset);

    await tester.pumpApp(const AdminPage());
    await tester.pumpAndSettle();

    expect(find.text("You don't have access to this area."), findsOneWidget);
  });

  testWidgets(
    'phone console renders the management sections for super-admins',
    (tester) async {
      tester.view.physicalSize = const Size(500, 2600);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      when(() => session.currentUser).thenReturn(
        const SessionUser(id: 'u1', name: 'Ada', isSuperAdmin: true),
      );
      getIt
        ..registerFactory<AdminCubit>(() => AdminCubit(session))
        ..registerSingleton<SessionManager>(session);
      addTearDown(getIt.reset);

      await tester.pumpApp(const AdminPage());
      await tester.pumpAndSettle();

      expect(find.byType(AdminConsoleView), findsOneWidget);
      expect(find.text('Super Admin Console'), findsOneWidget);
      expect(find.text('User Management'), findsOneWidget);
      expect(find.text('Keens Economy'), findsOneWidget);
      expect(find.text('Alex Rivera'), findsOneWidget);
    },
  );

  testWidgets('tablet console renders the bento split for super-admins', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(1600, 1800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    when(
      () => session.currentUser,
    ).thenReturn(const SessionUser(id: 'u1', name: 'Ada', isSuperAdmin: true));
    getIt
      ..registerFactory<AdminCubit>(() => AdminCubit(session))
      ..registerSingleton<SessionManager>(session);
    addTearDown(getIt.reset);

    await tester.pumpApp(const AdminPage());
    await tester.pumpAndSettle();

    expect(find.byType(AdminConsoleTabletView), findsOneWidget);
    expect(find.text('Keens Economy'), findsOneWidget);
  });
}
