import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/session/session_manager.dart';
import 'package:keenpockets/core/session/session_user.dart';
import 'package:keenpockets/features/administration/presentation/cubit/admin_cubit.dart';
import 'package:keenpockets/features/administration/presentation/cubit/admin_state.dart';
import 'package:keenpockets/features/administration/presentation/pages/admin_page.dart';
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
}
