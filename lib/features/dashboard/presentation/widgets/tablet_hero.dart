import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';

class TabletHero extends StatelessWidget {
  const TabletHero({required this.name, required this.totalSaved, super.key});

  final String name;
  final Money totalSaved;

  @override
  Widget build(BuildContext context) {
    final onHero = context.colorScheme.onPrimaryContainer;
    return Container(
      padding: const EdgeInsets.all(KpSpacing.xl),
      decoration: BoxDecoration(
        color: context.colorScheme.primaryContainer,
        borderRadius: KpRadii.allXl,
        border: Border(
          bottom: BorderSide(color: context.colorScheme.primary, width: 8),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${context.l10n.dashboardGreeting(name)} 👋',
                  style: context.textTheme.displayLarge?.copyWith(
                    color: onHero,
                  ),
                ),
                const Gap.s(),
                Text(
                  context.l10n.dashboardSavedThisMonth(
                    totalSaved.formatShort(),
                  ),
                  style: context.textTheme.headlineMedium?.copyWith(
                    color: onHero,
                  ),
                ),
              ],
            ),
          ),
          const Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: KpMascot(size: 140),
            ),
          ),
        ],
      ),
    );
  }
}
