import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:keenpockets/app/app_nav.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/feature_flags/feature.dart';
import 'package:keenpockets/core/feature_flags/feature_flag_service.dart';
import 'package:keenpockets/core/feature_flags/feature_guard.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/plans/presentation/cubit/plans_cubit.dart';
import 'package:keenpockets/features/plans/presentation/cubit/plans_state.dart';
import 'package:keenpockets/features/plans/presentation/pages/create_plan_page.dart';
import 'package:keenpockets/features/plans/presentation/widgets/plans_cockpit_view.dart';
import 'package:keenpockets/features/plans/presentation/widgets/plans_list_view.dart';

/// Shopping/budget plans. Backend-gap → flag-gated (built dark): shows the
/// coming-soon card until `PLANS_ENABLED` flips on (on in dev, off in prod).
class PlansPage extends StatelessWidget {
  const PlansPage({super.key});

  @override
  Widget build(BuildContext context) {
    final enabled = getIt<FeatureFlagService>().isEnabled(Feature.plans);
    return AppTabletShell(
      body: Scaffold(
        appBar: AppBar(
          title: Text(context.l10n.plansTitle),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(KpIcons.notificationsOutlined),
            ),
          ],
        ),
        floatingActionButton: enabled
            ? FloatingActionButton.extended(
                onPressed: () => Navigator.of(context).push<void>(
                  MaterialPageRoute(builder: (_) => const CreatePlanPage()),
                ),
                backgroundColor: context.colorScheme.secondaryContainer,
                foregroundColor: context.colorScheme.onSecondaryContainer,
                icon: const Icon(KpIcons.add),
                label: Text(context.l10n.plansCreatePlan),
              )
            : null,
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
          loaded: (context) => context.isExpanded
              ? PlansCockpitView(plans: state.plans)
              : PlansListView(plans: state.plans),
        );
      },
    );
  }
}
