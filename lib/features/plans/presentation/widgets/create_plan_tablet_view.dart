import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/plans/presentation/widgets/create_plan_fields.dart';

/// Tablet/desktop layout for the create-plan screen
/// (design `create_grocery_plan_tablet`): a centered card with the Mr K banner,
/// the shared form, Save Draft / Create My Plan actions, then a stat strip.
class CreatePlanTabletView extends StatelessWidget {
  const CreatePlanTabletView({
    required this.fields,
    required this.onSubmit,
    this.onSaveDraft,
    super.key,
  });

  static const double _maxWidth = 820;

  final CreatePlanFields fields;
  final VoidCallback onSubmit;
  final VoidCallback? onSaveDraft;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(KpSpacing.xl),
      children: [
        Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: _maxWidth),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const _ReadyBanner(),
                const Gap.l(),
                KpCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      fields,
                      const Gap.l(),
                      Row(
                        children: [
                          Expanded(
                            child: KpButton(
                              label: context.l10n.planSaveDraft,
                              variant: KpButtonVariant.ghost,
                              onPressed: onSaveDraft ?? () {},
                            ),
                          ),
                          const Gap.m(horizontal: true),
                          Expanded(
                            child: KpButton(
                              label: context.l10n.planCreateMyPlan,
                              onPressed: onSubmit,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Gap.l(),
                const _StatStrip(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _ReadyBanner extends StatelessWidget {
  const _ReadyBanner();

  @override
  Widget build(BuildContext context) {
    return KpCard(
      child: Row(
        children: [
          const KpMascot.think(size: 72),
          const Gap.m(horizontal: true),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.planReadyToSave,
                  style: context.textTheme.headlineSmall?.copyWith(
                    color: context.colorScheme.primary,
                  ),
                ),
                const Gap.xxs(),
                Text(
                  context.l10n.planReadyToSaveBody,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
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

class _StatStrip extends StatelessWidget {
  const _StatStrip();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _StatTile(
            icon: KpIcons.calendar,
            label: context.l10n.planStatDuration,
            value: context.l10n.planStatDurationValue,
          ),
        ),
        const Gap.m(horizontal: true),
        Expanded(
          child: _StatTile(
            icon: KpIcons.shopping,
            label: context.l10n.planStatAvgItems,
            value: context.l10n.planStatAvgItemsValue,
          ),
        ),
        const Gap.m(horizontal: true),
        Expanded(
          child: _StatTile(
            icon: KpIcons.trend,
            label: context.l10n.planStatEstSavings,
            value: context.l10n.planStatEstSavingsValue,
          ),
        ),
      ],
    );
  }
}

class _StatTile extends StatelessWidget {
  const _StatTile({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return KpCard(
      child: Column(
        children: [
          Icon(icon, color: context.colorScheme.primary),
          const Gap.xs(),
          Text(
            label.toUpperCase(),
            style: context.textTheme.labelSmall?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
          Text(value, style: context.textTheme.titleMedium),
        ],
      ),
    );
  }
}
