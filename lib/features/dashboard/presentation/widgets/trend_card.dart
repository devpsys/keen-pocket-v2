import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class TrendCard extends StatelessWidget {
  const TrendCard({super.key});

  static const double _plotHeight = 120;

  @override
  Widget build(BuildContext context) {
    return KpCard(
      child: Column(
        children: [
          SizedBox(
            height: _plotHeight,
            child: Center(
              child: Divider(color: context.colorScheme.outlineVariant),
            ),
          ),
          const Gap.xs(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (final m in const ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'])
                Text(
                  m.toUpperCase(),
                  style: context.textTheme.labelSmall?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
