import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/money/presentation/view_models/wallet_view.dart';

/// Icon + circle tint for a wallet activity kind (shared phone + tablet).
({IconData icon, Color tint, Color fg}) walletTxnStyle(
  BuildContext context,
  WalletTxnKind kind,
) {
  return switch (kind) {
    WalletTxnKind.topUp => (
      icon: Icons.account_balance_wallet_rounded,
      tint: context.colorScheme.secondaryContainer,
      fg: context.colorScheme.onSecondaryContainer,
    ),
    WalletTxnKind.payment => (
      icon: Icons.shopping_bag_rounded,
      tint: context.colorScheme.primaryContainer,
      fg: context.colorScheme.onPrimaryContainer,
    ),
    WalletTxnKind.refund => (
      icon: Icons.keyboard_return_rounded,
      tint: context.colorScheme.tertiaryContainer,
      fg: context.colorScheme.onTertiaryContainer,
    ),
  };
}

/// Label + colours for a transaction status pill (tablet activity rows).
({Color bg, Color fg, String label}) walletStatusStyle(
  BuildContext context,
  WalletTxnStatus status,
) {
  return switch (status) {
    WalletTxnStatus.success => (
      bg: context.colors.successContainer,
      fg: context.colors.success,
      label: context.l10n.walletStatusSuccess,
    ),
    WalletTxnStatus.settled => (
      bg: context.colorScheme.surfaceContainerHighest,
      fg: context.colorScheme.onSurfaceVariant,
      label: context.l10n.walletStatusSettled,
    ),
    WalletTxnStatus.refunded => (
      bg: context.colorScheme.tertiaryContainer,
      fg: context.colorScheme.onTertiaryContainer,
      label: context.l10n.walletStatusRefunded,
    ),
  };
}

/// White "candy" card: 2px outline + a flat 7px bottom shadow (design
/// `wallet_home`).
BoxDecoration walletCard(BuildContext context) {
  return BoxDecoration(
    color: context.colorScheme.surface,
    borderRadius: KpRadii.allXl,
    border: Border.all(
      color: context.colorScheme.surfaceContainerHighest,
      width: 2,
    ),
    boxShadow: [
      BoxShadow(
        color: context.colorScheme.surfaceContainerHighest,
        offset: const Offset(0, 7),
      ),
    ],
  );
}

/// Phone wallet home (design `wallet_home`).
class WalletPhoneView extends StatelessWidget {
  const WalletPhoneView({
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
      padding: const EdgeInsets.fromLTRB(
        KpSpacing.m,
        KpSpacing.l,
        KpSpacing.m,
        KpSpacing.xxl,
      ),
      children: [
        WalletBalanceCard(
          balance: wallet.balance,
          onSend: onSend,
          onWithdraw: onWithdraw,
        ),
        const Gap.xl(),
        _SectionHeader(
          icon: Icons.add_circle_rounded,
          label: context.l10n.walletTopUp,
        ),
        const Gap.m(),
        WalletTopUpCard(onAddFunds: onAddFunds),
        const Gap.xl(),
        Row(
          children: [
            Expanded(
              child: _SectionHeader(
                icon: Icons.history_rounded,
                label: context.l10n.walletRecentActivity,
              ),
            ),
            TextButton(
              onPressed: onViewAll,
              child: Text(context.l10n.walletViewAll),
            ),
          ],
        ),
        const Gap.s(),
        for (final txn in wallet.transactions) ...[
          WalletActivityRow(txn: txn),
          const Gap.m(),
        ],
      ],
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: context.colorScheme.primary),
        const Gap.s(horizontal: true),
        Text(
          label,
          style: context.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}

/// Gradient balance card with Send / Withdraw (design `wallet_home`).
class WalletBalanceCard extends StatelessWidget {
  const WalletBalanceCard({
    required this.balance,
    this.onSend,
    this.onWithdraw,
    super.key,
  });

  final Money balance;
  final VoidCallback? onSend;
  final VoidCallback? onWithdraw;

  @override
  Widget build(BuildContext context) {
    final onPrimary = context.colorScheme.onPrimary;
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [KpColors.brand200, KpColors.brand500],
        ),
        borderRadius: KpRadii.allXl,
        border: Border(
          bottom: BorderSide(
            color: context.colorScheme.onPrimaryContainer,
            width: 7,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.walletBalance,
            style: context.textTheme.labelLarge?.copyWith(
              color: onPrimary.withValues(alpha: 0.9),
              fontWeight: FontWeight.w800,
            ),
          ),
          const Gap.xxs(),
          Text(
            balance.format(),
            style: context.textTheme.displaySmall?.copyWith(
              color: onPrimary,
              fontWeight: FontWeight.w900,
            ),
          ),
          const Gap.l(),
          Row(
            children: [
              _GlassButton(
                icon: Icons.send_rounded,
                label: context.l10n.walletSend,
                onTap: onSend,
              ),
              const Gap.s(horizontal: true),
              _GlassButton(
                icon: Icons.payments_rounded,
                label: context.l10n.walletWithdraw,
                onTap: onWithdraw,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _GlassButton extends StatelessWidget {
  const _GlassButton({required this.icon, required this.label, this.onTap});

  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final onPrimary = context.colorScheme.onPrimary;
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: KpRadii.allM,
        boxShadow: [
          BoxShadow(
            color: KpColors.neutral1000.withValues(alpha: 0.2),
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: onPrimary.withValues(alpha: 0.2),
        borderRadius: KpRadii.allM,
        child: InkWell(
          borderRadius: KpRadii.allM,
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: KpSpacing.m,
              vertical: KpSpacing.s,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, color: onPrimary, size: KpSpacing.l),
                const Gap.xs(horizontal: true),
                Text(
                  label,
                  style: context.textTheme.labelLarge?.copyWith(
                    color: onPrimary,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Top-up amount field + Add Funds + safety note (design `wallet_home`).
class WalletTopUpCard extends StatefulWidget {
  const WalletTopUpCard({this.onAddFunds, super.key});

  final VoidCallback? onAddFunds;

  @override
  State<WalletTopUpCard> createState() => _WalletTopUpCardState();
}

class _WalletTopUpCardState extends State<WalletTopUpCard> {
  final _amount = TextEditingController(text: '5000');

  @override
  void dispose() {
    _amount.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: walletCard(context),
      child: Column(
        children: [
          WalletAmountField(controller: _amount),
          const Gap.m(),
          KpButton(
            label: context.l10n.walletAddFunds,
            onPressed: widget.onAddFunds ?? () {},
          ),
          const Gap.m(),
          const WalletSafetyNote(),
        ],
      ),
    );
  }
}

/// Currency input with a ₦ prefix (design `wallet_home`).
class WalletAmountField extends StatelessWidget {
  const WalletAmountField({required this.controller, super.key});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      style: context.textTheme.headlineSmall?.copyWith(
        fontWeight: FontWeight.w800,
      ),
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: KpSpacing.m, right: KpSpacing.s),
          child: Text(
            '₦',
            style: context.textTheme.headlineSmall?.copyWith(
              color: context.colorScheme.primary,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        prefixIconConstraints: const BoxConstraints(),
        hintText: '0.00',
      ),
    );
  }
}

/// "Your transactions are safe" reassurance row (design `wallet_home`).
class WalletSafetyNote extends StatelessWidget {
  const WalletSafetyNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.s),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainer,
        borderRadius: KpRadii.allM,
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(KpSpacing.xs),
            decoration: BoxDecoration(
              color: context.colorScheme.surface,
              borderRadius: KpRadii.allS,
            ),
            child: Icon(
              Icons.shield_rounded,
              color: context.colorScheme.primary,
              size: KpSpacing.l,
            ),
          ),
          const Gap.s(horizontal: true),
          Expanded(
            child: Text(
              context.l10n.walletSafetyNote,
              style: context.textTheme.bodySmall?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// A recent-activity row (design `wallet_home`). [showStatus] swaps the phone's
/// "Balance: …" caption for the tablet's source + status pill.
class WalletActivityRow extends StatelessWidget {
  const WalletActivityRow({
    required this.txn,
    this.showStatus = false,
    super.key,
  });

  final WalletTxnView txn;
  final bool showStatus;

  @override
  Widget build(BuildContext context) {
    final style = walletTxnStyle(context, txn.kind);
    final amountColor = txn.isCredit
        ? context.colors.success
        : context.colorScheme.onSurfaceVariant;
    final sign = txn.isCredit ? '+' : '-';
    return Container(
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: showStatus ? null : walletCard(context),
      child: Row(
        children: [
          Container(
            width: KpSpacing.xl,
            height: KpSpacing.xl,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: style.tint.withValues(alpha: 0.2),
              borderRadius: KpRadii.allM,
            ),
            child: Icon(style.icon, color: style.fg),
          ),
          const Gap.m(horizontal: true),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  txn.label,
                  style: context.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Gap.xxs(),
                Text(
                  showStatus && txn.source != null
                      ? '${txn.source} • ${txn.timeAgo}'
                      : txn.timeAgo,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: context.colorScheme.outline,
                  ),
                ),
              ],
            ),
          ),
          const Gap.s(horizontal: true),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '$sign${txn.amount.format()}',
                style: context.textTheme.titleMedium?.copyWith(
                  color: amountColor,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const Gap.xxs(),
              if (showStatus && txn.status != null)
                _StatusPill(status: txn.status!)
              else if (txn.balanceAfter != null)
                Text(
                  context.l10n.walletBalanceAfter(txn.balanceAfter!.format()),
                  style: context.textTheme.labelSmall?.copyWith(
                    color: context.colorScheme.outline,
                    fontWeight: FontWeight.w800,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatusPill extends StatelessWidget {
  const _StatusPill({required this.status});

  final WalletTxnStatus status;

  @override
  Widget build(BuildContext context) {
    final s = walletStatusStyle(context, status);
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.s,
        vertical: KpSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: s.bg,
        borderRadius: const BorderRadius.all(Radius.circular(KpRadii.pill)),
      ),
      child: Text(
        s.label.toUpperCase(),
        style: context.textTheme.labelSmall?.copyWith(
          color: s.fg,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
