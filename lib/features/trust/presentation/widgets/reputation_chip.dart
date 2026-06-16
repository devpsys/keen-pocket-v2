import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';

/// Compact reputation pill for group/profile headers: a shield, the numeric
/// trust score and the band (e.g. "Trusted"). The band text is data supplied by
/// the caller, not a UI literal.
class ReputationChip extends StatelessWidget {
  const ReputationChip({required this.score, required this.band, super.key});

  final int score;
  final String band;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.s,
        vertical: KpSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: context.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(KpRadii.pill),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.verified_user_rounded,
            size: KpSpacing.m,
            color: context.colorScheme.primary,
          ),
          const Gap.xxs(horizontal: true),
          Text(
            '$score · $band',
            style: context.textTheme.labelLarge?.copyWith(
              color: context.colorScheme.onPrimaryContainer,
            ),
          ),
        ],
      ),
    );
  }
}

/// KYC verification badge — a green shield, optionally with the "KYC verified"
/// label. Rendered on profiles, pocket headers and member lists.
class KycBadge extends StatelessWidget {
  const KycBadge({this.showLabel = true, super.key});

  final bool showLabel;

  @override
  Widget build(BuildContext context) {
    final color = context.colors.success;
    if (!showLabel) {
      return Icon(Icons.verified_rounded, size: KpSpacing.m, color: color);
    }
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.xs,
        vertical: KpSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: context.colors.successContainer,
        borderRadius: BorderRadius.circular(KpRadii.pill),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.verified_rounded, size: KpSpacing.m, color: color),
          const Gap.xxs(horizontal: true),
          Text(
            context.l10n.profileKycVerified,
            style: context.textTheme.labelSmall?.copyWith(color: color),
          ),
        ],
      ),
    );
  }
}
