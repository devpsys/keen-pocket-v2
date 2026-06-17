import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/pockets/domain/entities/pocket.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/pocket_detail_fixtures.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/pocket_pill.dart';
import 'package:keenpockets/features/trust/trust.dart';

/// Gradient banner + identity card heading the pocket detail hub.
class PocketHeaderCard extends StatelessWidget {
  const PocketHeaderCard({required this.pocket, required this.role, super.key});

  static const double _bannerHeight = 72;

  final Pocket pocket;
  final PocketRole role;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: KpRadii.allXl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Gradient banner with the status pill + reputation chip.
          Container(
            height: _bannerHeight,
            padding: const EdgeInsets.all(KpSpacing.s),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [context.colorScheme.primary, context.colors.warning],
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PocketPill(
                  label: context.l10n.pocketStatusOpen,
                  tone: PocketPillTone.success,
                ),
                const Spacer(),
                const ReputationChip(score: 48, band: '4.8'),
              ],
            ),
          ),
          Container(
            color: context.colorScheme.surface,
            padding: const EdgeInsets.all(KpSpacing.m),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(pocket.name, style: context.textTheme.headlineMedium),
                const Gap.xxs(),
                Text(
                  context.l10n.pocketDetailHandDuration(
                    pocket.handPrice.format(),
                  ),
                  style: context.textTheme.bodySmall?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
                const Divider(),
                Row(
                  children: [
                    const KycBadge(showLabel: false),
                    const Gap.xxs(horizontal: true),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            kPocketOrganiserName,
                            style: context.textTheme.labelLarge,
                          ),
                          Text(
                            context.l10n.pocketOrganiser,
                            style: context.textTheme.labelSmall?.copyWith(
                              color: context.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Gap.s(),
                Row(
                  children: [
                    Expanded(
                      child: KpButton(
                        label: context.l10n.pocketDetailRateAdmin,
                        variant: KpButtonVariant.ghost,
                        onPressed: () => RateOrganiserSheet.show(
                          context,
                          organiserName: kPocketOrganiserName,
                        ),
                      ),
                    ),
                    const Gap.s(horizontal: true),
                    Expanded(
                      child: KpButton(
                        label: context.l10n.pocketDetailShare,
                        icon: Icons.share_rounded,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
