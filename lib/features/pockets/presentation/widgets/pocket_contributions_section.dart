import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/contributions/contributions.dart';
import 'package:keenpockets/features/pockets/domain/entities/pocket.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/pocket_detail_fixtures.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/pocket_pill.dart';

/// "My contributions" list with a view-all link into invoice history.
class PocketContributionsSection extends StatelessWidget {
  const PocketContributionsSection({
    required this.pocket,
    required this.role,
    super.key,
  });

  final Pocket pocket;
  final PocketRole role;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.l10n.pocketDetailMyContributions,
              style: context.textTheme.titleLarge,
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).push<void>(
                MaterialPageRoute(
                  builder: (_) => InvoiceHistoryPage(
                    context: ContributionContext.pocket(pocket.id),
                    canVerify: role == PocketRole.organiser,
                  ),
                ),
              ),
              child: Text(
                context.l10n.pocketDetailViewAll,
                style: context.textTheme.labelLarge?.copyWith(
                  color: context.colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
        const Gap.s(),
        for (final c in kPocketContributions) ...[
          _ContributionTile(contribution: c),
          const Gap.s(),
        ],
      ],
    );
  }
}

class _ContributionTile extends StatelessWidget {
  const _ContributionTile({required this.contribution});

  final PocketContribution contribution;

  @override
  Widget build(BuildContext context) {
    return KpCard(
      child: Row(
        children: [
          Icon(
            Icons.calendar_today_rounded,
            color: context.colorScheme.primary,
          ),
          const Gap.s(horizontal: true),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(contribution.period, style: context.textTheme.titleMedium),
                Text(
                  contribution.amount.format(),
                  style: context.textTheme.labelSmall?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          PocketPill(
            label: contribution.paid
                ? context.l10n.pocketDetailPaid
                : context.l10n.pocketDetailNotPaid,
            tone: contribution.paid
                ? PocketPillTone.success
                : PocketPillTone.warning,
          ),
        ],
      ),
    );
  }
}
