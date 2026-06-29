import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:keenpockets/app/app_nav.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/feature_flags/feature.dart';
import 'package:keenpockets/core/feature_flags/feature_flag_service.dart';
import 'package:keenpockets/core/feature_flags/feature_guard.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/school/presentation/cubit/children_cubit.dart';
import 'package:keenpockets/features/school/presentation/cubit/children_state.dart';
import 'package:keenpockets/features/school/presentation/widgets/my_children_widgets.dart';

/// Parent-facing "School Fees" screen listing linked children and their tuition
/// plans (designs `my_children` / `_tablet`). Backend-gap → flag-gated (dark).
class MyChildrenPage extends StatelessWidget {
  const MyChildrenPage({super.key});

  @override
  Widget build(BuildContext context) {
    final enabled = getIt<FeatureFlagService>().isEnabled(Feature.school);
    final gated = FeatureGuard(
      enabled: enabled,
      comingSoon: KpComingSoonCard(
        title: context.l10n.comingSoonTitle,
        message: context.l10n.comingSoonMessage,
      ),
      child: BlocProvider<ChildrenCubit>(
        create: (_) => getIt<ChildrenCubit>()..load(),
        child: const _ChildrenView(),
      ),
    );

    if (context.isExpanded) {
      return AppTabletShell(
        body: Scaffold(appBar: _appBar(context), body: gated),
      );
    }
    return Scaffold(appBar: _appBar(context, showBack: true), body: gated);
  }

  PreferredSizeWidget _appBar(BuildContext context, {bool showBack = false}) {
    return AppBar(
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 0,
      leading: showBack
          ? IconButton(
              onPressed: () => Navigator.of(context).maybePop(),
              icon: Icon(
                Icons.arrow_back_rounded,
                color: context.colorScheme.primary,
              ),
            )
          : null,
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
    );
  }
}

class _ChildrenView extends StatelessWidget {
  const _ChildrenView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChildrenCubit, ChildrenState>(
      builder: (context, state) {
        return KpAsyncView(
          status: state.status,
          loaded: (context) {
            return context.isExpanded
                ? MyChildrenTabletView(children: state.children)
                : MyChildrenPhoneView(children: state.children);
          },
        );
      },
    );
  }
}
