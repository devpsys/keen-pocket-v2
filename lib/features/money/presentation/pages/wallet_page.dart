import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/feature_flags/feature.dart';
import 'package:keenpockets/core/feature_flags/feature_flag_service.dart';
import 'package:keenpockets/core/feature_flags/feature_guard.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/money/presentation/cubit/wallet_cubit.dart';
import 'package:keenpockets/features/money/presentation/cubit/wallet_state.dart';

/// Wallet home. Flag-gated: when `WALLET_ENABLED` is off (the default), the
/// coming-soon card is shown instead of the wallet UI.
class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    final enabled = getIt<FeatureFlagService>().isEnabled(Feature.wallet);
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.walletTitle)),
      body: FeatureGuard(
        enabled: enabled,
        comingSoon: KpComingSoonCard(
          title: context.l10n.comingSoonTitle,
          message: context.l10n.comingSoonMessage,
        ),
        child: BlocProvider<WalletCubit>(
          create: (_) => getIt<WalletCubit>()..load(),
          child: const _WalletView(),
        ),
      ),
    );
  }
}

class _WalletView extends StatelessWidget {
  const _WalletView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WalletCubit, WalletState>(
      builder: (context, state) {
        return KpAsyncView(
          status: state.status,
          loaded: (context) {
            final wallet = state.wallet;
            if (wallet == null) return const SizedBox.shrink();
            return ListView(
              padding: const EdgeInsets.all(KpSpacing.l),
              children: [
                Text(
                  context.l10n.walletBalance,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
                const Gap.xs(),
                Text(
                  wallet.balance.format(),
                  style: context.textTheme.displayLarge,
                ),
                const Gap.l(),
                Text(
                  context.l10n.walletTransactions,
                  style: context.textTheme.titleLarge,
                ),
                const Gap.s(),
                for (final txn in wallet.transactions)
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(
                      txn.isCredit ? Icons.south_west : Icons.north_east,
                      color: txn.isCredit
                          ? context.colors.success
                          : context.colorScheme.onSurfaceVariant,
                    ),
                    title: Text(txn.label),
                    trailing: Text(
                      '${txn.isCredit ? '+' : '-'}${txn.amount.format()}',
                      style: context.textTheme.titleMedium?.copyWith(
                        color: txn.isCredit ? context.colors.success : null,
                      ),
                    ),
                  ),
              ],
            );
          },
        );
      },
    );
  }
}
