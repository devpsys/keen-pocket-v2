import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/app/app_nav.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/feature_flags/feature.dart';
import 'package:keenpockets/core/feature_flags/feature_flag_service.dart';
import 'package:keenpockets/core/feature_flags/feature_guard.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/school/presentation/widgets/create_school_widgets.dart';

/// Create-school registration form (designs `create_school` / `_tablet`).
/// Flag-gated: when `SCHOOL_ENABLED` is off (the default) the coming-soon card
/// shows instead. Presentation-only.
class CreateSchoolPage extends StatelessWidget {
  const CreateSchoolPage({super.key});

  @override
  Widget build(BuildContext context) {
    final enabled = getIt<FeatureFlagService>().isEnabled(Feature.school);
    final gated = FeatureGuard(
      enabled: enabled,
      comingSoon: KpComingSoonCard(
        title: context.l10n.comingSoonTitle,
        message: context.l10n.comingSoonMessage,
      ),
      child: context.isExpanded
          ? const CreateSchoolTabletView()
          : const CreateSchoolPhoneView(),
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
        context.l10n.createSchoolTitle,
        style: context.textTheme.titleLarge?.copyWith(
          color: context.colorScheme.primary,
        ),
      ),
    );
  }
}
