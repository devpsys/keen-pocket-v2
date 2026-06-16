import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/feature_flags/feature.dart';
import 'package:keenpockets/core/feature_flags/feature_flag_service.dart';
import 'package:keenpockets/features/money/presentation/cubit/wallet_cubit.dart';
import 'package:keenpockets/features/money/presentation/cubit/wallet_state.dart';
import 'package:keenpockets/features/money/presentation/pages/wallet_page.dart';

import '../../helpers/pump_app.dart';

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
  });
}
