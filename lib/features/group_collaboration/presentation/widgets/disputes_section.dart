import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/group_collaboration/presentation/view_models/dispute_view.dart';

/// Disputes hub section for a pocket/adashi (map §3). Lists cases with status
/// pills and resolution notes, plus a "raise a dispute" CTA. Presentation-only.
class DisputesSection extends StatelessWidget {
  const DisputesSection({
    required this.disputes,
    this.onRaise,
    this.resolvedThisMonth,
    this.avgResolution,
    super.key,
  });

  final List<DisputeView> disputes;
  final VoidCallback? onRaise;
  final int? resolvedThisMonth;
  final String? avgResolution;

  int get _openCount =>
      disputes.where((d) => d.status == DisputeStatus.open).length;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        KpButton(
          label: context.l10n.disputesRaise,
          icon: Icons.gavel_rounded,
          onPressed: onRaise ?? () {},
        ),
        const Gap.l(),
        _ActiveCasesCard(
          openCount: _openCount,
          resolvedThisMonth: resolvedThisMonth,
          avgResolution: avgResolution,
        ),
        const Gap.l(),
        if (disputes.isEmpty)
          Text(context.l10n.disputesEmpty)
        else
          for (final d in disputes) ...[
            _DisputeCard(dispute: d),
            const Gap.s(),
          ],
      ],
    );
  }
}

class _ActiveCasesCard extends StatelessWidget {
  const _ActiveCasesCard({
    required this.openCount,
    this.resolvedThisMonth,
    this.avgResolution,
  });

  final int openCount;
  final int? resolvedThisMonth;
  final String? avgResolution;

  @override
  Widget build(BuildContext context) {
    return KpCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.disputesActiveCases,
            style: context.textTheme.labelLarge?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
          const Gap.xxs(),
          Text(
            context.l10n.disputesOpenCount(openCount),
            style: context.textTheme.headlineMedium,
          ),
          if (resolvedThisMonth != null) ...[
            const Divider(),
            _MiniStat(
              label: context.l10n.disputesResolvedThisMonth,
              value: '$resolvedThisMonth',
            ),
          ],
          if (avgResolution != null) ...[
            const Gap.xs(),
            _MiniStat(
              label: context.l10n.disputesAvgResolution,
              value: avgResolution!,
            ),
          ],
        ],
      ),
    );
  }
}

class _MiniStat extends StatelessWidget {
  const _MiniStat({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
          ),
        ),
        Text(value, style: context.textTheme.titleMedium),
      ],
    );
  }
}

class _DisputeCard extends StatelessWidget {
  const _DisputeCard({required this.dispute});

  final DisputeView dispute;

  @override
  Widget build(BuildContext context) {
    return KpCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  dispute.title,
                  style: context.textTheme.titleMedium,
                ),
              ),
              _StatusPill(status: dispute.status),
            ],
          ),
          const Gap.xxs(),
          Text(
            '${dispute.author} · ${dispute.timeAgo}',
            style: context.textTheme.labelSmall?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
          const Gap.xs(),
          Text(dispute.description, style: context.textTheme.bodyMedium),
          if (dispute.resolutionNote != null) ...[
            const Gap.s(),
            Container(
              padding: const EdgeInsets.all(KpSpacing.s),
              decoration: BoxDecoration(
                color: context.colors.successContainer,
                borderRadius: KpRadii.allM,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.check_circle_rounded,
                    size: KpSpacing.m,
                    color: context.colors.success,
                  ),
                  const Gap.xs(horizontal: true),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.l10n.disputesResolutionNote,
                          style: context.textTheme.labelSmall,
                        ),
                        Text(
                          dispute.resolutionNote!,
                          style: context.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _StatusPill extends StatelessWidget {
  const _StatusPill({required this.status});

  final DisputeStatus status;

  @override
  Widget build(BuildContext context) {
    final (Color bg, Color fg, String label) = switch (status) {
      DisputeStatus.open => (
        context.colors.warningContainer,
        context.colors.warning,
        context.l10n.disputeStatusOpen,
      ),
      DisputeStatus.resolved => (
        context.colors.successContainer,
        context.colors.success,
        context.l10n.disputeStatusResolved,
      ),
      DisputeStatus.dismissed => (
        context.colorScheme.surfaceContainerHighest,
        context.colorScheme.onSurfaceVariant,
        context.l10n.disputeStatusDismissed,
      ),
    };
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.xs,
        vertical: KpSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(KpRadii.pill),
      ),
      child: Text(
        label,
        style: context.textTheme.labelSmall?.copyWith(color: fg),
      ),
    );
  }
}
