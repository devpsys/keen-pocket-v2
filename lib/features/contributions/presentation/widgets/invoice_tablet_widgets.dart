import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/core/widgets/kp_network_image.dart';
import 'package:keenpockets/features/contributions/presentation/widgets/contribute_fixtures.dart';
import 'package:keenpockets/features/contributions/presentation/widgets/invoice_fixtures.dart';

/// Tablet ledger header: a candy card with a rounded-square portrait, the title
/// and a subtitle (design `invoice_history_tablet`).
class InvoiceLedgerHeaderTablet extends StatelessWidget {
  const InvoiceLedgerHeaderTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLowest,
        borderRadius: KpRadii.allXl,
        border: Border(
          bottom: BorderSide(
            color: context.colorScheme.surfaceContainerHighest,
            width: 7,
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: KpRadii.allL,
              border: Border.all(
                color: context.colorScheme.primaryContainer,
                width: 2,
              ),
            ),
            child: const KpNetworkImage(
              url: kContributeAvatarUrl,
              width: 80,
              height: 80,
              borderRadius: KpRadii.allL,
            ),
          ),
          const Gap.l(horizontal: true),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.invoiceLedgerTitle,
                  style: context.textTheme.titleLarge,
                ),
                const Gap.xxs(),
                Text(
                  context.l10n.invoiceLedgerSubtitle,
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w400,
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

/// The big payment-history card: header + segmented filter, a columned table,
/// and a centred download footer (design `invoice_history_tablet`).
class InvoicePaymentTableTablet extends StatelessWidget {
  const InvoicePaymentTableTablet({
    required this.rows,
    required this.filter,
    required this.onFilter,
    required this.onDownload,
    super.key,
  });

  final List<InvoiceTableRow> rows;
  final InvoiceFilter filter;
  final ValueChanged<InvoiceFilter> onFilter;
  final VoidCallback onDownload;

  @override
  Widget build(BuildContext context) {
    final divider = context.colorScheme.surfaceContainerHighest;
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLowest,
        borderRadius: KpRadii.allXl,
        border: Border(bottom: BorderSide(color: divider, width: 7)),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(KpSpacing.l),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    context.l10n.invoicePaymentHistory,
                    style: context.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                _SegmentedFilter(selected: filter, onSelected: onFilter),
              ],
            ),
          ),
          Container(height: 1, color: divider),
          _Table(rows: rows),
          Container(height: 1, color: divider),
          ColoredBox(
            color: context.colorScheme.surfaceContainerLow,
            child: Padding(
              padding: const EdgeInsets.all(KpSpacing.m),
              child: Center(
                child: TextButton.icon(
                  onPressed: onDownload,
                  icon: const Icon(Icons.download_rounded),
                  label: Text(
                    context.l10n.invoiceDownloadReport,
                    style: context.textTheme.bodySmall?.copyWith(
                      color: context.colorScheme.primary,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SegmentedFilter extends StatelessWidget {
  const _SegmentedFilter({required this.selected, required this.onSelected});

  final InvoiceFilter selected;
  final ValueChanged<InvoiceFilter> onSelected;

  @override
  Widget build(BuildContext context) {
    final labels = {
      InvoiceFilter.all: context.l10n.invoiceFilterAll,
      InvoiceFilter.paid: context.l10n.invoiceFilterPaid,
      InvoiceFilter.pending: context.l10n.invoiceFilterPending,
    };
    return Container(
      padding: const EdgeInsets.all(KpSpacing.xxs),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainer,
        borderRadius: KpRadii.allM,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final f in InvoiceFilter.values)
            GestureDetector(
              onTap: () => onSelected(f),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: KpSpacing.m,
                  vertical: KpSpacing.xs,
                ),
                decoration: BoxDecoration(
                  color: f == selected
                      ? context.colorScheme.surfaceContainerLowest
                      : KpColors.transparent,
                  borderRadius: KpRadii.allS,
                  border: f == selected
                      ? Border(
                          bottom: BorderSide(
                            color: context.colorScheme.primary,
                            width: 2,
                          ),
                        )
                      : null,
                ),
                child: Text(
                  labels[f]!,
                  style: context.textTheme.labelMedium?.copyWith(
                    color: f == selected
                        ? context.colorScheme.primary
                        : context.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _Table extends StatelessWidget {
  const _Table({required this.rows});

  final List<InvoiceTableRow> rows;

  @override
  Widget build(BuildContext context) {
    final divider = context.colorScheme.surfaceContainerHighest;
    // Horizontally scrollable (design `overflow-x-auto`): columns size to their
    // content so rows never wrap; the table still fills the card when there's
    // room (minWidth) and scrolls sideways when the content is wider.
    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: ConstrainedBox(
          constraints: BoxConstraints(minWidth: constraints.maxWidth),
          child: Table(
            defaultColumnWidth: const IntrinsicColumnWidth(),
            border: TableBorder(horizontalInside: BorderSide(color: divider)),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(
                decoration: BoxDecoration(
                  color: context.colorScheme.surfaceContainerLowest,
                ),
                children: [
                  _HeaderCell(context.l10n.invoiceColInvoice),
                  _HeaderCell(context.l10n.invoiceColDate),
                  _HeaderCell(context.l10n.invoiceColMethod),
                  _HeaderCell(context.l10n.invoiceColAmount),
                  _HeaderCell(context.l10n.invoiceColStatus),
                ],
              ),
              for (final row in rows)
                TableRow(
                  children: [
                    _Cell(
                      child: Text(
                        row.ref,
                        softWrap: false,
                        style: context.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    _Cell(
                      child: Text(
                        row.date,
                        softWrap: false,
                        style: context.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: context.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                    _Cell(child: _MethodCell(method: row.method)),
                    _Cell(
                      child: Text(
                        row.amount.format(),
                        softWrap: false,
                        style: context.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    _Cell(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: _StatusBadge(status: row.status),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeaderCell extends StatelessWidget {
  const _HeaderCell(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.m,
        vertical: KpSpacing.s,
      ),
      child: Text(
        label.toUpperCase(),
        style: context.textTheme.labelSmall?.copyWith(
          color: context.colorScheme.outline,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

class _Cell extends StatelessWidget {
  const _Cell({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.m,
        vertical: KpSpacing.m,
      ),
      child: child,
    );
  }
}

class _MethodCell extends StatelessWidget {
  const _MethodCell({required this.method});

  final InvoiceMethod method;

  @override
  Widget build(BuildContext context) {
    final (icon, color, label) = switch (method) {
      InvoiceMethod.directTransfer => (
        Icons.account_balance_rounded,
        context.colorScheme.primary,
        context.l10n.invoiceMethodDirectTransfer,
      ),
      InvoiceMethod.keenWallet => (
        KpIcons.wallet,
        KpColors.gold600,
        context.l10n.invoiceMethodKeenWallet,
      ),
      InvoiceMethod.cardPayment => (
        Icons.payments_rounded,
        context.colorScheme.primary,
        context.l10n.invoiceMethodCardPayment,
      ),
    };
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: KpSpacing.l, color: color),
        const Gap.xs(horizontal: true),
        Text(
          label,
          softWrap: false,
          style: context.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.status});

  final InvoiceLedgerStatus status;

  @override
  Widget build(BuildContext context) {
    final (bg, fg, label) = switch (status) {
      InvoiceLedgerStatus.paid => (
        context.colors.successContainer,
        context.colors.success,
        context.l10n.invoiceStatusPaid,
      ),
      InvoiceLedgerStatus.pending => (
        KpColors.gold100,
        KpColors.gold600,
        context.l10n.invoiceStatusPending,
      ),
      InvoiceLedgerStatus.overdue => (
        context.colorScheme.errorContainer,
        context.colorScheme.onErrorContainer,
        context.l10n.invoiceStatusOverdue,
      ),
    };
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.s,
        vertical: KpSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: const BorderRadius.all(Radius.circular(KpRadii.pill)),
      ),
      child: Text(
        label.toUpperCase(),
        style: context.textTheme.labelSmall?.copyWith(
          color: fg,
          letterSpacing: 0.3,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

/// Mr K's financial-tip card (tablet, brand-tinted with a title).
class InvoiceTipCardTablet extends StatelessWidget {
  const InvoiceTipCardTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: BoxDecoration(
        color: context.colorScheme.primaryContainer.withValues(alpha: 0.18),
        borderRadius: KpRadii.allXl,
        border: const Border(
          bottom: BorderSide(color: KpColors.brand300, width: 7),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const KpMascot.celebrate(size: 56),
          const Gap.m(horizontal: true),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.invoiceTipTitle,
                  style: context.textTheme.titleSmall?.copyWith(
                    color: context.colorScheme.primary,
                  ),
                ),
                const Gap.xxs(),
                Text(
                  context.l10n.invoiceTipTabletBody,
                  style: context.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
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

/// Tablet pending-approval card: name, amount, sender and verify/decline
/// (design `invoice_history_tablet`).
class InvoiceApprovalCardTablet extends StatelessWidget {
  const InvoiceApprovalCardTablet({
    required this.approval,
    required this.onVerify,
    required this.onDecline,
    super.key,
  });

  final InvoiceApproval approval;
  final VoidCallback onVerify;
  final VoidCallback onDecline;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLowest,
        borderRadius: KpRadii.allXl,
        border: Border(
          bottom: BorderSide(
            color: context.colorScheme.surfaceContainerHighest,
            width: 7,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      approval.groupName,
                      style: context.textTheme.titleSmall,
                    ),
                    const Gap.xxs(),
                    Text(
                      approval.amount.format(),
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.colorScheme.primary,
                      ),
                    ),
                    const Gap.xxs(),
                    Text(
                      context.l10n.invoiceSentBy(approval.sentBy),
                      style: context.textTheme.labelSmall?.copyWith(
                        color: context.colorScheme.outline,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(KpSpacing.s),
                decoration: BoxDecoration(
                  color: context.colorScheme.surfaceContainer,
                  borderRadius: KpRadii.allM,
                ),
                child: Icon(
                  Icons.verified_user_outlined,
                  color: context.colorScheme.primary,
                ),
              ),
            ],
          ),
          const Gap.m(),
          Row(
            children: [
              Expanded(
                child: KpButton(
                  label: context.l10n.invoiceVerify,
                  dense: true,
                  onPressed: onVerify,
                ),
              ),
              const Gap.s(horizontal: true),
              Expanded(
                child: KpButton(
                  label: context.l10n.invoiceDecline,
                  variant: KpButtonVariant.neutral,
                  dense: true,
                  onPressed: onDecline,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Tablet urgent-action card: "DUE IN 24H", the amount and a Mark-Paid CTA,
/// over a faint dotted backdrop (design `invoice_history_tablet`).
class InvoiceUrgentCardTablet extends StatelessWidget {
  const InvoiceUrgentCardTablet({
    required this.urgent,
    required this.onMarkPaid,
    super.key,
  });

  final InvoiceUrgent urgent;
  final VoidCallback onMarkPaid;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        color: KpColors.tertiary100,
        borderRadius: KpRadii.allXl,
        border: Border(
          bottom: BorderSide(color: KpColors.tertiary300, width: 7),
        ),
      ),
      child: CustomPaint(
        painter: const _DotPatternPainter(),
        child: Padding(
          padding: const EdgeInsets.all(KpSpacing.l),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.priority_high_rounded,
                    size: KpSpacing.l,
                    color: KpColors.tertiary500,
                  ),
                  const Gap.xs(horizontal: true),
                  Text(
                    context.l10n.invoiceDueIn24h,
                    style: context.textTheme.labelMedium?.copyWith(
                      color: KpColors.tertiary500,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
              const Gap.xs(),
              Text(
                urgent.name,
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Gap.xxs(),
              Text(
                urgent.amount.format(),
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w900,
                ),
              ),
              const Gap.m(),
              KpButton(
                label: context.l10n.invoiceMarkPaid,
                variant: KpButtonVariant.error,
                icon: Icons.payments_outlined,
                onPressed: onMarkPaid,
                dense: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DotPatternPainter extends CustomPainter {
  const _DotPatternPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = KpColors.tertiary500.withValues(alpha: 0.08);
    const step = 10.0;
    for (var y = 0.0; y < size.height; y += step) {
      for (var x = 0.0; x < size.width; x += step) {
        canvas.drawCircle(Offset(x, y), 1, paint);
      }
    }
  }

  @override
  bool shouldRepaint(_DotPatternPainter oldDelegate) => false;
}
