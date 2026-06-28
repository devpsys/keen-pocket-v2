import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/money/presentation/view_models/wallet_view.dart';
import 'package:keenpockets/features/money/presentation/wallet_fixtures.dart';
import 'package:keenpockets/features/money/presentation/widgets/wallet_widgets.dart';

/// Tablet "Wallet Cockpit" (design `wallet_home_tablet`): a balance + activity
/// column on the left and a top-up / limits / safety rail on the right. The nav
/// rail is provided by `AppTabletShell`. Presentation-only.
class WalletTabletView extends StatelessWidget {
  const WalletTabletView({
    required this.wallet,
    this.onSend,
    this.onWithdraw,
    this.onAddFunds,
    this.onViewAll,
    super.key,
  });

  final WalletView wallet;
  final VoidCallback? onSend;
  final VoidCallback? onWithdraw;
  final VoidCallback? onAddFunds;
  final VoidCallback? onViewAll;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(KpSpacing.xl),
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  _BalanceCard(
                    wallet: wallet,
                    onSend: onSend,
                    onWithdraw: onWithdraw,
                  ),
                  const Gap.l(),
                  _ActivityCard(
                    transactions: wallet.transactions,
                    onViewAll: onViewAll,
                  ),
                ],
              ),
            ),
            const Gap.l(horizontal: true),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  _QuickTopUpCard(onAddFunds: onAddFunds),
                  const Gap.l(),
                  if (wallet.spendingLimit != null)
                    _SpendingLimitCard(wallet: wallet),
                  const Gap.l(),
                  const _SafetyCard(),
                  const Gap.l(),
                  if (wallet.mascotTip != null)
                    _MascotCard(tip: wallet.mascotTip!),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _BalanceCard extends StatelessWidget {
  const _BalanceCard({required this.wallet, this.onSend, this.onWithdraw});

  final WalletView wallet;
  final VoidCallback? onSend;
  final VoidCallback? onWithdraw;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: walletCard(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.l10n.walletBalance.toUpperCase(),
                      style: context.textTheme.labelMedium?.copyWith(
                        color: context.colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const Gap.xs(),
                    Text(
                      wallet.balance.format(),
                      style: context.textTheme.displaySmall?.copyWith(
                        color: context.colorScheme.primary,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
              if (wallet.monthlyDelta != null) _DeltaChip(wallet.monthlyDelta!),
            ],
          ),
          const Gap.l(),
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: KpButton(
                    label: context.l10n.walletSend,
                    icon: Icons.send_rounded,
                    onPressed: onSend ?? () {},
                  ),
                ),
                const Gap.m(horizontal: true),
                Expanded(
                  child: KpButton(
                    label: context.l10n.walletWithdraw,
                    icon: Icons.account_balance_rounded,
                    variant: KpButtonVariant.neutral,
                    onPressed: onWithdraw ?? () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DeltaChip extends StatelessWidget {
  const _DeltaChip(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.s,
        vertical: KpSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: context.colorScheme.primaryContainer.withValues(alpha: 0.2),
        borderRadius: const BorderRadius.all(Radius.circular(KpRadii.pill)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.trending_up_rounded,
            size: KpSpacing.m,
            color: context.colorScheme.primary,
          ),
          const Gap.xxs(horizontal: true),
          Text(
            label,
            style: context.textTheme.labelSmall?.copyWith(
              color: context.colorScheme.primary,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}

class _ActivityCard extends StatelessWidget {
  const _ActivityCard({required this.transactions, this.onViewAll});

  final List<WalletTxnView> transactions;
  final VoidCallback? onViewAll;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: walletCard(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n.walletRecentActivity,
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
              TextButton(
                onPressed: onViewAll,
                child: Text(context.l10n.walletViewAll),
              ),
            ],
          ),
          const Gap.xs(),
          for (final txn in transactions)
            WalletActivityRow(txn: txn, showStatus: true),
        ],
      ),
    );
  }
}

class _QuickTopUpCard extends StatefulWidget {
  const _QuickTopUpCard({this.onAddFunds});

  final VoidCallback? onAddFunds;

  @override
  State<_QuickTopUpCard> createState() => _QuickTopUpCardState();
}

class _QuickTopUpCardState extends State<_QuickTopUpCard> {
  final _amount = TextEditingController();

  @override
  void dispose() {
    _amount.dispose();
    super.dispose();
  }

  String _label(int value) =>
      value >= 10000 ? '${value ~/ 1000}k' : Money.naira(value).format();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: walletCard(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.add_card_rounded, color: context.colorScheme.primary),
              const Gap.s(horizontal: true),
              Text(
                context.l10n.walletQuickTopUp,
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const Gap.m(),
          WalletAmountField(controller: _amount),
          const Gap.m(),
          Row(
            children: [
              for (var i = 0; i < kWalletQuickAdds.length; i++) ...[
                if (i != 0) const Gap.s(horizontal: true),
                Expanded(
                  child: _QuickChip(
                    label: _label(kWalletQuickAdds[i]),
                    onTap: () => _amount.text = '${kWalletQuickAdds[i]}',
                  ),
                ),
              ],
            ],
          ),
          const Gap.m(),
          KpButton(
            label: context.l10n.walletAddFunds,
            variant: KpButtonVariant.secondary,
            onPressed: widget.onAddFunds ?? () {},
          ),
        ],
      ),
    );
  }
}

class _QuickChip extends StatelessWidget {
  const _QuickChip({required this.label, this.onTap});

  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colorScheme.surfaceContainer,
      borderRadius: KpRadii.allM,
      child: InkWell(
        borderRadius: KpRadii.allM,
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: KpSpacing.s),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: context.textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}

class _SpendingLimitCard extends StatelessWidget {
  const _SpendingLimitCard({required this.wallet});

  final WalletView wallet;

  @override
  Widget build(BuildContext context) {
    final pct = (wallet.spendingProgress * 100).round();
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: walletCard(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n.walletSpendingLimit.toUpperCase(),
                style: context.textTheme.labelMedium?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.5,
                ),
              ),
              Text(
                context.l10n.walletPercentUsed(pct),
                style: context.textTheme.labelSmall?.copyWith(
                  color: context.colorScheme.primary,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const Gap.s(),
          KpProgressBar(
            value: wallet.spendingProgress,
            color: context.colorScheme.primary,
          ),
          const Gap.s(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _LimitStat(
                label: context.l10n.walletUsed,
                value: wallet.spendingUsed?.format() ?? '',
              ),
              _LimitStat(
                label: context.l10n.walletLimit,
                value: wallet.spendingLimit?.format() ?? '',
                alignEnd: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _LimitStat extends StatelessWidget {
  const _LimitStat({
    required this.label,
    required this.value,
    this.alignEnd = false,
  });

  final String label;
  final String value;
  final bool alignEnd;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignEnd
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.textTheme.labelSmall?.copyWith(
            color: context.colorScheme.outline,
          ),
        ),
        Text(
          value,
          style: context.textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}

class _SafetyCard extends StatelessWidget {
  const _SafetyCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: BoxDecoration(
        color: context.colorScheme.primaryContainer.withValues(alpha: 0.15),
        borderRadius: KpRadii.allXl,
        border: Border.all(color: context.colorScheme.primaryContainer),
      ),
      child: Row(
        children: [
          Icon(
            Icons.shield_rounded,
            color: context.colorScheme.primary,
            size: KpSpacing.xl,
          ),
          const Gap.m(horizontal: true),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.walletSafetyTitle,
                  style: context.textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const Gap.xxs(),
                Text(
                  context.l10n.walletSafetyBody,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MascotCard extends StatelessWidget {
  const _MascotCard({required this.tip});

  final String tip;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainer,
        borderRadius: KpRadii.allXl,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: KpSpacing.xl,
            height: KpSpacing.xl,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: context.colorScheme.primaryContainer,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.face_rounded,
              color: context.colorScheme.onPrimaryContainer,
            ),
          ),
          const Gap.m(horizontal: true),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.walletMrKSays.toUpperCase(),
                  style: context.textTheme.labelSmall?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.5,
                  ),
                ),
                const Gap.xxs(),
                Text(
                  tip,
                  style: context.textTheme.bodySmall?.copyWith(
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
