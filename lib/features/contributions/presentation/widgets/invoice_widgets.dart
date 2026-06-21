import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/core/widgets/kp_network_image.dart';
import 'package:keenpockets/features/contributions/presentation/widgets/contribute_fixtures.dart';
import 'package:keenpockets/features/contributions/presentation/widgets/invoice_fixtures.dart';

/// White candy card (7px flat bottom border) used across the ledger.
class _LedgerCard extends StatelessWidget {
  const _LedgerCard({required this.child});

  final Widget child;

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
      child: child,
    );
  }
}

/// Hero header (design `invoice_history`): a candy card with the user's
/// blue-ringed portrait, a "TOP SAVER" badge, the title and a subtitle.
class InvoiceLedgerHeader extends StatelessWidget {
  const InvoiceLedgerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return _LedgerCard(
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 80,
                height: 80,
                padding: const EdgeInsets.all(KpSpacing.xxs),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: context.colorScheme.primaryContainer,
                    width: 4,
                  ),
                ),
                child: const KpNetworkAvatar(
                  url: kContributeAvatarUrl,
                  radius: 36,
                ),
              ),
              Positioned(
                bottom: -4,
                right: -4,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: KpSpacing.xs,
                    vertical: KpSpacing.xxs,
                  ),
                  decoration: BoxDecoration(
                    color: KpColors.gold500,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(KpRadii.pill),
                    ),
                    border: Border.all(
                      color: context.colorScheme.surfaceContainerLowest,
                      width: 2,
                    ),
                  ),
                  child: Text(
                    context.l10n.invoiceTopSaver,
                    style: context.textTheme.labelSmall?.copyWith(
                      color: KpColors.gold600,
                      fontSize: 10,
                      letterSpacing: 0.3,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Gap.m(),
          Text(
            context.l10n.invoiceLedgerTitle,
            textAlign: TextAlign.center,
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colorScheme.primary,
              fontWeight: FontWeight.w900,
            ),
          ),
          const Gap.xs(),
          Text(
            context.l10n.invoiceLedgerSubtitle,
            textAlign: TextAlign.center,
            style: context.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w400,
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

/// A section heading with a leading accent icon.
class InvoiceSectionHeading extends StatelessWidget {
  const InvoiceSectionHeading({
    required this.icon,
    required this.label,
    this.color,
    super.key,
  });

  final IconData icon;
  final String label;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: color ?? context.colorScheme.primary),
        const Gap.s(horizontal: true),
        Expanded(
          child: Text(
            label,
            style: context.textTheme.titleMedium,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

/// Pending-approval card (design `invoice_history`): group + amount, a
/// View-Proof action and verify/decline buttons.
class InvoiceApprovalCard extends StatelessWidget {
  const InvoiceApprovalCard({
    required this.approval,
    required this.onViewProof,
    required this.onVerify,
    required this.onDecline,
    super.key,
  });

  final InvoiceApproval approval;
  final VoidCallback onViewProof;
  final VoidCallback onVerify;
  final VoidCallback onDecline;

  @override
  Widget build(BuildContext context) {
    return _LedgerCard(
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
                      style: context.textTheme.labelLarge?.copyWith(
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const Gap.xxs(),
                    Text(
                      approval.amount.formatShort(),
                      style: context.textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              TextButton.icon(
                onPressed: onViewProof,
                icon: const Icon(Icons.attach_file_rounded, size: KpSpacing.l),
                label: Text(context.l10n.invoiceViewProof),
              ),
            ],
          ),
          const Gap.m(),
          Row(
            children: [
              Expanded(
                child: KpButton(
                  label: context.l10n.invoiceVerify,
                  onPressed: onVerify,
                  dense: true,
                ),
              ),
              const Gap.s(horizontal: true),
              Expanded(
                child: KpButton(
                  label: context.l10n.invoiceDecline,
                  variant: KpButtonVariant.neutral,
                  onPressed: onDecline,
                  dense: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Urgent "Mark Invoice Paid" card (design `invoice_history`): a coral panel
/// with the balance due and a pay CTA.
class InvoiceUrgentCard extends StatelessWidget {
  const InvoiceUrgentCard({
    required this.urgent,
    required this.onMarkPaid,
    super.key,
  });

  final InvoiceUrgent urgent;
  final VoidCallback onMarkPaid;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: BoxDecoration(
        color: KpColors.tertiary300.withValues(alpha: 0.1),
        borderRadius: KpRadii.allXl,
        border: Border.all(color: KpColors.tertiary300, width: 2),
        boxShadow: [
          BoxShadow(
            color: KpColors.tertiary300.withValues(alpha: 0.3),
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(KpSpacing.s),
                decoration: const BoxDecoration(
                  color: KpColors.tertiary300,
                  borderRadius: KpRadii.allM,
                ),
                child: const Icon(
                  Icons.payments_outlined,
                  color: KpColors.tertiary600,
                ),
              ),
              const Gap.s(horizontal: true),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.l10n.invoiceMarkInvoicePaid,
                      style: context.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: KpColors.tertiary600,
                      ),
                    ),
                    Text(
                      urgent.name,
                      style: context.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: KpColors.tertiary600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Gap.m(),
          Container(
            padding: const EdgeInsets.all(KpSpacing.m),
            decoration: BoxDecoration(
              color: context.colorScheme.surfaceContainerLowest.withValues(
                alpha: 0.5,
              ),
              borderRadius: KpRadii.allM,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.l10n.invoiceBalanceDue,
                  style: context.textTheme.labelLarge?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
                Text(
                  urgent.amount.formatShort(),
                  style: context.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: KpColors.tertiary500,
                  ),
                ),
              ],
            ),
          ),
          const Gap.m(),
          KpButton(
            label: context.l10n.invoiceMarkPaid,
            variant: KpButtonVariant.error,
            onPressed: onMarkPaid,
            dense: true,
          ),
        ],
      ),
    );
  }
}

/// Segmented All / Paid / Pending control (design `invoice_history`).
class InvoiceFilterSegments extends StatelessWidget {
  const InvoiceFilterSegments({
    required this.selected,
    required this.onSelected,
    super.key,
  });

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
        border: Border(
          bottom: BorderSide(
            color: context.colorScheme.surfaceContainerHighest,
            width: 4,
          ),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final f in InvoiceFilter.values)
            GestureDetector(
              onTap: () => onSelected(f),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: KpSpacing.l,
                  vertical: KpSpacing.xs,
                ),
                decoration: BoxDecoration(
                  color: f == selected
                      ? context.colorScheme.surfaceContainerLowest
                      : KpColors.transparent,
                  borderRadius: KpRadii.allS,
                ),
                child: Text(
                  labels[f]!,
                  style: context.textTheme.labelLarge?.copyWith(
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

/// Payment-history table (design `invoice_history`): scrolls horizontally so
/// rows never wrap; columns are Invoice # / Date / Method / Status / Amount.
class InvoicePhoneTable extends StatelessWidget {
  const InvoicePhoneTable({required this.rows, super.key});

  final List<InvoiceHistoryRow> rows;

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
      child: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: constraints.maxWidth),
            child: Table(
              defaultColumnWidth: const IntrinsicColumnWidth(),
              border: TableBorder(
                horizontalInside: BorderSide(
                  color: context.colorScheme.surfaceContainer,
                ),
              ),
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(
                  decoration: BoxDecoration(
                    color: context.colorScheme.surfaceContainerLow,
                  ),
                  children: [
                    _HeaderCell(context.l10n.invoiceColInvoice),
                    _HeaderCell(context.l10n.invoiceColDate),
                    _HeaderCell(context.l10n.invoiceColMethod),
                    _HeaderCell(context.l10n.invoiceColStatus),
                    _HeaderCell(context.l10n.invoiceColAmount, alignEnd: true),
                  ],
                ),
                for (final row in rows)
                  TableRow(
                    children: [
                      _Cell(
                        child: Text(
                          row.ref,
                          softWrap: false,
                          style: context.textTheme.labelLarge,
                        ),
                      ),
                      _Cell(
                        child: Text(
                          row.date,
                          softWrap: false,
                          style: context.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      _Cell(
                        child: Text(
                          row.method == InvoicePayMethod.wallet
                              ? context.l10n.invoiceViaWallet
                              : context.l10n.invoiceManual,
                          softWrap: false,
                          style: context.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      _Cell(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: _PhoneStatusBadge(paid: row.paid),
                        ),
                      ),
                      _Cell(
                        child: Text(
                          row.amount.formatShort(),
                          softWrap: false,
                          textAlign: TextAlign.right,
                          style: context.textTheme.titleMedium,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _HeaderCell extends StatelessWidget {
  const _HeaderCell(this.label, {this.alignEnd = false});

  final String label;
  final bool alignEnd;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.m,
        vertical: KpSpacing.s,
      ),
      child: Text(
        label.toUpperCase(),
        textAlign: alignEnd ? TextAlign.right : TextAlign.left,
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

class _PhoneStatusBadge extends StatelessWidget {
  const _PhoneStatusBadge({required this.paid});

  final bool paid;

  @override
  Widget build(BuildContext context) {
    final (bg, fg, border, label) = paid
        ? (
            context.colors.successContainer,
            context.colorScheme.onPrimaryContainer,
            KpColors.brand300,
            context.l10n.invoicePaid,
          )
        : (
            KpColors.gold100,
            KpColors.gold600,
            KpColors.gold500,
            context.l10n.invoiceNotPaid,
          );
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.s,
        vertical: KpSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: const BorderRadius.all(Radius.circular(KpRadii.pill)),
        border: Border.all(color: border, width: 1),
      ),
      child: Text(
        label,
        style: context.textTheme.labelSmall?.copyWith(
          color: fg,
          letterSpacing: 0.3,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

/// Footer (design `invoice_history`): a dashed top rule, Mr K's quote pill and
/// a download-report link.
class InvoiceFooterCard extends StatelessWidget {
  const InvoiceFooterCard({required this.onDownload, super.key});

  final VoidCallback onDownload;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: KpSpacing.xxs,
          width: double.infinity,
          child: CustomPaint(
            painter: _DashedTopPainter(
              context.colorScheme.surfaceContainerHighest,
            ),
          ),
        ),
        const Gap.l(),
        Container(
          padding: const EdgeInsets.all(KpSpacing.m),
          decoration: BoxDecoration(
            color: context.colorScheme.primaryContainer.withValues(alpha: 0.1),
            borderRadius: KpRadii.allL,
            border: Border(
              bottom: BorderSide(
                color: context.colorScheme.primaryContainer.withValues(
                  alpha: 0.2,
                ),
                width: 4,
              ),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const KpMascot(size: 40),
              const Gap.s(horizontal: true),
              Flexible(
                child: Text(
                  '"${context.l10n.invoiceTip}" — ${context.l10n.mascotName}',
                  style: context.textTheme.titleSmall?.copyWith(
                    fontStyle: FontStyle.italic,
                    color: context.colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
        const Gap.m(),
        TextButton.icon(
          onPressed: onDownload,
          icon: const Icon(Icons.download_rounded),
          label: Text(context.l10n.invoiceDownloadReport),
        ),
      ],
    );
  }
}

class _DashedTopPainter extends CustomPainter {
  const _DashedTopPainter(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2;
    const dash = 6.0;
    const gap = 5.0;
    var x = 0.0;
    while (x < size.width) {
      canvas.drawLine(Offset(x, 0), Offset(x + dash, 0), paint);
      x += dash + gap;
    }
  }

  @override
  bool shouldRepaint(_DashedTopPainter old) => old.color != color;
}

/// A coloured summary stat (tablet right rail).
class InvoiceSummaryStat extends StatelessWidget {
  const InvoiceSummaryStat({
    required this.icon,
    required this.label,
    required this.value,
    required this.background,
    required this.foreground,
    required this.shadow,
    super.key,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color background;
  final Color foreground;
  final Color shadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: BoxDecoration(
        color: background,
        borderRadius: KpRadii.allL,
        border: Border(bottom: BorderSide(color: shadow, width: 4)),
      ),
      child: Column(
        children: [
          Icon(icon, color: foreground),
          const Gap.xs(),
          Text(
            label.toUpperCase(),
            style: context.textTheme.labelSmall?.copyWith(
              color: foreground,
              letterSpacing: 0.5,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Gap.xxs(),
          Text(
            value,
            style: context.textTheme.titleMedium?.copyWith(
              color: foreground,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
