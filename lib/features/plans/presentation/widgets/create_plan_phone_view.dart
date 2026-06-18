import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/plans/presentation/widgets/create_plan_fields.dart';

/// Phone layout for the create-plan screen (design `create_grocery_plan`):
/// a centered title, a Mr K dashed callout, then the shared form.
class CreatePlanPhoneView extends StatelessWidget {
  const CreatePlanPhoneView({required this.fields, super.key});

  final CreatePlanFields fields;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(
        KpSpacing.l,
        KpSpacing.l,
        KpSpacing.l,
        KpSpacing.xxl,
      ),
      children: [
        Center(
          child: Column(
            children: [
              Text(
                context.l10n.planCreateTitle,
                style: context.textTheme.headlineLarge,
              ),
              const Gap.xs(),
              Text(
                context.l10n.planCreateSubtitle,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        const Gap.l(),
        const CreatePlanMascotTip(),
        const Gap.l(),
        fields,
      ],
    );
  }
}

/// Mr K dashed welcome callout shown above the form on phones.
class CreatePlanMascotTip extends StatelessWidget {
  const CreatePlanMascotTip({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: BoxDecoration(
        color: context.colorScheme.primaryContainer.withValues(alpha: 0.15),
        borderRadius: KpRadii.allXl,
        border: Border.all(color: context.colorScheme.primaryContainer),
      ),
      child: Row(
        children: [
          const KpMascot.think(size: 56),
          const Gap.s(horizontal: true),
          Expanded(
            child: Text(
              context.l10n.planCreateMascotTip,
              style: context.textTheme.labelMedium?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Sticky bottom action bar with the Create Plan candy button.
class CreatePlanBottomBar extends StatelessWidget {
  const CreatePlanBottomBar({required this.onSubmit, super.key});

  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(KpSpacing.l),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            KpButton(
              label: context.l10n.planCreateSubmit,
              caps: true,
              onPressed: onSubmit,
            ),
            const Gap.s(),
            Text(
              context.l10n.planPoweredBy.toUpperCase(),
              style: context.textTheme.labelSmall?.copyWith(
                color: context.colorScheme.outline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
