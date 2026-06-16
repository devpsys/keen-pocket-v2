import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:keenpockets/features/dashboard/presentation/cubit/dashboard_state.dart';
import 'package:keenpockets/features/plans/plans.dart';

/// At-a-glance savings cockpit: greeting, key stats, weekly goal, shortcuts.
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DashboardCubit>(
      create: (_) => getIt<DashboardCubit>()..load(),
      child: const _DashboardView(),
    );
  }
}

class _DashboardView extends StatelessWidget {
  const _DashboardView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.dashboardTitle)),
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
                  Text(
                    context.l10n.dashboardGreeting(d.greetingName),
                    style: context.textTheme.headlineMedium,
                  ),
                  const Gap.l(),
                  Row(
                    children: [
                      Expanded(
                        child: _StatTile(
                          label: context.l10n.dashboardTotalSaved,
                          value: d.totalSaved.format(),
                        ),
                      ),
                      const Gap.s(horizontal: true),
                      Expanded(
                        child: _StatTile(
                          label: context.l10n.dashboardActivePockets,
                          value: '${d.activePockets}',
                        ),
                      ),
                    ],
                  ),
                  const Gap.m(),
                  _StatTile(
                    label: context.l10n.dashboardWeeklyGoal,
                    value: context.l10n.dashboardStreak(d.streakDays),
                    progress: d.weeklyGoalProgress,
                  ),
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
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class _StatTile extends StatelessWidget {
  const _StatTile({required this.label, required this.value, this.progress});

  final String label;
  final String value;
  final double? progress;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerHighest,
        borderRadius: KpRadii.allL,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: context.textTheme.bodySmall?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
          const Gap.xs(),
          Text(value, style: context.textTheme.titleLarge),
          if (progress != null) ...[
            const Gap.s(),
            ClipRRect(
              borderRadius: KpRadii.allXs,
              child: LinearProgressIndicator(value: progress),
            ),
          ],
        ],
      ),
    );
  }
}
