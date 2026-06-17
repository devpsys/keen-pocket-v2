import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/pocket_detail_fixtures.dart';

/// Error-tinted "pending approvals" card prompting the organiser to mark a
/// donor's contribution as paid.
class PocketPendingApprovals extends StatelessWidget {
  const PocketPendingApprovals({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: BoxDecoration(
        color: context.colorScheme.errorContainer.withValues(alpha: 0.4),
        borderRadius: KpRadii.allXl,
        border: Border.all(color: context.colorScheme.error, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.pending_actions_rounded,
                color: context.colorScheme.error,
              ),
              const Gap.xs(horizontal: true),
              Text(
                context.l10n.pocketDetailPendingApprovals,
                style: context.textTheme.titleMedium,
              ),
            ],
          ),
          const Gap.s(),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      kPocketPendingDonor.name,
                      style: context.textTheme.bodyMedium,
                    ),
                    Text(
                      kPocketPendingDonor.amount.format(),
                      style: context.textTheme.labelSmall?.copyWith(
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              KpButton(
                label: context.l10n.pocketDetailMarkPaid,
                variant: KpButtonVariant.secondary,
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
