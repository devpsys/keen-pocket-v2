import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/adashi/presentation/view_models/adashi_view.dart';
import 'package:keenpockets/features/contributions/contributions.dart';

/// Current-cycle card (design `adashi_hub`): cycle status + ACTIVE pill, the
/// paid-members progress, total collected, this cycle's receiver, and the
/// Contribute CTA (reusing the shared `ContributeButton`).
class AdashiCycleCard extends StatelessWidget {
  const AdashiCycleCard({required this.detail, super.key});

  final AdashiDetailView detail;

  @override
  Widget build(BuildContext context) {
    final summary = detail.summary;
    final percent = (detail.collectionProgress * 100).round();
    return KpCard(
      padding: const EdgeInsets.all(KpSpacing.l),
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
                      context.l10n.adashiHubCycle(summary.currentCycle),
                      style: context.textTheme.headlineMedium,
                    ),
                    Text(
                      context.l10n.adashiHubCollecting.toUpperCase(),
                      style: context.textTheme.labelSmall?.copyWith(
                        color: context.colorScheme.onSurfaceVariant,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
              ),
              _ActivePill(),
            ],
          ),
          const Gap.m(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  context.l10n.adashiHubPaidMembers(
                    detail.paidMembers,
                    summary.memberCount,
                  ),
                  style: context.textTheme.labelLarge,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                context.l10n.adashiHubPercent(percent),
                style: context.textTheme.labelLarge,
              ),
            ],
          ),
          const Gap.s(),
          KpProgressBar(value: detail.collectionProgress, height: 16),
          const Gap.m(),
          _TotalCollected(detail: detail),
          const Gap.m(),
          _ReceiverRow(detail: detail),
          const Gap.m(),
          ContributeButton(
            target: ContributionContext.adashi(
              summary.id,
              cycle: '${summary.currentCycle}',
            ),
            label: context.l10n.adashiHubContribute(
              detail.contributeAmount.format(),
            ),
          ),
        ],
      ),
    );
  }
}

class _ActivePill extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.m,
        vertical: KpSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: context.colorScheme.primary,
        borderRadius: BorderRadius.circular(KpRadii.pill),
      ),
      child: Text(
        context.l10n.adashiHubActive.toUpperCase(),
        style: context.textTheme.labelSmall?.copyWith(
          color: context.colorScheme.onPrimary,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

class _TotalCollected extends StatelessWidget {
  const _TotalCollected({required this.detail});

  final AdashiDetailView detail;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLow,
        borderRadius: KpRadii.allM,
        border: Border.all(
          color: context.colorScheme.outlineVariant.withValues(alpha: 0.4),
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.adashiHubTotalCollected,
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
          const Gap.xxs(),
          RichText(
            text: TextSpan(
              style: context.textTheme.headlineMedium?.copyWith(
                color: context.colorScheme.primary,
              ),
              children: [
                TextSpan(text: detail.collected.format()),
                TextSpan(
                  text: ' / ${detail.target.format()}',
                  style: context.textTheme.bodyMedium?.copyWith(
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

class _ReceiverRow extends StatelessWidget {
  const _ReceiverRow({required this.detail});

  final AdashiDetailView detail;

  @override
  Widget build(BuildContext context) {
    final initial = detail.receiverName.isEmpty
        ? '?'
        : detail.receiverName.substring(0, 1).toUpperCase();
    return Row(
      children: [
        Container(
          width: KpSpacing.xl,
          height: KpSpacing.xl,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.colorScheme.tertiaryContainer,
          ),
          child: Text(
            initial,
            style: context.textTheme.labelLarge?.copyWith(
              color: context.colorScheme.onTertiaryContainer,
            ),
          ),
        ),
        const Gap.s(horizontal: true),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colorScheme.onSurface,
              ),
              children: [
                TextSpan(
                  text: '${context.l10n.adashiHubThisCycle} ',
                  style: const TextStyle(fontWeight: FontWeight.w800),
                ),
                TextSpan(
                  text: context.l10n.adashiHubReceives(
                    detail.receiverName,
                    detail.receiverAmount.format(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
