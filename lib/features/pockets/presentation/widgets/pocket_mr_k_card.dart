import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';

/// Gold "Mr. K Says" coaching card with the mascot tucked into the corner.
class PocketMrKCard extends StatelessWidget {
  const PocketMrKCard({super.key});

  static const double _mascotSize = 96;
  static const double _mascotOffset = -8;

  @override
  Widget build(BuildContext context) {
    final onContainer = context.colorScheme.onSecondaryContainer;
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: BoxDecoration(
        color: context.colorScheme.secondaryContainer,
        borderRadius: KpRadii.allXl,
      ),
      child: ClipRRect(
        borderRadius: KpRadii.allXs,
        child: Stack(
          children: [
            const Positioned(
              right: _mascotOffset,
              bottom: _mascotOffset,
              child: KpMascot(size: _mascotSize),
            ),
            Padding(
              padding: const EdgeInsets.only(right: KpSpacing.l),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.pocketDetailMrKTitle,
                    style: context.textTheme.titleMedium?.copyWith(
                      color: onContainer,
                    ),
                  ),
                  const Gap.xs(),
                  Text(
                    context.l10n.pocketDetailMrKMessage,
                    style: context.textTheme.bodySmall?.copyWith(
                      color: onContainer,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
