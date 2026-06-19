import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

/// One of the four colored summary cards at the top of the tablet plan-detail
/// "Savings Cockpit" (design `grocery_plan_detail_tablet`): an icon, a large
/// colored value and an uppercase label.
class PlanStatCard extends StatelessWidget {
  const PlanStatCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.valueColor,
    super.key,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color valueColor;

  @override
  Widget build(BuildContext context) {
    return KpCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: valueColor),
          const Gap.s(),
          Text(
            value,
            style: context.textTheme.headlineMedium?.copyWith(
              color: valueColor,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const Gap.xxs(),
          Text(
            label.toUpperCase(),
            style: context.textTheme.labelSmall?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
