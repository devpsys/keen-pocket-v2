import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/adashi/presentation/view_models/adashi_view.dart';
import 'package:keenpockets/features/adashi/presentation/widgets/adashi_member_avatars.dart';

/// Tablet grid card for a circle (design `adashi_circles_tablet`): a category
/// glyph + frequency pill, per-cycle amount, cycle progress, and the member
/// cluster beside the next-payout countdown.
class AdashiTabletCard extends StatelessWidget {
  const AdashiTabletCard({
    required this.adashi,
    required this.onTap,
    super.key,
  });

  final AdashiSummaryView adashi;
  final VoidCallback onTap;

  IconData get _icon => switch (adashi.category) {
    AdashiCategory.home => Icons.home_rounded,
    AdashiCategory.vehicle => Icons.directions_car_rounded,
    AdashiCategory.education => Icons.school_rounded,
    AdashiCategory.business => Icons.business_center_rounded,
    AdashiCategory.market => Icons.storefront_rounded,
  };

  Color _tint(BuildContext context) => switch (adashi.category) {
    AdashiCategory.home => context.colorScheme.primary,
    AdashiCategory.vehicle => context.colorScheme.error,
    AdashiCategory.education => context.colorScheme.secondary,
    AdashiCategory.business => context.colorScheme.primary,
    AdashiCategory.market => context.colorScheme.secondary,
  };

  @override
  Widget build(BuildContext context) {
    final tint = _tint(context);
    return KpCard(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(KpSpacing.s),
                decoration: BoxDecoration(
                  color: tint.withValues(alpha: 0.15),
                  borderRadius: KpRadii.allM,
                ),
                child: Icon(_icon, color: tint),
              ),
              _FrequencyPill(frequency: adashi.frequency),
            ],
          ),
          const Gap.m(),
          Text(adashi.name, style: context.textTheme.headlineSmall),
          const Gap.xxs(),
          Text(
            context.l10n.adashiPerCycleLine(adashi.perCycle.format()),
            style: context.textTheme.titleMedium?.copyWith(
              color: context.colorScheme.primary,
            ),
          ),
          const Gap.m(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n.adashiCycleProgressTitle,
                style: context.textTheme.labelMedium?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
              Text(
                context.l10n.adashiCycleCount(
                  adashi.currentCycle,
                  adashi.totalCycles,
                ),
                style: context.textTheme.labelMedium?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          const Gap.xs(),
          KpProgressBar(value: adashi.progress, color: tint, height: 10),
          const Gap.m(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AdashiMemberAvatars(
                urls: adashi.memberAvatarUrls,
                extra: adashi.extraMembers,
                radius: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    context.l10n.adashiNextPayout.toUpperCase(),
                    style: context.textTheme.labelSmall?.copyWith(
                      color: context.colorScheme.onSurfaceVariant,
                      letterSpacing: 0.5,
                    ),
                  ),
                  Text(
                    context.l10n.adashiPayoutInDays(adashi.nextPayoutDays),
                    style: context.textTheme.labelLarge?.copyWith(color: tint),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Gold "Weekly" / "Monthly" frequency pill.
class _FrequencyPill extends StatelessWidget {
  const _FrequencyPill({required this.frequency});

  final AdashiFrequency frequency;

  @override
  Widget build(BuildContext context) {
    final label = switch (frequency) {
      AdashiFrequency.weekly => context.l10n.adashiFrequencyWeekly,
      AdashiFrequency.monthly => context.l10n.adashiFrequencyMonthly,
    };
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.s,
        vertical: KpSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: context.colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(KpRadii.pill),
      ),
      child: Text(
        label,
        style: context.textTheme.labelSmall?.copyWith(
          fontWeight: FontWeight.w400,
          color: context.colorScheme.onSecondaryContainer,
        ),
      ),
    );
  }
}
