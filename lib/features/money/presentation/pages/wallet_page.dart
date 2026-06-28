import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:keenpockets/app/app_nav.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/feature_flags/feature.dart';
import 'package:keenpockets/core/feature_flags/feature_flag_service.dart';
import 'package:keenpockets/core/feature_flags/feature_guard.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/money/presentation/cubit/wallet_cubit.dart';
import 'package:keenpockets/features/money/presentation/cubit/wallet_state.dart';
import 'package:keenpockets/features/money/presentation/pages/payouts_hub_page.dart';
import 'package:keenpockets/features/money/presentation/widgets/wallet_tablet_widgets.dart';
import 'package:keenpockets/features/money/presentation/widgets/wallet_widgets.dart';

/// Wallet home (designs `wallet_home` / `_tablet`). Flag-gated: when
/// `WALLET_ENABLED` is off (the default) the coming-soon card shows instead.
class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    final enabled = getIt<FeatureFlagService>().isEnabled(Feature.wallet);
    final gated = FeatureGuard(
      enabled: enabled,
      comingSoon: KpComingSoonCard(
        title: context.l10n.comingSoonTitle,
        message: context.l10n.comingSoonMessage,
      ),
      child: BlocProvider<WalletCubit>(
        create: (_) => getIt<WalletCubit>()..load(),
        child: const _WalletView(),
      ),
    );

    if (context.isExpanded) {
      return AppTabletShell(
        body: Scaffold(
          appBar: _appBar(context, title: context.l10n.walletCockpit),
          body: gated,
        ),
      );
    }
    return Scaffold(
      appBar: _appBar(context, title: context.l10n.walletTitle),
      body: gated,
    );
  }

  PreferredSizeWidget _appBar(BuildContext context, {required String title}) {
    return AppBar(
      scrolledUnderElevation: 0,
      shape: Border(
        bottom: BorderSide(
          color: context.colorScheme.surfaceContainerHighest,
          width: 4,
        ),
      ),
      title: Text(
        title,
        style: context.textTheme.titleLarge?.copyWith(
          color: context.colorScheme.primary,
        ),
      ),
      actions: [
        IconButton(
          tooltip: context.l10n.payoutsTitle,
          onPressed: () => Navigator.of(context).push<void>(
            MaterialPageRoute(builder: (_) => const PayoutsHubPage()),
          ),
          icon: Icon(
            Icons.account_balance_rounded,
            color: context.colorScheme.primary,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            KpIcons.notificationsOutlined,
            color: context.colorScheme.primary,
          ),
        ),
      ],
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
            return context.isExpanded
                ? WalletTabletView(wallet: wallet)
                : WalletPhoneView(wallet: wallet);
          },
        );
      },
    );
  }
}
