import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';

/// Mascot intro banner shown atop the phone create-pocket form.
class CreatePocketIntroCard extends StatelessWidget {
  const CreatePocketIntroCard({super.key});

  @override
  Widget build(BuildContext context) {
    return KpCard.financial(
      child: Row(
        children: [
          const KpMascot.think(size: 64),
          const Gap.m(horizontal: true),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.createPocketIntroTitle,
                  style: context.textTheme.titleLarge,
                ),
                const Gap.xxs(),
                Text(
                  context.l10n.createPocketIntroBody,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Left identity pane on tablet (design `create_pocket_tablet`): mascot, intro
/// copy and the Verified / Collaborative feature chips.
class CreatePocketTabletIntro extends StatelessWidget {
  const CreatePocketTabletIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.colorScheme.surface,
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(KpSpacing.xl),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const KpMascot.think(size: 200),
              const Gap.l(),
              Text(
                context.l10n.createPocketIntroTitle,
                style: context.textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const Gap.s(),
              Text(
                context.l10n.createPocketIntroBody,
                style: context.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: context.colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
              const Gap.xl(),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _Feature(
                    icon: KpIcons.security,
                    label: context.l10n.createPocketVerified,
                  ),
                  const Gap.l(horizontal: true),
                  _Feature(
                    icon: KpIcons.group,
                    label: context.l10n.createPocketCollaborative,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Feature extends StatelessWidget {
  const _Feature({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(KpSpacing.s),
          decoration: BoxDecoration(
            color: context.colorScheme.surfaceContainerHighest,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: context.colorScheme.primary),
        ),
        const Gap.xxs(),
        Text(
          label.toUpperCase(),
          style: context.textTheme.labelSmall?.copyWith(
            fontWeight: FontWeight.w500,
            color: context.colorScheme.outline,
          ),
        ),
      ],
    );
  }
}
