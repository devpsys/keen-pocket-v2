import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/core/widgets/dashed_rrect_painter.dart';

/// Empty disputes banner (design `adashi_hub`): a dashed error-bordered card
/// reassuring there are no active disputes.
class AdashiDisputesBanner extends StatelessWidget {
  const AdashiDisputesBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: DashedRRectPainter(
        color: context.colorScheme.error,
        radius: KpRadii.xl,
      ),
      child: Container(
        padding: const EdgeInsets.all(KpSpacing.l),
        decoration: BoxDecoration(
          color: context.colorScheme.errorContainer.withValues(alpha: 0.2),
          borderRadius: KpRadii.allXl,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.gavel_rounded, color: context.colorScheme.error),
                const Gap.s(horizontal: true),
                Text(
                  context.l10n.adashiHubDisputesTitle,
                  style: context.textTheme.headlineSmall?.copyWith(
                    color: context.colorScheme.error,
                  ),
                ),
              ],
            ),
            const Gap.s(),
            Text(
              context.l10n.adashiHubDisputesEmpty,
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colorScheme.onErrorContainer,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
