import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/feature_flags/feature.dart';
import 'package:keenpockets/core/feature_flags/feature_flag_service.dart';
import 'package:keenpockets/core/session/session_manager.dart';
import 'package:keenpockets/core/session/session_user.dart';
import 'package:keenpockets/features/school/presentation/cubit/children_cubit.dart';
import 'package:keenpockets/features/school/presentation/cubit/children_state.dart';
import 'package:keenpockets/features/school/presentation/pages/my_children_page.dart';
import 'package:keenpockets/features/school/presentation/widgets/my_children_widgets.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/pump_app.dart';

class _MockSessionManager extends Mock implements SessionManager {}

void main() {
  blocTest<ChildrenCubit, ChildrenState>(
    'emits [loading, success] with linked children',
    build: ChildrenCubit.new,
    act: (cubit) => cubit.load(),
    expect: () => [
      isA<ChildrenState>().having(
        (s) => s.status,
        'status',
        StateStatus.loading,
      ),
      isA<ChildrenState>()
          .having((s) => s.status, 'status', StateStatus.success)
          .having((s) => s.children.length, 'children', greaterThan(0)),
    ],
  );

  group('MyChildrenPage flag gating (backend-gap, built dark)', () {
    tearDown(() => getIt.reset());

    testWidgets('shows coming-soon when the SCHOOL flag is OFF', (
      tester,
    ) async {
      getIt
        ..registerSingleton<FeatureFlagService>(FeatureFlagService())
        ..registerFactory<ChildrenCubit>(ChildrenCubit.new);

      await tester.pumpApp(const MyChildrenPage());
      await tester.pumpAndSettle();

      expect(find.text('Coming soon'), findsOneWidget);
    });

    testWidgets('phone lists children with plan footers when ON', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(500, 2400);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      getIt
        ..registerSingleton<FeatureFlagService>(
          FeatureFlagService()..hydrate({Feature.school: true}),
        )
        ..registerFactory<ChildrenCubit>(ChildrenCubit.new);

      await tester.pumpApp(const MyChildrenPage());
      await tester.pumpAndSettle();

      expect(find.byType(MyChildrenPhoneView), findsOneWidget);
      expect(find.text('Adekunle Johnson'), findsOneWidget);
      expect(find.text('Pay Fees'), findsWidgets);
      expect(find.text('Paid Up'), findsWidgets);
    });

    testWidgets('tablet shows the grid and Lock-In banner when ON', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(1600, 1600);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final session = _MockSessionManager();
      when(() => session.currentUser).thenReturn(
        const SessionUser(id: 'u1', name: 'Yusuf G.', kycVerified: true),
      );
      getIt
        ..registerSingleton<FeatureFlagService>(
          FeatureFlagService()..hydrate({Feature.school: true}),
        )
        ..registerFactory<ChildrenCubit>(ChildrenCubit.new)
        ..registerSingleton<SessionManager>(session);

      await tester.pumpApp(const MyChildrenPage());
      await tester.pumpAndSettle();

      expect(find.byType(MyChildrenTabletView), findsOneWidget);
      expect(find.byType(SmartSavingsBanner), findsOneWidget);
      expect(find.text('My Children'), findsOneWidget);
    });
  });
}
