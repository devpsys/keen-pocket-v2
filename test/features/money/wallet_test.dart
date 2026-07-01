import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/feature_flags/feature.dart';
import 'package:keenpockets/core/feature_flags/feature_flag_service.dart';
import 'package:keenpockets/core/session/session_manager.dart';
import 'package:keenpockets/core/session/session_user.dart';
import 'package:keenpockets/features/money/domain/entities/wallet.dart';
import 'package:keenpockets/features/money/domain/usecases/get_wallet.dart';
import 'package:keenpockets/features/money/presentation/cubit/wallet_cubit.dart';
import 'package:keenpockets/features/money/presentation/cubit/wallet_state.dart';
import 'package:keenpockets/features/money/presentation/pages/wallet_page.dart';
import 'package:keenpockets/features/money/presentation/widgets/wallet_tablet_widgets.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/pump_app.dart';

class _MockSessionManager extends Mock implements SessionManager {}

class _MockGetWallet extends Mock implements GetWallet {}

final _wallet = Wallet(
  balance: Money.naira(12500),
  monthlyDelta: '+4.5% this month',
  spendingUsed: Money.naira(16000),
  spendingLimit: Money.naira(25000),
  mascotTip: 'Nice work',
  transactions: [
    WalletTransaction(
      id: 't1',
      label: 'Top up',
      amount: Money.naira(5000),
      isCredit: true,
      kind: WalletTxnKind.topUp,
      timeAgo: 'Today, 10:45 AM',
      balanceAfter: Money.naira(12500),
      source: 'Via Bank Transfer',
      status: WalletTxnStatus.success,
    ),
  ],
);

void main() {
  late _MockGetWallet getWallet;

  setUpAll(() => registerFallbackValue(const NoParams()));

  setUp(() {
    getWallet = _MockGetWallet();
    when(() => getWallet(any())).thenAnswer((_) async => Right(_wallet));
  });

  group('WalletCubit', () {
    blocTest<WalletCubit, WalletState>(
      'emits [loading, success] with a wallet',
      build: () => WalletCubit(getWallet),
      act: (cubit) => cubit.load(),
      expect: () => [
        isA<WalletState>().having(
          (s) => s.status,
          'status',
          StateStatus.loading,
        ),
        isA<WalletState>()
            .having((s) => s.status, 'status', StateStatus.success)
            .having((s) => s.wallet?.transactions, 'txns', isNotEmpty),
      ],
    );

    blocTest<WalletCubit, WalletState>(
      'emits [loading, failure] when the use case fails',
      setUp: () => when(
        () => getWallet(any()),
      ).thenAnswer((_) async => const Left(NetworkFailure())),
      build: () => WalletCubit(getWallet),
      act: (cubit) => cubit.load(),
      expect: () => [
        isA<WalletState>().having(
          (s) => s.status,
          'status',
          StateStatus.loading,
        ),
        isA<WalletState>().having(
          (s) => s.status,
          'status',
          StateStatus.failure,
        ),
      ],
    );
  });

  group('WalletPage flag gating', () {
    tearDown(() => getIt.reset());

    testWidgets('shows coming-soon when the wallet flag is OFF', (
      tester,
    ) async {
      getIt
        ..registerSingleton<FeatureFlagService>(FeatureFlagService())
        ..registerFactory<WalletCubit>(() => WalletCubit(getWallet));

      await tester.pumpApp(const WalletPage());
      await tester.pumpAndSettle();

      expect(find.text('Coming soon'), findsOneWidget);
      expect(find.text('Available balance'), findsNothing);
    });

    testWidgets('shows the wallet when the flag is ON', (tester) async {
      getIt
        ..registerSingleton<FeatureFlagService>(
          FeatureFlagService()..hydrate({Feature.wallet: true}),
        )
        ..registerFactory<WalletCubit>(() => WalletCubit(getWallet));

      await tester.pumpApp(const WalletPage());
      await tester.pumpAndSettle();

      expect(find.text('Available balance'), findsOneWidget);
    });

    testWidgets('tablet shows the cockpit when the flag is ON', (tester) async {
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
          FeatureFlagService()..hydrate({Feature.wallet: true}),
        )
        ..registerFactory<WalletCubit>(() => WalletCubit(getWallet))
        ..registerSingleton<SessionManager>(session);

      await tester.pumpApp(const WalletPage());
      await tester.pumpAndSettle();

      expect(find.byType(WalletTabletView), findsOneWidget);
      expect(find.text('Quick Top up'), findsOneWidget);
      expect(find.text('Spending Limit'.toUpperCase()), findsOneWidget);
    });
  });
}
