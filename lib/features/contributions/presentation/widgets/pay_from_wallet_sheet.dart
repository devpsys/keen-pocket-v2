import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';

/// Bottom sheet to settle an invoice from the in-app wallet (map §3: hosted by
/// `contributions`, fed by the `money` wallet balance). Presentation-only:
/// returns `true` when the user confirms the debit, else null.
class PayFromWalletSheet extends StatelessWidget {
  const PayFromWalletSheet({
    required this.walletBalance,
    required this.invoiceAmount,
    super.key,
  });

  final Money walletBalance;
  final Money invoiceAmount;

  bool get _sufficient => walletBalance.kobo >= invoiceAmount.kobo;

  static Future<bool?> show(
    BuildContext context, {
    required Money walletBalance,
    required Money invoiceAmount,
  }) {
    return showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (_) => PayFromWalletSheet(
        walletBalance: walletBalance,
        invoiceAmount: invoiceAmount,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: KpSpacing.l,
        right: KpSpacing.l,
        top: KpSpacing.s,
        bottom: KpSpacing.l + MediaQuery.viewInsetsOf(context).bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            _sufficient
                ? context.l10n.payConfirmTitle
                : context.l10n.payInsufficientTitle,
            style: context.textTheme.titleLarge?.copyWith(
              color: _sufficient ? null : context.colorScheme.error,
            ),
          ),
          const Gap.l(),
          if (_sufficient)
            ..._confirmRows(context)
          else
            ..._insufficientRows(context),
          const Gap.l(),
          if (_sufficient)
            KpButton(
              label: context.l10n.payFromWallet(invoiceAmount.format()),
              icon: Icons.arrow_forward_rounded,
              onPressed: () => Navigator.of(context).pop(true),
            )
          else
            KpButton(
              label: context.l10n.payTopUp,
              variant: KpButtonVariant.secondary,
              icon: Icons.add_rounded,
              onPressed: () => Navigator.of(context).pop(false),
            ),
          const Gap.m(),
          Text(
            context.l10n.paySecure,
            style: context.textTheme.bodySmall?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  List<Widget> _confirmRows(BuildContext context) {
    final remaining = walletBalance - invoiceAmount;
    return [
      _Row(label: context.l10n.payWalletBalance, value: walletBalance.format()),
      const Gap.s(),
      _Row(
        label: context.l10n.payInvoiceAmount,
        value: invoiceAmount.format(),
        highlight: true,
      ),
      const Divider(),
      _Row(label: context.l10n.payNewBalance, value: remaining.format()),
    ];
  }

  List<Widget> _insufficientRows(BuildContext context) {
    final short = invoiceAmount - walletBalance;
    return [
      _Row(label: context.l10n.payWalletBalance, value: walletBalance.format()),
      const Gap.s(),
      _Row(
        label: context.l10n.payRequiredAmount,
        value: invoiceAmount.format(),
        danger: true,
      ),
      const Gap.s(),
      Text(
        context.l10n.payShortfall(short.format()),
        style: context.textTheme.bodySmall?.copyWith(
          color: context.colorScheme.error,
        ),
      ),
    ];
  }
}

class _Row extends StatelessWidget {
  const _Row({
    required this.label,
    required this.value,
    this.highlight = false,
    this.danger = false,
  });

  final String label;
  final String value;
  final bool highlight;
  final bool danger;

  @override
  Widget build(BuildContext context) {
    final color = danger
        ? context.colorScheme.error
        : highlight
        ? context.colorScheme.primary
        : null;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: context.textTheme.bodyMedium?.copyWith(
            color: color ?? context.colorScheme.onSurfaceVariant,
          ),
        ),
        Text(
          value,
          style: context.textTheme.titleMedium?.copyWith(color: color),
        ),
      ],
    );
  }
}
