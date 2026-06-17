import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

/// Colour tone for a [PocketPill].
enum PocketPillTone { success, neutral, info, warning }

/// A small rounded status pill used throughout the pocket detail hub.
class PocketPill extends StatelessWidget {
  const PocketPill({
    required this.label,
    this.tone = PocketPillTone.neutral,
    super.key,
  });

  final String label;
  final PocketPillTone tone;

  @override
  Widget build(BuildContext context) {
    final (Color bg, Color fg) = switch (tone) {
      PocketPillTone.success => (
        context.colors.successContainer,
        context.colors.success,
      ),
      PocketPillTone.warning => (
        context.colors.warningContainer,
        context.colors.warning,
      ),
      PocketPillTone.info => (
        context.colorScheme.primaryContainer,
        context.colorScheme.onPrimaryContainer,
      ),
      PocketPillTone.neutral => (
        context.colorScheme.surfaceContainerHighest,
        context.colorScheme.onSurfaceVariant,
      ),
    };
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.xs,
        vertical: KpSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(KpRadii.pill),
      ),
      child: Text(
        label,
        style: context.textTheme.labelSmall?.copyWith(color: fg),
      ),
    );
  }
}
