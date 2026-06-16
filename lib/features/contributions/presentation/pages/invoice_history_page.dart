import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/error/failure_localizer.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/contributions/domain/value_objects/contribution_context.dart';
import 'package:keenpockets/features/contributions/presentation/cubit/invoice_history_cubit.dart';
import 'package:keenpockets/features/contributions/presentation/cubit/invoice_history_state.dart';
import 'package:keenpockets/features/contributions/presentation/pages/contribute_page.dart';
import 'package:keenpockets/features/contributions/presentation/widgets/invoice_tile.dart';

/// Invoice history for a contribution [context]. Organisers ([canVerify]) can
/// verify pending invoices. The "+" opens the contribute form.
class InvoiceHistoryPage extends StatelessWidget {
  const InvoiceHistoryPage({
    required this.context,
    this.canVerify = false,
    super.key,
  });

  final ContributionContext context;
  final bool canVerify;

  @override
  Widget build(BuildContext _) {
    return BlocProvider<InvoiceHistoryCubit>(
      create: (_) => getIt<InvoiceHistoryCubit>()..load(context),
      child: _InvoiceHistoryView(context: context, canVerify: canVerify),
    );
  }
}

class _InvoiceHistoryView extends StatelessWidget {
  const _InvoiceHistoryView({required this.context, required this.canVerify});

  final ContributionContext context;
  final bool canVerify;

  Future<void> _openContribute(BuildContext ctx) async {
    final submitted = await Navigator.of(ctx).push<bool>(
      MaterialPageRoute(builder: (_) => ContributePage(context: context)),
    );
    if ((submitted ?? false) && ctx.mounted) {
      await ctx.read<InvoiceHistoryCubit>().load(context);
    }
  }

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(title: Text(ctx.l10n.contributionsTitle)),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _openContribute(ctx),
        icon: const Icon(Icons.add),
        label: Text(ctx.l10n.contributeTitle),
      ),
      body: BlocBuilder<InvoiceHistoryCubit, InvoiceHistoryState>(
        builder: (ctx, state) {
          return KpAsyncView(
            status: state.status,
            empty: KpEmptyView(
              title: ctx.l10n.invoicesEmptyTitle,
              message: ctx.l10n.invoicesEmptyMessage,
            ),
            failure: KpErrorView(
              message:
                  state.failure?.localizedMessage(ctx) ?? ctx.l10n.errorGeneric,
              retryLabel: ctx.l10n.retry,
              onRetry: () => ctx.read<InvoiceHistoryCubit>().load(context),
            ),
            loaded: (_) => ListView.separated(
              padding: const EdgeInsets.all(KpSpacing.m),
              itemCount: state.invoices.length,
              separatorBuilder: (_, _) => const Gap.s(),
              itemBuilder: (_, index) {
                final invoice = state.invoices[index];
                return InvoiceTile(
                  invoice: invoice,
                  onVerify: canVerify && invoice.isPending
                      ? () => ctx.read<InvoiceHistoryCubit>().verify(invoice.id)
                      : null,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
