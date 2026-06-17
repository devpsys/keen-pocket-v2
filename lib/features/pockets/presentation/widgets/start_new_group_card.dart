import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/dashed_border.dart';

/// Dashed "Start New Group" cell that sits alongside the tablet pocket grid and
/// matches the height of the surrounding cards.
class StartNewGroupCard extends StatelessWidget {
  const StartNewGroupCard({required this.onTap, super.key});

  static const double _minHeight = 220;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DashedBorder(
        color: context.colorScheme.outlineVariant,
        radius: KpRadii.xl,
        strokeWidth: 2,
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: _minHeight),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add_circle_outline_rounded,
                  size: KpSpacing.xl,
                  color: context.colorScheme.onSurfaceVariant,
                ),
                const Gap.s(),
                Text(
                  context.l10n.pocketsStartNewGroup,
                  style: context.textTheme.headlineSmall?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
