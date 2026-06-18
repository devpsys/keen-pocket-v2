import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/dashed_border.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/pocket_detail_fixtures.dart';

/// Error-tinted, dashed "pending approvals" card prompting the organiser to
/// mark a donor's contribution as paid.
class PocketPendingApprovals extends StatelessWidget {
  const PocketPendingApprovals({super.key});

  static const double _markPaidWidth = 132;

  @override
  Widget build(BuildContext context) {
    return DashedBorder(
      color: context.colorScheme.error,
      child: Container(
        padding: const EdgeInsets.all(KpSpacing.m),
        decoration: BoxDecoration(
          color: context.colorScheme.errorContainer.withValues(alpha: 0.4),
          borderRadius: KpRadii.allXl,
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
            const Gap.m(),
            KpCard(
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: context.colorScheme.secondaryContainer,
                    child: Text(
                      kPocketPendingDonor.name.characters.first,
                      style: context.textTheme.labelLarge?.copyWith(
                        color: context.colorScheme.onSecondaryContainer,
                      ),
                    ),
                  ),
                  const Gap.s(horizontal: true),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          kPocketPendingDonor.name,
                          style: context.textTheme.titleMedium,
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
                  const Gap.s(horizontal: true),
                  SizedBox(
                    width: _markPaidWidth,
                    child: KpButton(
                      label: context.l10n.pocketDetailMarkPaid,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
