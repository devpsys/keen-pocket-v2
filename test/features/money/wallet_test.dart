import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/feature_flags/feature.dart';
import 'package:keenpockets/core/feature_flags/feature_flag_service.dart';
import 'package:keenpockets/core/session/session_manager.dart';
import 'package:keenpockets/core/session/session_user.dart';
import 'package:keenpockets/features/money/presentation/cubit/wallet_cubit.dart';
import 'package:keenpockets/features/money/presentation/cubit/wallet_state.dart';
import 'package:keenpockets/features/money/presentation/pages/wallet_page.dart';
import 'package:keenpockets/features/money/presentation/widgets/wallet_tablet_widgets.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/pump_app.dart';

class _MockSessionManager extends Mock implements SessionManager {}

void main() {
  group('WalletCubit', () {
    blocTest<WalletCubit, WalletState>(
      'emits [loading, success] with a wallet',
      build: WalletCubit.new,
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
  });

  group('WalletPage flag gating', () {
    tearDown(() => getIt.reset());

    testWidgets('shows coming-soon when the wallet flag is OFF', (
      tester,
    ) async {
      getIt
        ..registerSingleton<FeatureFlagService>(FeatureFlagService())
        ..registerFactory<WalletCubit>(WalletCubit.new);

      await tester.pumpApp(const WalletPage());
      await tester.pumpAndSettle();

      // Default flags have wallet OFF → coming-soon, no balance label.
      expect(find.text('Coming soon'), findsOneWidget);
      expect(find.text('Available balance'), findsNothing);
    });

    testWidgets('shows the wallet when the flag is ON', (tester) async {
      getIt
        ..registerSingleton<FeatureFlagService>(
          FeatureFlagService()..hydrate({Feature.wallet: true}),
        )
        ..registerFactory<WalletCubit>(WalletCubit.new);

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
        ..registerFactory<WalletCubit>(WalletCubit.new)
        ..registerSingleton<SessionManager>(session);

      await tester.pumpApp(const WalletPage());
      await tester.pumpAndSettle();

      expect(find.byType(WalletTabletView), findsOneWidget);
      expect(find.text('Quick Top up'), findsOneWidget);
      expect(find.text('Spending Limit'.toUpperCase()), findsOneWidget);
    });
  });
}
