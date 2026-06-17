import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:keenpockets/features/dashboard/presentation/cubit/dashboard_state.dart';
import 'package:keenpockets/features/dashboard/presentation/view_models/dashboard_view.dart';
import 'package:keenpockets/features/plans/plans.dart';

/// At-a-glance savings cockpit: greeting, key stats, weekly goal, featured
/// pockets/adashi (design phase C — `home_dashboard`).
class DashboardPage extends StatelessWidget {
  const DashboardPage({
    this.onOpenPocket,
    this.onOpenAdashi,
    this.onOpenWallet,
    super.key,
  });

  final ValueChanged<String>? onOpenPocket;
  final ValueChanged<String>? onOpenAdashi;
  final VoidCallback? onOpenWallet;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DashboardCubit>(
      create: (_) => getIt<DashboardCubit>()..load(),
      child: _DashboardView(
        onOpenPocket: onOpenPocket,
        onOpenAdashi: onOpenAdashi,
        onOpenWallet: onOpenWallet,
      ),
    );
  }
}

class _DashboardView extends StatelessWidget {
  const _DashboardView({
    this.onOpenPocket,
    this.onOpenAdashi,
    this.onOpenWallet,
  });

  final ValueChanged<String>? onOpenPocket;
  final ValueChanged<String>? onOpenAdashi;
  final VoidCallback? onOpenWallet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.brandWordmark,
          style: context.textTheme.titleLarge?.copyWith(
            color: context.colorScheme.primary,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined),
          ),
          Padding(
            padding: const EdgeInsets.only(right: KpSpacing.m),
            child: CircleAvatar(
              radius: KpSpacing.m,
              backgroundColor: context.colorScheme.primaryContainer,
              child: Icon(
                Icons.person_rounded,
                size: KpSpacing.m,
                color: context.colorScheme.onPrimaryContainer,
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
          return KpAsyncView(
            status: state.status,
            loaded: (context) {
              final d = state.data;
              if (d == null) return const SizedBox.shrink();
              return ListView(
                padding: const EdgeInsets.all(KpSpacing.l),
                children: [
                  _GreetingCard(name: d.greetingName, totalSaved: d.totalSaved),
                  const Gap.m(),
                  _StatGrid(data: d, onOpenWallet: onOpenWallet),
                  const Gap.m(),
                  _WeeklyGoalCard(data: d),
                  const Gap.l(),
                  Text(
                    context.l10n.dashboardContributionTrend,
                    style: context.textTheme.titleLarge,
                  ),
                  const Gap.s(),
                  const _TrendCard(),
                  if (d.badges.isNotEmpty) ...[
                    const Gap.m(),
                    _BadgesRow(points: d.points, badges: d.badges),
                  ],
                  if (d.featuredPockets.isNotEmpty) ...[
                    const Gap.l(),
                    _SectionHeader(title: context.l10n.dashboardMyPockets),
                    const Gap.s(),
                    _PocketsRail(
                      pockets: d.featuredPockets,
                      onOpenPocket: onOpenPocket,
                    ),
                  ],
                  if (d.featuredAdashi != null) ...[
                    const Gap.l(),
                    _SectionHeader(
                      title: context.l10n.dashboardMyAdashi,
                      action: context.l10n.dashboardJoinGroup,
                    ),
                    const Gap.s(),
                    _AdashiCard(adashi: d.featuredAdashi!, onTap: onOpenAdashi),
                  ],
                  const Gap.l(),
                  Card(
                    child: ListTile(
                      leading: const Icon(Icons.shopping_cart_outlined),
                      title: Text(context.l10n.dashboardShortcutPlans),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () => Navigator.of(context).push<void>(
                        MaterialPageRoute(builder: (_) => const PlansPage()),
                      ),
                    ),
                  ),
                  const Gap.l(),
                  const _Footer(),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class _GreetingCard extends StatelessWidget {
  const _GreetingCard({required this.name, required this.totalSaved});

  final String name;
  final Money totalSaved;

  @override
  Widget build(BuildContext context) {
    return KpCard.financial(
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.dashboardGreeting(name),
                  style: context.textTheme.headlineMedium,
                ),
                Text('👋', style: context.textTheme.headlineMedium),
                const Gap.xs(),
                Text(
                  totalSaved.format(),
                  style: context.textTheme.displayLarge?.copyWith(
                    color: context.colorScheme.primary,
                  ),
                ),
                Text(
                  context.l10n.dashboardTotalSaved.toUpperCase(),
                  style: context.textTheme.labelSmall?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          const KpMascot(size: 72),
        ],
      ),
    );
  }
}

class _StatGrid extends StatelessWidget {
  const _StatGrid({required this.data, this.onOpenWallet});

  final DashboardView data;
  final VoidCallback? onOpenWallet;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _StatCard(
                icon: Icons.folder_rounded,
                tint: context.colorScheme.primary,
                value: '${data.activePockets}',
                caption: context.l10n.dashboardActivePockets,
              ),
            ),
            const Gap.s(horizontal: true),
            Expanded(
              child: _StatCard(
                icon: Icons.groups_rounded,
                tint: context.colors.warning,
                value: '${data.adashiGroups}',
                caption: context.l10n.dashboardAdashiGroups,
              ),
            ),
          ],
        ),
        const Gap.s(),
        Row(
          children: [
            Expanded(
              child: _StatCard(
                icon: Icons.verified_user_rounded,
                tint: context.colorScheme.primary,
                value: data.reputationTier,
                caption: context.l10n.dashboardReputation,
              ),
            ),
            const Gap.s(horizontal: true),
            Expanded(
              child: _StatCard(
                icon: Icons.account_balance_wallet_rounded,
                tint: context.colorScheme.error,
                value: data.walletBalance.format(),
                caption: context.l10n.dashboardWalletBalance,
                onTap: onOpenWallet,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.icon,
    required this.tint,
    required this.value,
    required this.caption,
    this.onTap,
  });

  final IconData icon;
  final Color tint;
  final String value;
  final String caption;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final card = KpCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(KpSpacing.xs),
            decoration: BoxDecoration(
              color: tint.withValues(alpha: 0.12),
              borderRadius: KpRadii.allM,
            ),
            child: Icon(icon, color: tint, size: KpSpacing.l),
          ),
          const Gap.s(),
          Text(value, style: context.textTheme.titleLarge),
          Text(
            caption.toUpperCase(),
            style: context.textTheme.labelSmall?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
    if (onTap == null) return card;
    return GestureDetector(onTap: onTap, child: card);
  }
}

class _WeeklyGoalCard extends StatelessWidget {
  const _WeeklyGoalCard({required this.data});

  static const double _claimWidth = 180;

  final DashboardView data;

  @override
  Widget build(BuildContext context) {
    return KpCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.track_changes_rounded,
                color: context.colorScheme.error,
              ),
              const Gap.xs(horizontal: true),
              Expanded(
                child: Text(
                  context.l10n.dashboardWeeklyGoal,
                  style: context.textTheme.titleMedium,
                ),
              ),
              if (data.weeklyGoalComplete)
                _Pill(
                  label: context.l10n.dashboardComplete,
                  icon: Icons.check_circle_rounded,
                ),
            ],
          ),
          const Gap.m(),
          Row(
            children: [
              Expanded(
                child: _MiniBadge(
                  icon: Icons.local_fire_department_rounded,
                  tint: context.colors.warning,
                  value: '${data.streakDays}',
                  label: context.l10n.dashboardWeekStreak,
                ),
              ),
              const Gap.s(horizontal: true),
              Expanded(
                child: _MiniBadge(
                  icon: Icons.ac_unit_rounded,
                  tint: context.colorScheme.primary,
                  value: '${data.freezesLeft}',
                  label: context.l10n.dashboardFreezesLeft,
                ),
              ),
            ],
          ),
          const Gap.m(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n.dashboardResetsMonday.toUpperCase(),
                style: context.textTheme.labelSmall?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
              if (data.weeklyGoalComplete)
                SizedBox(
                  width: _claimWidth,
                  child: KpButton(
                    label: context.l10n.dashboardClaimReward,
                    onPressed: () {},
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MiniBadge extends StatelessWidget {
  const _MiniBadge({
    required this.icon,
    required this.tint,
    required this.value,
    required this.label,
  });

  final IconData icon;
  final Color tint;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.s),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerHighest,
        borderRadius: KpRadii.allM,
      ),
      child: Row(
        children: [
          Icon(icon, color: tint, size: KpSpacing.l),
          const Gap.xs(horizontal: true),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(value, style: context.textTheme.titleMedium),
                Text(
                  label.toUpperCase(),
                  style: context.textTheme.labelSmall?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TrendCard extends StatelessWidget {
  const _TrendCard();

  static const double _plotHeight = 120;

  @override
  Widget build(BuildContext context) {
    return KpCard(
      child: Column(
        children: [
          SizedBox(
            height: _plotHeight,
            child: Center(
              child: Divider(color: context.colorScheme.outlineVariant),
            ),
          ),
          const Gap.xs(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (final m in const ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'])
                Text(
                  m.toUpperCase(),
                  style: context.textTheme.labelSmall?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _BadgesRow extends StatelessWidget {
  const _BadgesRow({required this.points, required this.badges});

  static const double _ringSize = 56;

  final int points;
  final List<String> badges;

  @override
  Widget build(BuildContext context) {
    return KpCard(
      child: Row(
        children: [
          SizedBox(
            width: _ringSize,
            height: _ringSize,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned.fill(
                  child: CircularProgressIndicator(
                    value: (points / 100).clamp(0, 1),
                    strokeWidth: KpSpacing.xs,
                    strokeCap: StrokeCap.round,
                    backgroundColor:
                        context.colorScheme.surfaceContainerHighest,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('$points', style: context.textTheme.titleMedium),
                    Text(
                      context.l10n.dashboardPoints,
                      style: context.textTheme.labelSmall?.copyWith(
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Gap.m(horizontal: true),
          Expanded(
            child: Wrap(
              spacing: KpSpacing.xs,
              runSpacing: KpSpacing.xs,
              children: [for (final badge in badges) _BadgeChip(label: badge)],
            ),
          ),
        ],
      ),
    );
  }
}

class _BadgeChip extends StatelessWidget {
  const _BadgeChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.s,
        vertical: KpSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: context.colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(KpRadii.pill),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.military_tech_rounded,
            size: KpSpacing.m,
            color: context.colors.warning,
          ),
          const Gap.xxs(horizontal: true),
          Text(
            label,
            style: context.textTheme.labelSmall?.copyWith(
              color: context.colorScheme.onSecondaryContainer,
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title, this.action});

  final String title;
  final String? action;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: context.textTheme.titleLarge),
        Text(
          action ?? context.l10n.dashboardViewAll,
          style: context.textTheme.labelLarge?.copyWith(
            color: context.colorScheme.primary,
          ),
        ),
      ],
    );
  }
}

class _PocketsRail extends StatelessWidget {
  const _PocketsRail({required this.pockets, this.onOpenPocket});

  static const double _railHeight = 168;
  static const double _cardWidth = 260;
  static const double _bannerHeight = 64;

  final List<DashboardPocketView> pockets;
  final ValueChanged<String>? onOpenPocket;

  @override
  Widget build(BuildContext context) {
    final palette = [
      context.colorScheme.primary,
      context.colorScheme.error,
      context.colors.warning,
    ];
    return SizedBox(
      height: _railHeight,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: pockets.length,
        separatorBuilder: (_, _) => const Gap.s(horizontal: true),
        itemBuilder: (context, i) {
          final p = pockets[i];
          final banner = palette[i % palette.length];
          return SizedBox(
            width: _cardWidth,
            child: GestureDetector(
              onTap: () => onOpenPocket?.call(p.id),
              child: ClipRRect(
                borderRadius: KpRadii.allXl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: _bannerHeight,
                      color: banner,
                      padding: const EdgeInsets.all(KpSpacing.s),
                      alignment: Alignment.topRight,
                      child: _Pill(label: p.tag, onBanner: true),
                    ),
                    Expanded(
                      child: Container(
                        color: context.colorScheme.surface,
                        padding: const EdgeInsets.all(KpSpacing.m),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              p.name,
                              style: context.textTheme.titleMedium,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const Gap.xxs(),
                            Text(
                              context.l10n.dashboardPerHand(
                                p.handPrice.format(),
                              ),
                              style: context.textTheme.titleMedium?.copyWith(
                                color: context.colorScheme.primary,
                              ),
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                Icon(
                                  Icons.calendar_today_rounded,
                                  size: KpSpacing.m,
                                  color: context.colorScheme.onSurfaceVariant,
                                ),
                                const Gap.xxs(horizontal: true),
                                Text(
                                  p.scheduleLabel,
                                  style: context.textTheme.labelSmall?.copyWith(
                                    color: context.colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _AdashiCard extends StatelessWidget {
  const _AdashiCard({required this.adashi, this.onTap});

  final DashboardAdashiView adashi;
  final ValueChanged<String>? onTap;

  @override
  Widget build(BuildContext context) {
    final onGold = context.colorScheme.onSecondaryContainer;
    return GestureDetector(
      onTap: () => onTap?.call(adashi.id),
      child: Container(
        padding: const EdgeInsets.all(KpSpacing.l),
        decoration: BoxDecoration(
          color: context.colorScheme.secondaryContainer,
          borderRadius: KpRadii.allXl,
          border: Border(
            bottom: BorderSide(color: context.colors.warning, width: 7),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: _Pill(
                label: context.l10n.adashiCycleProgress(
                  adashi.cycleCurrent,
                  adashi.cycleTotal,
                ),
              ),
            ),
            Text(
              adashi.name,
              style: context.textTheme.titleLarge?.copyWith(color: onGold),
            ),
            const Gap.xxs(),
            Text(
              context.l10n
                  .dashboardMembersParticipating(adashi.members)
                  .toUpperCase(),
              style: context.textTheme.labelSmall?.copyWith(color: onGold),
            ),
            const Gap.s(),
            Text(
              context.l10n.dashboardPerCycle(adashi.perCycle.format()),
              style: context.textTheme.titleMedium?.copyWith(color: onGold),
            ),
          ],
        ),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(KpSpacing.m),
          decoration: BoxDecoration(
            color: context.colorScheme.surfaceContainerHighest,
            borderRadius: KpRadii.allM,
          ),
          child: Text(
            context.l10n.dashboardFooter,
            style: context.textTheme.bodySmall?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const Gap.s(),
        Text(
          context.l10n.dashboardCopyright,
          style: context.textTheme.labelSmall?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}

class _Pill extends StatelessWidget {
  const _Pill({required this.label, this.icon, this.onBanner = false});

  final String label;
  final IconData? icon;
  final bool onBanner;

  @override
  Widget build(BuildContext context) {
    final bg = onBanner
        ? context.colorScheme.surface.withValues(alpha: 0.9)
        : context.colorScheme.primaryContainer;
    final fg = context.colorScheme.onPrimaryContainer;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.xs,
        vertical: KpSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(KpRadii.pill),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: KpSpacing.m, color: fg),
            const Gap.xxs(horizontal: true),
          ],
          Text(
            label.toUpperCase(),
            style: context.textTheme.labelSmall?.copyWith(color: fg),
          ),
        ],
      ),
    );
  }
}
