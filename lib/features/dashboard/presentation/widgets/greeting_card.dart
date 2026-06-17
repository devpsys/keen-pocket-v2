import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';

class GreetingCard extends StatelessWidget {
  const GreetingCard({required this.name, required this.totalSaved, super.key});

  final String name;
  final Money totalSaved;

  @override
  Widget build(BuildContext context) {
    return KpCard.financial(
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.dashboardGreeting(name),
                  style: context.textTheme.headlineMedium,
                ),
                Text('👋', style: context.textTheme.headlineMedium),
                const Gap.xs(),
                Text(
                  totalSaved.formatShort(),
                  style: context.textTheme.displayLarge?.copyWith(
                    color: context.colorScheme.primary,
                  ),
                ),
                Text(
                  context.l10n.dashboardTotalSaved.toUpperCase(),
                  style: context.textTheme.labelSmall?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          const KpMascot(size: 72),
        ],
      ),
    );
  }
}
