import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';

/// Full-width "group rules" card: a gavel header above three numbered rules
/// laid out across the bottom of the tablet hub.
class PocketGroupRulesTablet extends StatelessWidget {
  const PocketGroupRulesTablet({super.key});

  static const double _iconSize = 24;

  @override
  Widget build(BuildContext context) {
    return KpCard(
      padding: const EdgeInsets.all(KpSpacing.l),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Icon(
                Icons.gavel_rounded,
                size: _iconSize,
                color: context.colorScheme.primary,
              ),
              const Gap.s(horizontal: true),
              Text(
                context.l10n.pocketDetailGroupRules,
                style: context.textTheme.headlineSmall,
              ),
            ],
          ),
          const Gap.l(),
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _RuleColumn(
                    number: 1,
                    text: context.l10n.pocketDetailTabletRule1,
                  ),
                ),
                const Gap.l(horizontal: true),
                Expanded(
                  child: _RuleColumn(
                    number: 2,
                    text: context.l10n.pocketDetailTabletRule2,
                  ),
                ),
                const Gap.l(horizontal: true),
                Expanded(
                  child: _RuleColumn(
                    number: 3,
                    text: context.l10n.pocketDetailTabletRule3,
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

/// A single numbered rule: a circular badge beside the rule text.
class _RuleColumn extends StatelessWidget {
  const _RuleColumn({required this.number, required this.text});

  static const double _badge = 40;

  final int number;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: _badge,
          height: _badge,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: context.colorScheme.surfaceContainerLow,
            shape: BoxShape.circle,
          ),
          child: Text(
            '$number',
            style: context.textTheme.titleMedium?.copyWith(
              color: context.colorScheme.primary,
            ),
          ),
        ),
        const Gap.s(horizontal: true),
        Expanded(
          child: Text(
            text,
            style: context.textTheme.bodySmall?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ],
    );
  }
}
