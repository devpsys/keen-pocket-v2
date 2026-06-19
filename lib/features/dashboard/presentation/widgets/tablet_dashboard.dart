import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/dashboard/presentation/view_models/dashboard_view.dart';
import 'package:keenpockets/features/dashboard/presentation/widgets/dashboard_common.dart';
import 'package:keenpockets/features/dashboard/presentation/widgets/dashboard_footer.dart';
import 'package:keenpockets/features/dashboard/presentation/widgets/streak_card.dart';
import 'package:keenpockets/features/dashboard/presentation/widgets/tablet_adashi_card.dart';
import 'package:keenpockets/features/dashboard/presentation/widgets/tablet_hero.dart';
import 'package:keenpockets/features/dashboard/presentation/widgets/tablet_pocket_card.dart';
import 'package:keenpockets/features/dashboard/presentation/widgets/tablet_stat_row.dart';
import 'package:keenpockets/features/dashboard/presentation/widgets/tablet_trend.dart';
import 'package:keenpockets/features/plans/plans.dart';

/// Tablet dashboard (design `home_dashboard_tablet_1`).
class TabletDashboard extends StatelessWidget {
  const TabletDashboard({
    required this.data,
    this.onOpenPocket,
    this.onOpenAdashi,
    this.onOpenWallet,
    super.key,
  });

  final DashboardView data;
  final ValueChanged<String>? onOpenPocket;
  final ValueChanged<String>? onOpenAdashi;
  final VoidCallback? onOpenWallet;

  @override
  Widget build(BuildContext context) {
    final d = data;
    return ListView(
      padding: const EdgeInsets.all(KpSpacing.l),
      children: [
        TabletHero(name: d.greetingName, totalSaved: d.totalSaved),
        const Gap.l(),
        TabletStatRow(data: d, onOpenWallet: onOpenWallet),
        const Gap.l(),
        StreakCard(data: d),
        const Gap.l(),
        const TabletTrend(),
        const Gap.l(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DashboardSectionHeader(
                    title: context.l10n.dashboardMyPockets,
                  ),
                  const Gap.s(),
                  for (final p in d.featuredPockets) ...[
                    TabletDashboardPocketCard(
                      pocket: p,
                      onOpenPocket: onOpenPocket,
                    ),
                    const Gap.s(),
                  ],
                ],
              ),
            ),
            const Gap.l(horizontal: true),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DashboardSectionHeader(title: context.l10n.dashboardMyAdashi),
                  const Gap.s(),
                  if (d.featuredAdashi != null)
                    TabletAdashiCard(
                      adashi: d.featuredAdashi!,
                      onTap: onOpenAdashi,
                    ),
                ],
              ),
            ),
          ],
        ),
        const Gap.l(),
        Card(
          child: ListTile(
            leading: const Icon(KpIcons.shopping),
            title: Text(context.l10n.dashboardShortcutPlans),
            trailing: const Icon(KpIcons.chevronRight),
            onTap: () => Navigator.of(
              context,
            ).push<void>(MaterialPageRoute(builder: (_) => const PlansPage())),
          ),
        ),
        const Gap.l(),
        const DashboardFooter(),
      ],
    );
  }
}
