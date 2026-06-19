import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/discovery/presentation/widgets/circle_rules_card.dart';
import 'package:keenpockets/features/discovery/presentation/widgets/explore_adashi_fixtures.dart';

/// Phone layout for the public-circle detail (design `explore_adashi`).
class ExploreAdashiPhoneView extends StatelessWidget {
  const ExploreAdashiPhoneView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(
        KpSpacing.l,
        KpSpacing.l,
        KpSpacing.l,
        KpSpacing.xxl,
      ),
      children: [
        const _Hero(),
        const Gap.l(),
        const _StatsRow(),
        const Gap.l(),
        const _AdminNotice(),
        const Gap.l(),
        const CircleRulesCard(),
        const Gap.l(),
        const _MascotTip(),
      ],
    );
  }
}

class _Hero extends StatelessWidget {
  const _Hero();

  static const double _avatarSize = 96;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: _avatarSize,
          height: _avatarSize,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: context.colorScheme.secondaryContainer,
            borderRadius: KpRadii.allXl,
            border: Border.all(color: context.colorScheme.secondary, width: 4),
          ),
          child: const KpMascot(size: 72),
        ),
        const Gap.m(),
        Text(kCircleName, style: context.textTheme.headlineMedium),
        const Gap.xxs(),
        Text(
          context.l10n.exploreManagedBy(kCircleOrganiser),
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
          ),
        ),
        const Gap.s(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _Pill(
              icon: Icons.star_rounded,
              label: context.l10n.exploreRep(kCircleRating),
              bg: context.colorScheme.secondaryContainer,
              fg: context.colorScheme.onSecondaryContainer,
            ),
            const Gap.s(horizontal: true),
            _Pill(
              icon: KpIcons.verified,
              label: context.l10n.discoverBadgeKyc,
              bg: context.colorScheme.primaryContainer,
              fg: context.colorScheme.onPrimaryContainer,
            ),
          ],
        ),
      ],
    );
  }
}

class _Pill extends StatelessWidget {
  const _Pill({
    required this.icon,
    required this.label,
    required this.bg,
    required this.fg,
  });

  final IconData icon;
  final String label;
  final Color bg;
  final Color fg;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.m,
        vertical: KpSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(KpRadii.pill),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: KpSpacing.m, color: fg),
          const Gap.xxs(horizontal: true),
          Text(label, style: context.textTheme.labelLarge?.copyWith(color: fg)),
        ],
      ),
    );
  }
}

class _StatsRow extends StatelessWidget {
  const _StatsRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _StatTile(
            icon: KpIcons.group,
            tint: context.colorScheme.primary,
            label: context.l10n.exploreMembersCount(kCircleMembers),
          ),
        ),
        const Gap.s(horizontal: true),
        Expanded(
          child: _StatTile(
            icon: KpIcons.payments,
            tint: context.colorScheme.secondary,
            label: context.l10n.explorePerCycle(kCirclePerCycle.formatShort()),
          ),
        ),
        const Gap.s(horizontal: true),
        Expanded(
          child: _StatTile(
            icon: KpIcons.calendar,
            tint: context.colorScheme.error,
            label: context.l10n.exploreCycleLength(kCircleCycleDays),
          ),
        ),
      ],
    );
  }
}

class _StatTile extends StatelessWidget {
  const _StatTile({
    required this.icon,
    required this.tint,
    required this.label,
  });

  final IconData icon;
  final Color tint;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLowest,
        borderRadius: KpRadii.allL,
        border: Border(
          bottom: BorderSide(
            color: context.colorScheme.surfaceContainerHighest,
            width: 4,
          ),
        ),
      ),
      child: Column(
        children: [
          Icon(icon, color: tint),
          const Gap.xs(),
          Text(
            label,
            style: context.textTheme.labelMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _AdminNotice extends StatelessWidget {
  const _AdminNotice();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLow,
        borderRadius: KpRadii.allL,
        border: Border.all(color: context.colorScheme.outlineVariant, width: 2),
      ),
      child: Row(
        children: [
          Icon(Icons.lock_rounded, color: context.colorScheme.outline),
          const Gap.s(horizontal: true),
          Expanded(
            child: Text(
              context.l10n.exploreAdminManaged,
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MascotTip extends StatelessWidget {
  const _MascotTip();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: BoxDecoration(
        color: context.colorScheme.primaryContainer.withValues(alpha: 0.15),
        borderRadius: KpRadii.allL,
      ),
      child: Row(
        children: [
          const KpMascot(size: 48),
          const Gap.s(horizontal: true),
          Expanded(
            child: Text(
              kCircleTestimonial,
              style: context.textTheme.labelMedium?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
