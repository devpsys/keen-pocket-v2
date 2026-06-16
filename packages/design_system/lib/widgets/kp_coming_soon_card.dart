import 'package:flutter/material.dart';

import '../extensions/context_extensions.dart';
import '../radius/kp_radii.dart';
import '../spacing/kp_spacing.dart';

/// Rendered for flag-OFF capabilities (the `featureDisabled` state). Title and
/// message must be passed in already localized.
class KpComingSoonCard extends StatelessWidget {
  const KpComingSoonCard({
    required this.title,
    required this.message,
    super.key,
  });

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(KpSpacing.l),
        child: Container(
          padding: const EdgeInsets.all(KpSpacing.l),
          decoration: BoxDecoration(
            color: context.colorScheme.surfaceContainerHighest,
            borderRadius: KpRadii.allL,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.rocket_launch_outlined,
                size: KpSpacing.xxl,
                color: context.colorScheme.primary,
              ),
              const Gap.m(),
              Text(title, style: context.textTheme.titleMedium),
              const Gap.xs(),
              Text(
                message,
                textAlign: TextAlign.center,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
