import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/feature_flags/feature.dart';
import 'package:keenpockets/core/feature_flags/feature_flag_service.dart';
import 'package:keenpockets/core/session/session_manager.dart';
import 'package:keenpockets/core/session/session_user.dart';
import 'package:keenpockets/features/money/domain/entities/payout.dart';
import 'package:keenpockets/features/money/domain/usecases/get_payouts.dart';
import 'package:keenpockets/features/money/presentation/cubit/payouts_cubit.dart';
import 'package:keenpockets/features/money/presentation/cubit/payouts_state.dart';
import 'package:keenpockets/features/money/presentation/pages/payouts_hub_page.dart';
import 'package:keenpockets/features/money/presentation/widgets/payouts_tablet_widgets.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/pump_app.dart';

class _MockSessionManager extends Mock implements SessionManager {}

class _MockGetPayouts extends Mock implements GetPayouts {}

final _hub = PayoutsHub(
  totalCollected: Money.naira(1450400),
  mascotTip: 'tip',
  bankAccounts: const [
    BankAccount(
      id: 'c1',
      label: 'Emergency Fund',
      subtitle: 'Primary Savings',
      bankName: 'Zenith Bank',
      maskedNuban: '**** 5521',
    ),
  ],
  collections: [
    PayoutCollection(
      id: 'c1',
      name: 'Emergency Fund',
      bankName: 'Zenith Bank',
      amount: Money.naira(250400),
      percent: 0.65,
    ),
  ],
  payouts: [
    Payout(
      id: 'p1',
      reference: 'KP-9921-X',
      amount: Money.naira(45000),
      status: PayoutStatus.success,
      dateLabel: 'Oct 24, 2023',
      bankName: 'Zenith Bank',
    ),
  ],
);

void main() {
  late _MockGetPayouts getPayouts;

  setUpAll(() => registerFallbackValue(const NoParams()));

  setUp(() {
    getPayouts = _MockGetPayouts();
    when(() => getPayouts(any())).thenAnswer((_) async => Right(_hub));
  });

  group('PayoutsCubit', () {
    blocTest<PayoutsCubit, PayoutsState>(
      'loads collections, payouts and total',
      build: () => PayoutsCubit(getPayouts),
      act: (cubit) => cubit.load(),
      verify: (cubit) {
        expect(cubit.state.status, StateStatus.success);
        expect(cubit.state.collections, isNotEmpty);
        expect(cubit.state.payouts, isNotEmpty);
        expect(cubit.state.totalCollected, isNotNull);
      },
    );

    blocTest<PayoutsCubit, PayoutsState>(
      'emits failure when the use case fails',
      setUp: () => when(
        () => getPayouts(any()),
      ).thenAnswer((_) async => const Left(NetworkFailure())),
      build: () => PayoutsCubit(getPayouts),
      act: (cubit) => cubit.load(),
      verify: (cubit) => expect(cubit.state.status, StateStatus.failure),
    );
  });

  group('PayoutsHubPage flag gating', () {
    tearDown(() => getIt.reset());

    testWidgets('shows coming-soon when the payouts flag is OFF', (
      tester,
    ) async {
      getIt
        ..registerSingleton<FeatureFlagService>(FeatureFlagService())
        ..registerFactory<PayoutsCubit>(() => PayoutsCubit(getPayouts));

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
        ..registerFactory<PayoutsCubit>(() => PayoutsCubit(getPayouts));

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
        ..registerFactory<PayoutsCubit>(() => PayoutsCubit(getPayouts))
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
