import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/dashboard/presentation/view_models/dashboard_view.dart';
import 'package:keenpockets/features/dashboard/presentation/widgets/adashi_card.dart';
import 'package:keenpockets/features/dashboard/presentation/widgets/badges_row.dart';
import 'package:keenpockets/features/dashboard/presentation/widgets/dashboard_common.dart';
import 'package:keenpockets/features/dashboard/presentation/widgets/dashboard_footer.dart';
import 'package:keenpockets/features/dashboard/presentation/widgets/greeting_card.dart';
import 'package:keenpockets/features/dashboard/presentation/widgets/pockets_rail.dart';
import 'package:keenpockets/features/dashboard/presentation/widgets/stat_grid.dart';
import 'package:keenpockets/features/dashboard/presentation/widgets/trend_card.dart';
import 'package:keenpockets/features/dashboard/presentation/widgets/weekly_goal_card.dart';
import 'package:keenpockets/features/plans/plans.dart';

/// Phone dashboard (design `home_dashboard`).
class PhoneDashboard extends StatelessWidget {
  const PhoneDashboard({
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
        GreetingCard(name: d.greetingName, totalSaved: d.totalSaved),
        const Gap.m(),
        StatGrid(data: d, onOpenWallet: onOpenWallet),
        const Gap.m(),
        WeeklyGoalCard(data: d),
        if (d.badges.isNotEmpty) ...[
          const Gap.m(),
          BadgesRow(points: d.points, badges: d.badges),
        ],
        const Gap.l(),
        Text(
          context.l10n.dashboardContributionTrend,
          style: context.textTheme.titleLarge,
        ),
        const Gap.s(),
        const TrendCard(),
        if (d.featuredPockets.isNotEmpty) ...[
          const Gap.l(),
          DashboardSectionHeader(title: context.l10n.dashboardMyPockets),
          const Gap.s(),
          PocketsRail(pockets: d.featuredPockets, onOpenPocket: onOpenPocket),
        ],
        if (d.featuredAdashi != null) ...[
          const Gap.l(),
          DashboardSectionHeader(
            title: context.l10n.dashboardMyAdashi,
            action: context.l10n.dashboardJoinGroup,
          ),
          const Gap.s(),
          AdashiCard(adashi: d.featuredAdashi!, onTap: onOpenAdashi),
        ],
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
