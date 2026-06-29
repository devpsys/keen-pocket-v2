import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:keenpockets/app/app_nav.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/feature_flags/feature.dart';
import 'package:keenpockets/core/feature_flags/feature_flag_service.dart';
import 'package:keenpockets/core/feature_flags/feature_guard.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/school/presentation/cubit/school_cubit.dart';
import 'package:keenpockets/features/school/presentation/cubit/school_state.dart';
import 'package:keenpockets/features/school/presentation/pages/create_school_page.dart';
import 'package:keenpockets/features/school/presentation/pages/my_children_page.dart';
import 'package:keenpockets/features/school/presentation/widgets/school_dashboard_widgets.dart';

/// School-owner fee dashboard (designs `school_dashboard_owner` / `_tablet`).
/// Backend-gap → flag-gated (built dark).
class SchoolPage extends StatelessWidget {
  const SchoolPage({super.key});

  @override
  Widget build(BuildContext context) {
    final enabled = getIt<FeatureFlagService>().isEnabled(Feature.school);
    final gated = FeatureGuard(
      enabled: enabled,
      comingSoon: KpComingSoonCard(
        title: context.l10n.comingSoonTitle,
        message: context.l10n.comingSoonMessage,
      ),
      child: BlocProvider<SchoolCubit>(
        create: (_) => getIt<SchoolCubit>()..load(),
        child: const _SchoolView(),
      ),
    );

    if (context.isExpanded) {
      return AppTabletShell(
        body: Scaffold(
          appBar: _appBar(context),
          body: gated,
          floatingActionButton: enabled
              ? SchoolDashboardFab(
                  onPressed: () => Navigator.of(context).push<void>(
                    MaterialPageRoute(builder: (_) => const CreateSchoolPage()),
                  ),
                )
              : null,
        ),
      );
    }
    return Scaffold(appBar: _appBar(context), body: gated);
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      shape: Border(
        bottom: BorderSide(
          color: context.colorScheme.surfaceContainerHighest,
          width: 4,
        ),
      ),
      title: Text(
        context.l10n.schoolFeesTitle,
        style: context.textTheme.titleLarge?.copyWith(
          color: context.colorScheme.primary,
        ),
      ),
      actions: [
        IconButton(
          tooltip: context.l10n.myChildrenHeading,
          onPressed: () => Navigator.of(context).push<void>(
            MaterialPageRoute(builder: (_) => const MyChildrenPage()),
          ),
          icon: Icon(
            Icons.family_restroom_rounded,
            color: context.colorScheme.primary,
          ),
        ),
        IconButton(
          tooltip: context.l10n.createSchoolCta,
          onPressed: () => Navigator.of(context).push<void>(
            MaterialPageRoute(builder: (_) => const CreateSchoolPage()),
          ),
          icon: Icon(
            Icons.add_business_rounded,
            color: context.colorScheme.primary,
          ),
        ),
        if (context.isExpanded) ...[
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: KpSpacing.s),
            child: Center(child: SchoolOwnerBadge()),
          ),
        ],
      ],
    );
  }
}

class _SchoolView extends StatelessWidget {
  const _SchoolView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SchoolCubit, SchoolState>(
      builder: (context, state) {
        return KpAsyncView(
          status: state.status,
          loaded: (context) {
            final school = state.school;
            if (school == null) return const SizedBox.shrink();
            return context.isExpanded
                ? SchoolDashboardTabletView(school: school)
                : SchoolDashboardView(school: school);
          },
        );
      },
    );
  }
}
