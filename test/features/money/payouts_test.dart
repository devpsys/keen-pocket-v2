import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/feature_flags/feature.dart';
import 'package:keenpockets/core/feature_flags/feature_flag_service.dart';
import 'package:keenpockets/core/session/session_manager.dart';
import 'package:keenpockets/core/session/session_user.dart';
import 'package:keenpockets/features/money/presentation/cubit/payouts_cubit.dart';
import 'package:keenpockets/features/money/presentation/cubit/payouts_state.dart';
import 'package:keenpockets/features/money/presentation/pages/payouts_hub_page.dart';
import 'package:keenpockets/features/money/presentation/widgets/payouts_tablet_widgets.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/pump_app.dart';

class _MockSessionManager extends Mock implements SessionManager {}

void main() {
  group('PayoutsCubit', () {
    blocTest<PayoutsCubit, PayoutsState>(
      'loads collections, payouts and total',
      build: PayoutsCubit.new,
      act: (cubit) => cubit.load(),
      verify: (cubit) {
        expect(cubit.state.status, StateStatus.success);
        expect(cubit.state.collections, isNotEmpty);
        expect(cubit.state.payouts, isNotEmpty);
        expect(cubit.state.totalCollected, isNotNull);
      },
    );
  });

  group('PayoutsHubPage flag gating', () {
    tearDown(() => getIt.reset());

    testWidgets('shows coming-soon when the payouts flag is OFF', (
      tester,
    ) async {
      getIt
        ..registerSingleton<FeatureFlagService>(FeatureFlagService())
        ..registerFactory<PayoutsCubit>(PayoutsCubit.new);

      await tester.pumpApp(const PayoutsHubPage());
      await tester.pumpAndSettle();

      expect(find.text('Coming soon'), findsOneWidget);
      expect(find.text('My payout account'), findsNothing);
    });

    testWidgets('phone shows the hub when the flag is ON', (tester) async {
      tester.view.physicalSize = const Size(500, 2000);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      getIt
        ..registerSingleton<FeatureFlagService>(
          FeatureFlagService()..hydrate({Feature.payouts: true}),
        )
        ..registerFactory<PayoutsCubit>(PayoutsCubit.new);

      await tester.pumpApp(const PayoutsHubPage());
      await tester.pumpAndSettle();

      expect(find.text('My payout account'), findsOneWidget);
      expect(find.text('Emergency Fund'), findsOneWidget);
    });

    testWidgets('tablet shows the hub when the flag is ON', (tester) async {
      tester.view.physicalSize = const Size(1600, 1200);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final session = _MockSessionManager();
      when(() => session.currentUser).thenReturn(
        const SessionUser(id: 'u1', name: 'Yusuf G.', kycVerified: true),
      );
      getIt
        ..registerSingleton<FeatureFlagService>(
          FeatureFlagService()..hydrate({Feature.payouts: true}),
        )
        ..registerFactory<PayoutsCubit>(PayoutsCubit.new)
        ..registerSingleton<SessionManager>(session);

      await tester.pumpApp(const PayoutsHubPage());
      await tester.pumpAndSettle();

      expect(find.byType(PayoutsTabletView), findsOneWidget);
      expect(find.text('Pocket Collections'), findsOneWidget);
      expect(
        find.text('Total Collected This Month'.toUpperCase()),
        findsOneWidget,
      );
    });
  });
}
