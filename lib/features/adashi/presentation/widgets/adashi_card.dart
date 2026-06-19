import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/adashi/presentation/view_models/adashi_view.dart';
import 'package:keenpockets/features/adashi/presentation/widgets/adashi_member_avatars.dart';

/// Phone card for a rotating savings circle (design `adashi_circles`): an ACTIVE
/// badge + rotation glyph, the per-cycle amount, the member cluster, and the
/// cycle progress with the next-payout countdown.
class AdashiCard extends StatelessWidget {
  const AdashiCard({required this.adashi, required this.onTap, super.key});

  final AdashiSummaryView adashi;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return KpCard(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _StatusPill(active: adashi.isActive),
                    const Gap.xs(),
                    Text(adashi.name, style: context.textTheme.headlineMedium),
                  ],
                ),
              ),
              const Gap.s(horizontal: true),
              Container(
                padding: const EdgeInsets.all(KpSpacing.s),
                decoration: BoxDecoration(
                  color: context.colorScheme.surfaceContainerHighest,
                  borderRadius: KpRadii.allM,
                ),
                child: Icon(
                  Icons.sync_rounded,
                  color: context.colorScheme.primary,
                  size: KpSpacing.l,
                ),
              ),
            ],
          ),
          const Gap.m(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                adashi.perCycle.format(),
                style: context.textTheme.headlineMedium?.copyWith(
                  color: context.colorScheme.primary,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const Gap.xs(horizontal: true),
              Text(
                context.l10n.adashiPerCycleSuffix,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          const Gap.m(),
          Row(
            children: [
              AdashiMemberAvatars(
                urls: adashi.memberAvatarUrls,
                extra: adashi.extraMembers,
              ),
              const Gap.s(horizontal: true),
              Expanded(
                child: Text(
                  context.l10n.adashiMembersParticipating(adashi.memberCount),
                  style: context.textTheme.labelLarge?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ],
          ),
          const Gap.m(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n.adashiCycleProgress(
                  adashi.currentCycle,
                  adashi.totalCycles,
                ),
                style: context.textTheme.labelLarge?.copyWith(
                  color: context.colorScheme.primary,
                ),
              ),
              Text(
                context.l10n.adashiNextPayoutDays(adashi.nextPayoutDays),
                style: context.textTheme.labelSmall?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          const Gap.s(),
          KpProgressBar(value: adashi.progress, height: 16),
        ],
      ),
    );
  }
}

/// "Active" / "Completed" status badge.
class _StatusPill extends StatelessWidget {
  const _StatusPill({required this.active});

  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.s,
        vertical: KpSpacing.xxs,
      ),
      decoration: BoxDecoration(
        // Light-blue "primary-container/20" wash with dark-blue text, per design.
        color: context.colorScheme.primary.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(KpRadii.pill),
      ),
      child: Text(
        (active
                ? context.l10n.adashiStatusActive
                : context.l10n.adashiStatusCompleted)
            .toUpperCase(),
        style: context.textTheme.labelSmall?.copyWith(
          color: context.colorScheme.onPrimaryContainer,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
