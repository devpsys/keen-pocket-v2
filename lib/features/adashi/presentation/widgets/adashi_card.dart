import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/adashi/presentation/view_models/adashi_view.dart';

/// List tile for a rotating savings circle.
class AdashiCard extends StatelessWidget {
  const AdashiCard({required this.adashi, required this.onTap, super.key});

  final AdashiSummaryView adashi;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: KpRadii.allL,
        child: Padding(
          padding: const EdgeInsets.all(KpSpacing.m),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      adashi.name,
                      style: context.textTheme.titleMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    adashi.perCycle.format(),
                    style: context.textTheme.labelLarge?.copyWith(
                      color: context.colorScheme.primary,
                    ),
                  ),
                ],
              ),
              const Gap.xs(),
              Text(
                context.l10n.pocketMembersCount(adashi.memberCount),
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
              const Gap.s(),
              ClipRRect(
                borderRadius: KpRadii.allXs,
                child: LinearProgressIndicator(
                  value: adashi.progress,
                  minHeight: KpSpacing.xs,
                  backgroundColor: context.colorScheme.surfaceContainerHighest,
                ),
              ),
              const Gap.xs(),
              Text(
                context.l10n.adashiCycleProgress(
                  adashi.currentCycle,
                  adashi.totalCycles,
                ),
                style: context.textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
