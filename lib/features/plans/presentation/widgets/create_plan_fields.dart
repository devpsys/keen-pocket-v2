import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/plans/presentation/widgets/plan_period_segment.dart';
import 'package:keenpockets/features/plans/presentation/widgets/plans_create_fixtures.dart';

/// The shared create-plan form body (title, period type, month/year, budget,
/// smart-tip callout and the carry-over card). Composed by both the phone and
/// tablet create-plan layouts.
class CreatePlanFields extends StatelessWidget {
  const CreatePlanFields({
    required this.title,
    required this.budget,
    required this.months,
    required this.isMonth,
    required this.onPeriodChanged,
    required this.month,
    required this.onMonth,
    required this.year,
    required this.years,
    required this.onYear,
    required this.carryOver,
    required this.onCarryOver,
    super.key,
  });

  final TextEditingController title;
  final TextEditingController budget;
  final List<String> months;
  final bool isMonth;
  final ValueChanged<bool> onPeriodChanged;
  final int month;
  final ValueChanged<int> onMonth;
  final int year;
  final List<int> years;
  final ValueChanged<int> onYear;
  final bool carryOver;
  final ValueChanged<bool> onCarryOver;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _FieldLabel(context.l10n.planTitleLabel),
        KpTextField(label: context.l10n.planTitleHint, controller: title),
        const Gap.m(),
        _FieldLabel(context.l10n.planPeriodType),
        PlanPeriodSegment(isMonth: isMonth, onChanged: onPeriodChanged),
        const Gap.m(),
        _FieldLabel(context.l10n.planSelectMonthYear),
        Row(
          children: [
            Expanded(
              child: _Dropdown<int>(
                value: month,
                items: [
                  for (var m = 1; m <= months.length; m++)
                    DropdownMenuItem(value: m, child: Text(months[m - 1])),
                ],
                onChanged: (v) => onMonth(v ?? month),
              ),
            ),
            const Gap.m(horizontal: true),
            Expanded(
              child: _Dropdown<int>(
                value: year,
                items: [
                  for (final y in years)
                    DropdownMenuItem(value: y, child: Text('$y')),
                ],
                onChanged: (v) => onYear(v ?? year),
              ),
            ),
          ],
        ),
        const Gap.m(),
        _FieldLabel(context.l10n.planTargetBudget),
        KpTextField(
          label: context.l10n.planBudgetHint,
          controller: budget,
          keyboardType: TextInputType.number,
        ),
        const Gap.l(),
        const _SmartTip(),
        const Gap.l(),
        _CarryOverCard(value: carryOver, onChanged: onCarryOver),
      ],
    );
  }
}

/// A field label rendered above an input.
class _FieldLabel extends StatelessWidget {
  const _FieldLabel(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: KpSpacing.xs),
      child: Text(text, style: context.textTheme.labelLarge),
    );
  }
}

class _Dropdown<T> extends StatelessWidget {
  const _Dropdown({
    required this.value,
    required this.items,
    required this.onChanged,
  });

  final T value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?> onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      initialValue: value,
      items: items,
      onChanged: onChanged,
    );
  }
}

/// Amber "Smart Tip" callout about star-priority carry-over items.
class _SmartTip extends StatelessWidget {
  const _SmartTip();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: BoxDecoration(
        color: context.colors.warningContainer,
        borderRadius: KpRadii.allXl,
        border: Border.all(color: context.colorScheme.secondaryContainer),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.stars_rounded, color: context.colors.warning),
          const Gap.s(horizontal: true),
          Expanded(
            child: Text(
              context.l10n.planSmartTip,
              style: context.textTheme.labelMedium?.copyWith(
                color: context.colorScheme.onSecondaryContainer,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Card with the carry-over toggle and a chip strip of last plan's items.
class _CarryOverCard extends StatelessWidget {
  const _CarryOverCard({required this.value, required this.onChanged});

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLowest,
        borderRadius: KpRadii.allXl,
        border: Border.all(color: context.colorScheme.outlineVariant, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.l10n.planCarryOver,
                      style: context.textTheme.titleMedium,
                    ),
                    Text(
                      context.l10n.planCarryOverSubtitle,
                      style: context.textTheme.labelSmall?.copyWith(
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              Switch.adaptive(
                value: value,
                onChanged: onChanged,
                activeTrackColor: context.colorScheme.primary,
              ),
            ],
          ),
          const Gap.m(),
          Wrap(
            spacing: KpSpacing.xs,
            runSpacing: KpSpacing.xs,
            children: [
              for (final item in kPlanCarryOverItems) _CarryChip(label: item),
            ],
          ),
        ],
      ),
    );
  }
}

class _CarryChip extends StatelessWidget {
  const _CarryChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.s,
        vertical: KpSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(KpRadii.pill),
        border: Border.all(color: context.colorScheme.outlineVariant),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.stars_rounded,
            size: KpSpacing.m,
            color: context.colors.warning,
          ),
          const Gap.xxs(horizontal: true),
          Text(label, style: context.textTheme.labelSmall),
        ],
      ),
    );
  }
}
