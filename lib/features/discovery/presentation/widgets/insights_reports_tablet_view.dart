import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/discovery/presentation/widgets/insights_hero.dart';
import 'package:keenpockets/features/discovery/presentation/widgets/insights_share_footer.dart';
import 'package:keenpockets/features/discovery/presentation/widgets/insights_stat_card.dart';

/// Tablet/desktop layout for the "Year in Review" insights screen (design
/// `insights_reports_tablet`): hero, a 3-column metric grid, the share action,
/// and a Mr K advice card.
class InsightsReportsTabletView extends StatelessWidget {
  const InsightsReportsTabletView({super.key});

  static const int _columns = 3;

  @override
  Widget build(BuildContext context) {
    final cards = insightStatCards(context);
    final rows = <List<InsightsStatCard>>[
      for (var i = 0; i < cards.length; i += _columns)
        cards.sublist(i, (i + _columns).clamp(0, cards.length)),
    ];
    return ListView(
      padding: const EdgeInsets.all(KpSpacing.xl),
      children: [
        const InsightsHero(),
        const Gap.l(),
        for (final row in rows) ...[
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (var c = 0; c < _columns; c++) ...[
                  if (c > 0) const Gap.m(horizontal: true),
                  Expanded(
                    child: c < row.length ? row[c] : const SizedBox.shrink(),
                  ),
                ],
              ],
            ),
          ),
          const Gap.m(),
        ],
        const Gap.m(),
        const InsightsShareFooter(),
        const Gap.l(),
        const _MrKAdviceCard(),
      ],
    );
  }
}

class _MrKAdviceCard extends StatelessWidget {
  const _MrKAdviceCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainer,
        borderRadius: KpRadii.allXl,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const KpMascot(size: 56),
          const Gap.m(horizontal: true),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.insightsMrKAdvice.toUpperCase(),
                  style: context.textTheme.labelMedium?.copyWith(
                    color: context.colorScheme.primary,
                  ),
                ),
                const Gap.xxs(),
                Text(
                  context.l10n.insightsMrKAdviceBody,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                    fontStyle: FontStyle.italic,
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
