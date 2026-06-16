import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/contributions/domain/entities/invoice.dart';

/// One row in the invoice history: amount, status, optional organiser action.
class InvoiceTile extends StatelessWidget {
  const InvoiceTile({required this.invoice, this.onVerify, super.key});

  final Invoice invoice;

  /// Provided (non-null) only when the current user may verify and the invoice
  /// is pending.
  final VoidCallback? onVerify;

  ({Color fg, Color bg, String label}) _status(BuildContext context) {
    final c = context.colors;
    return switch (invoice.status) {
      InvoiceStatus.pending => (
        fg: c.onWarning,
        bg: c.warningContainer,
        label: context.l10n.invoiceStatusPending,
      ),
      InvoiceStatus.verified => (
        fg: c.onSuccess,
        bg: c.successContainer,
        label: context.l10n.invoiceStatusVerified,
      ),
      InvoiceStatus.declined => (
        fg: context.colorScheme.onErrorContainer,
        bg: context.colorScheme.errorContainer,
        label: context.l10n.invoiceStatusDeclined,
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    final s = _status(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(KpSpacing.m),
        child: Row(
          children: [
            Expanded(
              child: Text(
                invoice.total.format(),
                style: context.textTheme.titleMedium,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: KpSpacing.s,
                vertical: KpSpacing.xxs,
              ),
              decoration: BoxDecoration(
                color: s.bg,
                borderRadius: KpRadii.allS,
              ),
              child: Text(
                s.label,
                style: context.textTheme.labelSmall?.copyWith(color: s.fg),
              ),
            ),
            if (onVerify != null) ...[
              const Gap.s(horizontal: true),
              TextButton(
                onPressed: onVerify,
                child: Text(context.l10n.invoiceVerify),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
