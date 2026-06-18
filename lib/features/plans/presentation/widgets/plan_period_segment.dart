import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';

/// Segmented Month / Year control for the create-plan form.
class PlanPeriodSegment extends StatelessWidget {
  const PlanPeriodSegment({
    required this.isMonth,
    required this.onChanged,
    super.key,
  });

  final bool isMonth;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.xxs),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainer,
        borderRadius: KpRadii.allM,
      ),
      child: Row(
        children: [
          _Segment(
            label: context.l10n.planPeriodMonth,
            active: isMonth,
            onTap: () => onChanged(true),
          ),
          _Segment(
            label: context.l10n.planPeriodYear,
            active: !isMonth,
            onTap: () => onChanged(false),
          ),
        ],
      ),
    );
  }
}

class _Segment extends StatelessWidget {
  const _Segment({
    required this.label,
    required this.active,
    required this.onTap,
  });

  final String label;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(vertical: KpSpacing.s),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: active ? context.colorScheme.primary : KpColors.transparent,
            borderRadius: KpRadii.allM,
          ),
          child: Text(
            label,
            style: context.textTheme.labelLarge?.copyWith(
              color: active
                  ? context.colorScheme.onPrimary
                  : context.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ),
    );
  }
}
