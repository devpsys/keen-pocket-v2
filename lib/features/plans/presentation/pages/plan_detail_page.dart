import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/app/app_nav.dart';
import 'package:keenpockets/features/plans/presentation/widgets/plan_detail_fixtures.dart';
import 'package:keenpockets/features/plans/presentation/widgets/plan_detail_phone_view.dart';
import 'package:keenpockets/features/plans/presentation/widgets/plan_detail_tablet_view.dart';

/// Grocery plan detail (designs `grocery_plan_detail` / `_tablet`).
/// Presentation-only: rendered from placeholder fixtures.
class PlanDetailPage extends StatelessWidget {
  const PlanDetailPage({required this.planId, super.key});

  final String planId;

  @override
  Widget build(BuildContext context) {
    final expanded = context.isExpanded;
    return AppTabletShell(
      body: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          title: Text(
            kPlanDetailName,
            style: context.textTheme.titleLarge?.copyWith(
              color: context.colorScheme.primary,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(KpIcons.notificationsOutlined),
            ),
          ],
        ),
        floatingActionButton: expanded
            ? null
            : FloatingActionButton(
                onPressed: () {},
                backgroundColor: context.colorScheme.primary,
                foregroundColor: context.colorScheme.onPrimary,
                child: const Icon(Icons.save_rounded),
              ),
        body: expanded
            ? const PlanDetailTabletView()
            : const PlanDetailPhoneView(),
      ),
    );
  }
}
