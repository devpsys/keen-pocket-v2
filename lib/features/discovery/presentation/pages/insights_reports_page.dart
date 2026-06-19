import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/app/app_nav.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/discovery/presentation/widgets/insights_reports_phone_view.dart';
import 'package:keenpockets/features/discovery/presentation/widgets/insights_reports_tablet_view.dart';

/// "Year in Review" insights & reports (designs `insights_reports` / `_tablet`).
/// Presentation-only: rendered from placeholder fixtures.
class InsightsReportsPage extends StatelessWidget {
  const InsightsReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTabletShell(
      body: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          title: Text(
            context.l10n.insightsTitle,
            style: context.textTheme.titleLarge?.copyWith(
              color: context.colorScheme.primary,
            ),
          ),
        ),
        body: context.isExpanded
            ? const InsightsReportsTabletView()
            : const InsightsReportsPhoneView(),
      ),
    );
  }
}
