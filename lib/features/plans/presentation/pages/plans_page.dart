import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/feature_flags/feature.dart';
import 'package:keenpockets/core/feature_flags/feature_flag_service.dart';
import 'package:keenpockets/core/feature_flags/feature_guard.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/plans/presentation/cubit/plans_cubit.dart';
import 'package:keenpockets/features/plans/presentation/cubit/plans_state.dart';

/// Shopping/budget plans. Backend-gap → flag-gated (built dark): shows the
/// coming-soon card until `PLANS_ENABLED` flips on.
class PlansPage extends StatelessWidget {
  const PlansPage({super.key});

  @override
  Widget build(BuildContext context) {
    final enabled = getIt<FeatureFlagService>().isEnabled(Feature.plans);
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.plansTitle)),
      body: FeatureGuard(
        enabled: enabled,
        comingSoon: KpComingSoonCard(
          title: context.l10n.comingSoonTitle,
          message: context.l10n.comingSoonMessage,
        ),
        child: BlocProvider<PlansCubit>(
          create: (_) => getIt<PlansCubit>()..load(),
          child: const _PlansView(),
        ),
      ),
    );
  }
}

class _PlansView extends StatelessWidget {
  const _PlansView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlansCubit, PlansState>(
      builder: (context, state) {
        return KpAsyncView(
          status: state.status,
          loaded: (context) => ListView.separated(
            padding: const EdgeInsets.all(KpSpacing.m),
            itemCount: state.plans.length,
            separatorBuilder: (_, _) => const Gap.s(),
            itemBuilder: (context, index) {
              final plan = state.plans[index];
              return Card(
                child: ListTile(
                  title: Text(plan.name),
                  subtitle: Text(context.l10n.plansItemsCount(plan.itemCount)),
                  trailing: Text(
                    plan.budget.format(),
                    style: context.textTheme.titleMedium,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
