import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/core/widgets/kp_network_image.dart';
import 'package:keenpockets/features/administration/presentation/organiser_fixtures.dart';
import 'package:keenpockets/features/administration/presentation/view_models/organiser_view.dart';
import 'package:keenpockets/features/administration/presentation/widgets/admin_widgets.dart';
import 'package:keenpockets/features/administration/presentation/widgets/organiser_widgets.dart';

/// Tablet organiser dashboard: a wide welcome hero, a 3-up stat row, a 3-column
/// pocket-health grid and the pulse checklist (design `admin_health_dashboard`).
class OrganiserDashboardTabletView extends StatelessWidget {
  const OrganiserDashboardTabletView({required this.organiser, super.key});

  final OrganiserView organiser;

  static const double _maxWidth = 1200;

  @override
  Widget build(BuildContext context) {
    final columns = context.isExpanded ? 3 : 2;
    return ListView(
      padding: const EdgeInsets.all(KpSpacing.xl),
      children: [
        Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: _maxWidth),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _TabletHero(activePockets: organiser.activePockets),
                const Gap.xl(),
                OrganiserStats(organiser: organiser, columns: 3),
                const Gap.xl(),
                const OrganiserHealthHeading(),
                const Gap.l(),
                OrganiserPocketGrid(
                  pockets: organiser.pockets,
                  columns: columns,
                ),
                const Gap.xl(),
                OrganiserPulseCard(pulse: organiser.pulse),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _TabletHero extends StatelessWidget {
  const _TabletHero({required this.activePockets});

  final int activePockets;

  static const double _mascot = 180;
  static const double _ctaWidth = 200;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.xl),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: KpRadii.allXl,
        border: Border(
          bottom: BorderSide(
            color: context.colorScheme.outlineVariant,
            width: 6,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.organiserGreeting,
                  style: context.textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const Gap.xs(),
                Text(
                  context.l10n.organiserGreetingNote(activePockets),
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
                const Gap.l(),
                Row(
                  children: [
                    SizedBox(
                      width: _ctaWidth,
                      child: AdminCandyButton(
                        label: context.l10n.organiserCreatePocket,
                        face: context.colorScheme.primary,
                        fg: context.colorScheme.onPrimaryContainer,
                        depth: KpColors.brand800,
                        onPressed: () {},
                      ),
                    ),
                    const Gap.m(horizontal: true),
                    SizedBox(
                      width: _ctaWidth,
                      child: AdminCandyButton(
                        label: context.l10n.organiserDownloadCsv,
                        face: context.colorScheme.surfaceContainerHigh,
                        fg: context.colorScheme.onSurfaceVariant,
                        depth: context.colorScheme.outlineVariant,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Gap.xl(horizontal: true),
          Container(
            width: _mascot,
            height: _mascot,
            clipBehavior: Clip.antiAlias,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: context.colorScheme.primaryContainer.withValues(
                alpha: 0.4,
              ),
              shape: BoxShape.circle,
              border: Border.all(
                color: context.colorScheme.primaryContainer,
                width: 4,
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.all(KpSpacing.l),
              child: KpNetworkImage(
                url: kOrganiserMascotUrl,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
