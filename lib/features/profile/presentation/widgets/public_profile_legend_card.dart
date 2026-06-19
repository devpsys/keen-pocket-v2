import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/profile/presentation/widgets/public_profile_fixtures.dart';

/// Celebratory "You're a Legend" reputation card with a dashed border + mascot.
class PublicProfileLegendCard extends StatelessWidget {
  const PublicProfileLegendCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: BoxDecoration(
        color: context.colorScheme.primaryContainer.withValues(alpha: 0.12),
        borderRadius: KpRadii.allXl,
        border: Border.all(
          color: context.colorScheme.primaryContainer,
          width: 2,
        ),
      ),
      child: Column(
        children: [
          const KpMascot.celebrate(size: 120),
          const Gap.s(),
          Text(
            context.l10n.publicProfileLegendTitle(kPublicName),
            style: context.textTheme.titleLarge?.copyWith(
              color: context.colorScheme.primary,
            ),
            textAlign: TextAlign.center,
          ),
          const Gap.xs(),
          Text(
            context.l10n.publicProfileLegendBody,
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w400,
              color: context.colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
