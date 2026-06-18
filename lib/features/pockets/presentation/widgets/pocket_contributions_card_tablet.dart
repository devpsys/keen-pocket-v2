import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/pocket_detail_fixtures.dart';

/// "My contributions" history list for the tablet hub: each paid hand shows a
/// green check tile, its label and timestamp, and the amount.
class PocketContributionsCardTablet extends StatelessWidget {
  const PocketContributionsCardTablet({super.key});

  static const double _checkBox = 48;

  @override
  Widget build(BuildContext context) {
    return KpCard(
      padding: const EdgeInsets.all(KpSpacing.l),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n.pocketDetailMyContributions,
                style: context.textTheme.titleMedium,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  context.l10n.pocketDetailViewHistory,
                  style: context.textTheme.labelMedium?.copyWith(
                    color: context.colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
          const Gap.s(),
          for (final c in kPocketContributions) ...[
            Container(
              padding: const EdgeInsets.all(KpSpacing.m),
              decoration: BoxDecoration(
                color: context.colorScheme.surface,
                borderRadius: KpRadii.allL,
                border: Border.all(
                  color: context.colorScheme.outlineVariant,
                  width: 2,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: _checkBox,
                    height: _checkBox,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: context.colors.successContainer,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.check_circle_rounded,
                      color: context.colors.success,
                    ),
                  ),
                  const Gap.m(horizontal: true),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(c.handLabel, style: context.textTheme.labelLarge),
                        Text(
                          c.timestamp,
                          style: context.textTheme.labelSmall?.copyWith(
                            color: context.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    c.amount.formatShort(),
                    style: context.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const Gap.s(),
          ],
        ],
      ),
    );
  }
}
