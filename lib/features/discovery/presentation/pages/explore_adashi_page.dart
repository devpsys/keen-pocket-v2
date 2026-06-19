import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/app/app_nav.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/discovery/presentation/widgets/explore_adashi_fixtures.dart';
import 'package:keenpockets/features/discovery/presentation/widgets/explore_adashi_phone_view.dart';
import 'package:keenpockets/features/discovery/presentation/widgets/explore_adashi_tablet_view.dart';

/// Public circle detail (designs `explore_adashi` / `_tablet`). Presentation-only:
/// rendered from placeholder fixtures; reached from a Discover card.
class ExploreAdashiPage extends StatelessWidget {
  const ExploreAdashiPage({required this.circleId, super.key});

  final String circleId;

  @override
  Widget build(BuildContext context) {
    final expanded = context.isExpanded;
    return AppTabletShell(
      body: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          title: Text(
            kCircleName,
            style: context.textTheme.titleLarge?.copyWith(
              color: context.colorScheme.primary,
            ),
          ),
        ),
        bottomNavigationBar: expanded
            ? null
            : SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(KpSpacing.l),
                  child: KpButton(
                    label: context.l10n.exploreJoinCircle,
                    icon: KpIcons.adashi,
                    onPressed: () {},
                  ),
                ),
              ),
        body: expanded
            ? const ExploreAdashiTabletView()
            : const ExploreAdashiPhoneView(),
      ),
    );
  }
}
