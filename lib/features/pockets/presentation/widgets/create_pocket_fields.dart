import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';

/// A field label rendered above an input.
class FieldLabel extends StatelessWidget {
  const FieldLabel(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: KpSpacing.xs),
      child: Text(text, style: context.textTheme.labelLarge),
    );
  }
}

/// Icon + title heading for a section of the tablet create-pocket form.
class CreatePocketSectionHeader extends StatelessWidget {
  const CreatePocketSectionHeader({
    required this.icon,
    required this.title,
    super.key,
  });

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: context.colorScheme.primary, size: KpSpacing.l),
        const Gap.xs(horizontal: true),
        Text(
          title,
          style: context.textTheme.headlineMedium?.copyWith(
            color: context.colorScheme.primary,
          ),
        ),
      ],
    );
  }
}

/// Small "1 token to create" pill shown above the phone submit button.
class CreatePocketCostPill extends StatelessWidget {
  const CreatePocketCostPill({super.key});

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
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.monetization_on_rounded,
            size: KpSpacing.m,
            color: context.colors.warning,
          ),
          const Gap.xxs(horizontal: true),
          Text(
            context.l10n.createPocketCost.toUpperCase(),
            style: context.textTheme.labelSmall?.copyWith(
              color: context.colorScheme.onSecondaryContainer,
            ),
          ),
        ],
      ),
    );
  }
}

/// Slider + month-count pill for choosing a pocket duration (tablet).
class DurationSlider extends StatelessWidget {
  const DurationSlider({
    required this.months,
    required this.onChanged,
    super.key,
  });

  final int months;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Slider(
            min: 1,
            max: 24,
            divisions: 23,
            value: months.toDouble(),
            onChanged: (v) => onChanged(v.round()),
          ),
        ),
        const Gap.s(horizontal: true),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: KpSpacing.s,
            vertical: KpSpacing.xxs,
          ),
          decoration: BoxDecoration(
            color: context.colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(KpRadii.pill),
          ),
          child: Text(
            context.l10n.createPocketMonthsAbbrev(months),
            style: context.textTheme.labelLarge?.copyWith(
              color: context.colorScheme.onPrimaryContainer,
            ),
          ),
        ),
      ],
    );
  }
}

/// Highlighted "Your Hands" card with an inline stepper (tablet design).
class YourHandsCard extends StatelessWidget {
  const YourHandsCard({
    required this.value,
    required this.onChanged,
    super.key,
  });

  final int value;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final onPrimary = context.colorScheme.onPrimary;
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: BoxDecoration(
        color: context.colorScheme.primary,
        borderRadius: KpRadii.allXl,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.createPocketYourHands,
                  style: context.textTheme.headlineMedium?.copyWith(
                    color: onPrimary,
                  ),
                ),
                Text(
                  context.l10n.createPocketYourHandsSubtitle,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: onPrimary.withValues(alpha: 0.8),
                  ),
                ),
              ],
            ),
          ),
          // Stepper sits in a translucent white tray (design `create_pocket_tablet`).
          Container(
            padding: const EdgeInsets.all(KpSpacing.xs),
            decoration: BoxDecoration(
              color: onPrimary.withValues(alpha: 0.2),
              borderRadius: KpRadii.allL,
            ),
            child: Row(
              children: [
                _StepButton(
                  icon: KpIcons.remove,
                  onTap: value > 1 ? () => onChanged(value - 1) : null,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: KpSpacing.s),
                  child: Text(
                    '$value',
                    style: context.textTheme.headlineMedium?.copyWith(
                      color: onPrimary,
                    ),
                  ),
                ),
                _StepButton(
                  icon: KpIcons.add,
                  onTap: () => onChanged(value + 1),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StepButton extends StatelessWidget {
  const _StepButton({required this.icon, this.onTap});

  static const double _size = 40;

  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colorScheme.onPrimary,
      borderRadius: KpRadii.allM,
      child: InkWell(
        borderRadius: KpRadii.allM,
        onTap: onTap,
        child: SizedBox(
          width: _size,
          height: _size,
          child: Icon(icon, color: context.colorScheme.primary),
        ),
      ),
    );
  }
}

/// Outlined +/- stepper for choosing hands on phone.
class HandsStepper extends StatelessWidget {
  const HandsStepper({required this.value, required this.onChanged, super.key});

  final int value;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton.outlined(
          onPressed: value > 1 ? () => onChanged(value - 1) : null,
          icon: const Icon(Icons.remove_rounded),
        ),
        Expanded(
          child: Text(
            '$value',
            textAlign: TextAlign.center,
            style: context.textTheme.titleLarge,
          ),
        ),
        IconButton.outlined(
          onPressed: () => onChanged(value + 1),
          icon: const Icon(Icons.add_rounded),
        ),
      ],
    );
  }
}

/// Dashed-style governance notice shown above the tablet submit button.
class TermsNotice extends StatelessWidget {
  const TermsNotice({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainer,
        borderRadius: KpRadii.allL,
        border: Border.all(color: context.colorScheme.outlineVariant, width: 2),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(KpIcons.info, color: context.colorScheme.outline),
          const Gap.s(horizontal: true),
          Expanded(
            child: Text(
              context.l10n.createPocketTermsBody,
              style: context.textTheme.bodySmall?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Warning-tinted terms card with an agreement checkbox (phone).
class TermsCard extends StatelessWidget {
  const TermsCard({required this.agreed, required this.onChanged, super.key});

  final bool agreed;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: BoxDecoration(
        color: context.colors.warningContainer,
        borderRadius: KpRadii.allXl,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.createPocketTermsTitle,
            style: context.textTheme.titleMedium,
          ),
          const Gap.xs(),
          Text(
            context.l10n.createPocketTermsBody,
            style: context.textTheme.bodySmall,
          ),
          const Gap.s(),
          Row(
            children: [
              Checkbox(value: agreed, onChanged: (v) => onChanged(v ?? false)),
              Expanded(
                child: Text(
                  context.l10n.createPocketTermsAgree,
                  style: context.textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
