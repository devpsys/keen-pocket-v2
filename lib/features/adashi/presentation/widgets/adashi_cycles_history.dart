import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/adashi/presentation/view_models/adashi_view.dart';

/// Cycles-history table (design `adashi_hub`): a header + a row per past cycle
/// with its total and a status pill, plus a "See all" action.
class AdashiCyclesHistory extends StatelessWidget {
  const AdashiCyclesHistory({required this.history, this.onSeeAll, super.key});

  final List<AdashiCycleRecord> history;
  final VoidCallback? onSeeAll;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                context.l10n.adashiHubCyclesHistory,
                style: context.textTheme.headlineSmall,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            TextButton(
              onPressed: onSeeAll,
              child: Text(
                context.l10n.adashiHubSeeAll,
                style: context.textTheme.labelLarge?.copyWith(
                  color: context.colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
        const Gap.s(),
        DecoratedBox(
          decoration: BoxDecoration(
            color: context.colorScheme.surfaceContainerLowest,
            borderRadius: KpRadii.allXl,
            border: Border.all(
              color: context.colorScheme.surfaceContainerHighest,
              width: 2,
            ),
          ),
          child: Column(
            children: [
              _HeaderRow(),
              for (final record in history)
                _DataRow(record: record, showDivider: record != history.first),
            ],
          ),
        ),
      ],
    );
  }
}

class _HeaderRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLow,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(KpRadii.xl),
        ),
      ),
      child: Row(
        children: [
          Expanded(child: _HeaderCell(context.l10n.adashiHubColCycle)),
          Expanded(child: _HeaderCell(context.l10n.adashiHubColTotal)),
          Expanded(child: _HeaderCell(context.l10n.adashiHubColStatus)),
        ],
      ),
    );
  }
}

class _HeaderCell extends StatelessWidget {
  const _HeaderCell(this.label);

  final String label;

  @override
  Widget build(BuildContext context) =>
      Text(label, style: context.textTheme.labelLarge);
}

class _DataRow extends StatelessWidget {
  const _DataRow({required this.record, required this.showDivider});

  final AdashiCycleRecord record;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: BoxDecoration(
        border: showDivider
            ? Border(
                top: BorderSide(
                  color: context.colorScheme.surfaceContainerHighest,
                ),
              )
            : null,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(record.label, style: context.textTheme.bodyMedium),
          ),
          Expanded(
            child: Text(
              record.total.format(),
              style: context.textTheme.labelLarge,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Icon(
                  Icons.check_circle_rounded,
                  size: KpSpacing.m,
                  color: context.colors.success,
                ),
                const Gap.xxs(horizontal: true),
                Flexible(
                  child: Text(
                    context.l10n.adashiHubClosed,
                    style: context.textTheme.labelSmall?.copyWith(
                      color: context.colors.success,
                    ),
                    overflow: TextOverflow.ellipsis,
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
