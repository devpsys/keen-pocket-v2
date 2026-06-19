import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/profile/presentation/view_models/profile_view.dart';

/// 2×2 reputation stat grid on my-profile.
class ProfileStatGrid extends StatelessWidget {
  const ProfileStatGrid({required this.profile, super.key});

  final ProfileView profile;

  @override
  Widget build(BuildContext context) {
    final tiles = <Widget>[
      _StatTile(
        icon: Icons.verified_rounded,
        tint: context.colorScheme.primary,
        value: '${profile.paymentReliability}%',
        label: context.l10n.profileStatPaymentReliability,
      ),
      _StatTile(
        icon: Icons.eco_rounded,
        tint: context.colorScheme.secondary,
        value: '${profile.pocketsJoined}',
        label: context.l10n.profileStatPocketsJoined,
      ),
      _StatTile(
        icon: Icons.cached_rounded,
        tint: context.colorScheme.error,
        value: '${profile.adashisCompleted}',
        label: context.l10n.profileStatAdashisCompleted,
      ),
      _StatTile(
        icon: Icons.grade_rounded,
        tint: context.colorScheme.primary,
        value: '${profile.avgRating}',
        label: context.l10n.profileStatAvgRating,
      ),
    ];
    return Column(
      children: [
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: tiles[0]),
              const Gap.m(horizontal: true),
              Expanded(child: tiles[1]),
            ],
          ),
        ),
        const Gap.m(),
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: tiles[2]),
              const Gap.m(horizontal: true),
              Expanded(child: tiles[3]),
            ],
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
    required this.value,
    required this.label,
  });

  final IconData icon;
  final Color tint;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return KpCard(
      child: Column(
        children: [
          Icon(icon, color: tint, size: KpSpacing.xl),
          const Gap.xs(),
          Text(
            value,
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
          const Gap.xxs(),
          Text(
            label.toUpperCase(),
            style: context.textTheme.labelSmall?.copyWith(
              fontWeight: FontWeight.w500,
              color: context.colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
