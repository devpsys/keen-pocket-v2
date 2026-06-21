import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/app/app_nav.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/core/widgets/kp_network_image.dart';
import 'package:keenpockets/features/contributions/domain/value_objects/contribution_context.dart';
import 'package:keenpockets/features/contributions/presentation/pages/contribute_page.dart';
import 'package:keenpockets/features/contributions/presentation/widgets/contribute_fixtures.dart';
import 'package:keenpockets/features/contributions/presentation/widgets/invoice_fixtures.dart';
import 'package:keenpockets/features/contributions/presentation/widgets/invoice_tablet_widgets.dart';
import 'package:keenpockets/features/contributions/presentation/widgets/invoice_widgets.dart';

/// Invoice Ledger (design `invoice_history` / `_tablet`): the contribution and
/// group-payment history for a [context]. Organisers ([canVerify]) also see the
/// pending-approval and urgent-action panels. Presentation-only.
class InvoiceHistoryPage extends StatefulWidget {
  const InvoiceHistoryPage({
    required this.context,
    this.canVerify = false,
    this.ledger,
    super.key,
  });

  final ContributionContext context;
  final bool canVerify;
  final InvoiceLedgerView? ledger;

  @override
  State<InvoiceHistoryPage> createState() => _InvoiceHistoryPageState();
}

class _InvoiceHistoryPageState extends State<InvoiceHistoryPage> {
  InvoiceFilter _filter = InvoiceFilter.all;

  InvoiceLedgerView get _ledger => widget.ledger ?? kInvoiceLedger;

  Future<void> _openContribute() async {
    await Navigator.of(context).push<bool>(
      MaterialPageRoute(
        builder: (_) => ContributePage(context: widget.context),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (context.isExpanded) {
      return AppTabletShell(
        selectedIndex: kPocketsTabIndex,
        body: Scaffold(
          appBar: _appBar(context),
          body: SafeArea(child: _tablet(context)),
        ),
      );
    }
    return Scaffold(
      appBar: _appBar(context),
      floatingActionButton: FloatingActionButton(
        onPressed: _openContribute,
        child: const Icon(Icons.add),
      ),
      body: SafeArea(child: _phone(context)),
    );
  }

  /// Brand wordmark with the user's profile photo and a notification bell
  /// (design `invoice_history` / `_tablet`).
  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      iconTheme: IconThemeData(color: context.colorScheme.primary),
      shape: Border(
        bottom: BorderSide(
          color: context.colorScheme.surfaceContainerHighest,
          width: 4,
        ),
      ),
      title: Text(
        context.l10n.brandWordmark,
        style: context.textTheme.titleLarge?.copyWith(
          color: context.colorScheme.primary,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            KpIcons.notificationsOutlined,
            color: context.colorScheme.primary,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: KpSpacing.m),
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(KpSpacing.xxs),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: context.colorScheme.primaryContainer,
                  width: 2,
                ),
              ),
              child: const KpNetworkAvatar(
                url: kContributeAvatarUrl,
                radius: KpSpacing.s,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _phone(BuildContext context) {
    final rows = _ledger.filtered(_filter);
    return ListView(
      padding: const EdgeInsets.all(KpSpacing.l),
      children: [
        const InvoiceLedgerHeader(),
        const Gap.xl(),
        if (widget.canVerify) ...[
          InvoiceSectionHeading(
            icon: Icons.pending_actions_rounded,
            label: context.l10n.invoicePendingApprovals,
            color: context.colorScheme.secondary,
          ),
          const Gap.m(),
          for (final approval in _ledger.approvals) ...[
            InvoiceApprovalCard(
              approval: approval,
              onViewProof: () {},
              onVerify: () {},
              onDecline: () {},
            ),
            const Gap.m(),
          ],
          if (_ledger.urgent != null) ...[
            const Gap.l(),
            InvoiceSectionHeading(
              icon: Icons.priority_high_rounded,
              label: context.l10n.invoiceUrgentAction,
              color: context.colorScheme.tertiary,
            ),
            const Gap.m(),
            InvoiceUrgentCard(urgent: _ledger.urgent!, onMarkPaid: () {}),
            const Gap.xl(),
          ],
        ],
        InvoiceSectionHeading(
          icon: Icons.history_rounded,
          label: context.l10n.invoicePaymentHistory,
        ),
        const Gap.m(),
        Align(
          alignment: Alignment.centerLeft,
          child: InvoiceFilterSegments(
            selected: _filter,
            onSelected: (f) => setState(() => _filter = f),
          ),
        ),
        const Gap.m(),
        InvoicePhoneTable(rows: rows),
        const Gap.l(),
        InvoiceFooterCard(onDownload: () {}),
      ],
    );
  }

  Widget _tablet(BuildContext context) {
    final rows = _ledger.filteredRows(_filter);
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(KpSpacing.xl),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const InvoiceLedgerHeaderTablet(),
              const Gap.l(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        InvoicePaymentTableTablet(
                          rows: rows,
                          filter: _filter,
                          onFilter: (f) => setState(() => _filter = f),
                          onDownload: () {},
                        ),
                        const Gap.l(),
                        const InvoiceTipCardTablet(),
                      ],
                    ),
                  ),
                  const Gap.l(horizontal: true),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        InvoiceSectionHeading(
                          icon: Icons.pending_actions_rounded,
                          label: context.l10n.invoicePendingApprovals,
                        ),
                        const Gap.m(),
                        for (final approval in _ledger.approvals) ...[
                          InvoiceApprovalCardTablet(
                            approval: approval,
                            onVerify: () {},
                            onDecline: () {},
                          ),
                          const Gap.m(),
                        ],
                        if (_ledger.urgent != null) ...[
                          const Gap.s(),
                          _UrgentHeading(),
                          const Gap.m(),
                          InvoiceUrgentCardTablet(
                            urgent: _ledger.urgent!,
                            onMarkPaid: () {},
                          ),
                          const Gap.l(),
                        ],
                        Row(
                          children: [
                            Expanded(
                              child: InvoiceSummaryStat(
                                icon: Icons.trending_up_rounded,
                                label: context.l10n.invoiceTotalSent,
                                value: _ledger.totalSent.formatShort(),
                                background:
                                    context.colorScheme.primaryContainer,
                                foreground:
                                    context.colorScheme.onPrimaryContainer,
                                shadow: context.colorScheme.onPrimaryContainer,
                              ),
                            ),
                            const Gap.s(horizontal: true),
                            Expanded(
                              child: InvoiceSummaryStat(
                                icon: Icons.pending_actions_rounded,
                                label: context.l10n.invoiceAwaiting,
                                value: _ledger.awaiting.formatShort(),
                                background: KpColors.gold500,
                                foreground: KpColors.gold600,
                                shadow: KpColors.gold600,
                              ),
                            ),
                          ],
                        ),
                      ],
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

/// "Urgent Action" heading with a live red dot (design `invoice_history_tablet`).
class _UrgentHeading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          context.l10n.invoiceUrgentAction,
          style: context.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        const Gap.s(horizontal: true),
        Container(
          width: KpSpacing.xs,
          height: KpSpacing.xs,
          decoration: const BoxDecoration(
            color: KpColors.tertiary500,
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}
