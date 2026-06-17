import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/plans/presentation/view_models/plan_view.dart';

/// Budget-progress accent: red when nearly spent, gold when barely started,
/// brand otherwise — mirrors the design's per-card colour shift.
Color planBudgetTone(BuildContext context, double progress) {
  if (progress >= 0.85) return context.colorScheme.error;
  if (progress <= 0.2) return context.colors.warning;
  return context.colorScheme.primary;
}

/// Localised cadence label for a plan.
String planCadenceLabel(BuildContext context, PlanCadence cadence) =>
    switch (cadence) {
      PlanCadence.weekly => context.l10n.plansCadenceWeekly,
      PlanCadence.monthly => context.l10n.plansCadenceMonthly,
    };

/// A plan card for the phone plans list (design `grocery_plans_list`).
class PlanCard extends StatelessWidget {
  const PlanCard({required this.plan, this.onTap, super.key});

  final PlanView plan;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final pct = (plan.budgetProgress * 100).round();
    final tone = planBudgetTone(context, plan.budgetProgress);
    return KpCard.interactive(
      onTap: onTap ?? () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      plan.name,
                      style: context.textTheme.headlineMedium?.copyWith(
                        color: context.colorScheme.primary,
                      ),
                    ),
                    const Gap.xxs(),
                    Text(
                      plan.periodLabel,
                      style: context.textTheme.labelLarge?.copyWith(
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              const Gap.s(horizontal: true),
              PlanCadencePill(cadence: plan.cadence),
            ],
          ),
          const Gap.s(),
          Wrap(
            spacing: KpSpacing.xs,
            runSpacing: KpSpacing.xs,
            children: [
              PlanStatusChip(
                label: context.l10n.plansBoughtCount(plan.bought),
                tone: PlanStatusTone.bought,
              ),
              PlanStatusChip(
                label: context.l10n.plansPendingCount(plan.pending),
                tone: PlanStatusTone.pending,
              ),
              PlanStatusChip(
                label: context.l10n.plansDeferredCount(plan.deferred),
                tone: PlanStatusTone.deferred,
              ),
            ],
          ),
          const Gap.m(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n.plansBudgetProgress,
                style: context.textTheme.labelSmall?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
              Text(
                '$pct%',
                style: context.textTheme.labelLarge?.copyWith(color: tone),
              ),
            ],
          ),
          const Gap.xs(),
          KpProgressBar(value: plan.budgetProgress, color: tone),
        ],
      ),
    );
  }
}

/// Gold pill showing how often a plan repeats.
class PlanCadencePill extends StatelessWidget {
  const PlanCadencePill({required this.cadence, super.key});

  final PlanCadence cadence;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.s,
        vertical: KpSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: context.colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(KpRadii.pill),
      ),
      child: Text(
        planCadenceLabel(context, cadence),
        style: context.textTheme.labelLarge?.copyWith(
          color: context.colorScheme.onSecondaryContainer,
        ),
      ),
    );
  }
}

/// Colour tone for a [PlanStatusChip].
enum PlanStatusTone { bought, pending, deferred }

/// A small "Bought 8" / "Pending 5" / "Deferred 2" chip.
class PlanStatusChip extends StatelessWidget {
  const PlanStatusChip({required this.label, required this.tone, super.key});

  final String label;
  final PlanStatusTone tone;

  @override
  Widget build(BuildContext context) {
    final (Color bg, Color fg, Color accent) = switch (tone) {
      PlanStatusTone.bought => (
        context.colorScheme.primaryContainer,
        context.colorScheme.onPrimaryContainer,
        context.colorScheme.primary,
      ),
      PlanStatusTone.pending => (
        context.colorScheme.surfaceContainerHighest,
        context.colorScheme.onSurfaceVariant,
        context.colorScheme.outlineVariant,
      ),
      PlanStatusTone.deferred => (
        context.colorScheme.errorContainer,
        context.colorScheme.onErrorContainer,
        context.colorScheme.error,
      ),
    };
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.s,
        vertical: KpSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(KpRadii.pill),
        border: Border(bottom: BorderSide(color: accent, width: 2)),
      ),
      child: Text(
        label,
        style: context.textTheme.labelSmall?.copyWith(color: fg),
      ),
    );
  }
}
