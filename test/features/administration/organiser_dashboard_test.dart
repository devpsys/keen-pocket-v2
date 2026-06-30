import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/session/session_manager.dart';
import 'package:keenpockets/core/session/session_user.dart';
import 'package:keenpockets/features/administration/presentation/cubit/organiser_cubit.dart';
import 'package:keenpockets/features/administration/presentation/cubit/organiser_state.dart';
import 'package:keenpockets/features/administration/presentation/pages/organiser_dashboard_page.dart';
import 'package:keenpockets/features/administration/presentation/widgets/organiser_tablet_widgets.dart';
import 'package:keenpockets/features/administration/presentation/widgets/organiser_widgets.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/pump_app.dart';

class _MockSessionManager extends Mock implements SessionManager {}

void main() {
  blocTest<OrganiserCubit, OrganiserState>(
    'emits [loading, success] with the organiser dashboard',
    build: OrganiserCubit.new,
    act: (cubit) => cubit.load(),
    expect: () => [
      isA<OrganiserState>().having(
        (s) => s.status,
        'status',
        StateStatus.loading,
      ),
      isA<OrganiserState>()
          .having((s) => s.status, 'status', StateStatus.success)
          .having((s) => s.data?.pockets.length, 'pockets', greaterThan(0)),
    ],
  );

  group('OrganiserDashboardPage', () {
    tearDown(() => getIt.reset());

    testWidgets('phone renders the hero, stats and pocket health', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(500, 3000);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      getIt.registerFactory<OrganiserCubit>(OrganiserCubit.new);

      await tester.pumpApp(const OrganiserDashboardPage());
      await tester.pumpAndSettle();

      expect(find.byType(OrganiserDashboardView), findsOneWidget);
      expect(find.text('Pocket Health Dashboard'), findsOneWidget);
      expect(find.text('Lagos Techies Cycle'), findsOneWidget);
      expect(find.text('Pulse Checklist'), findsOneWidget);
    });

    testWidgets('tablet renders the wide dashboard', (tester) async {
      tester.view.physicalSize = const Size(1600, 2200);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final session = _MockSessionManager();
      when(() => session.currentUser).thenReturn(
        const SessionUser(id: 'u1', name: 'Ada', isSuperAdmin: true),
      );
      getIt
        ..registerFactory<OrganiserCubit>(OrganiserCubit.new)
        ..registerSingleton<SessionManager>(session);

      await tester.pumpApp(const OrganiserDashboardPage());
      await tester.pumpAndSettle();

      expect(find.byType(OrganiserDashboardTabletView), findsOneWidget);
      expect(find.text('Pocket Health Dashboard'), findsOneWidget);
    });
  });
}
