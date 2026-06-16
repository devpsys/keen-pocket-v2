import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/pockets/domain/entities/pocket.dart';

/// List tile for a pocket: name, members, hand price, fill progress.
class PocketCard extends StatelessWidget {
  const PocketCard({required this.pocket, required this.onTap, super.key});

  final Pocket pocket;
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
                      pocket.name,
                      style: context.textTheme.titleMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    pocket.handPrice.format(),
                    style: context.textTheme.labelLarge?.copyWith(
                      color: context.colorScheme.primary,
                    ),
                  ),
                ],
              ),
              const Gap.xs(),
              Text(
                context.l10n.pocketMembersCount(pocket.memberCount),
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
              const Gap.s(),
              ClipRRect(
                borderRadius: KpRadii.allXs,
                child: LinearProgressIndicator(
                  value: pocket.fillRate,
                  minHeight: KpSpacing.xs,
                  backgroundColor: context.colorScheme.surfaceContainerHighest,
                ),
              ),
              const Gap.xs(),
              Text(
                context.l10n.pocketHandsFilled(
                  pocket.filledHands,
                  pocket.totalHands,
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
