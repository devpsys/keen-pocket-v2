import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/features/discovery/presentation/widgets/insights_hero.dart';
import 'package:keenpockets/features/discovery/presentation/widgets/insights_share_footer.dart';
import 'package:keenpockets/features/discovery/presentation/widgets/insights_stat_card.dart';

/// Phone layout for the "Year in Review" insights screen (design
/// `insights_reports`): hero, a single column of metric cards, then the footer.
class InsightsReportsPhoneView extends StatelessWidget {
  const InsightsReportsPhoneView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(KpSpacing.m),
      children: [
        const InsightsHero(),
        const Gap.l(),
        for (final card in insightStatCards(context)) ...[card, const Gap.m()],
        const Gap.s(),
        const InsightsShareFooter(),
        const Gap.l(),
      ],
    );
  }
}
