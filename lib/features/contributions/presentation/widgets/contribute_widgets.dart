import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/contributions/presentation/widgets/contribute_fixtures.dart';

/// Phone goal card: icon + "TARGET GOAL" + name + outstanding + thin progress.
class ContributeGoalCard extends StatelessWidget {
  const ContributeGoalCard({required this.target, super.key});

  final ContributeTarget target;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLowest,
        borderRadius: KpRadii.allXl,
        border: Border(
          bottom: BorderSide(
            color: context.colorScheme.surfaceContainerHighest,
            width: 7,
          ),
        ),
      ),
      child: Row(
        children: [
          _GoalIcon(),
          const Gap.m(horizontal: true),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.contributeTargetGoal.toUpperCase(),
                  style: context.textTheme.labelSmall?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                    letterSpacing: 0.5,
                  ),
                ),
                Text(target.goalName, style: context.textTheme.headlineSmall),
                const Gap.xs(),
                Row(
                  children: [
                    Text(
                      context.l10n.contributeOutstanding(
                        target.outstanding.formatShort(),
                      ),
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.colorScheme.error,
                      ),
                    ),
                    const Gap.s(horizontal: true),
                    Expanded(
                      child: KpProgressBar(value: target.progress, height: 8),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Tablet goal card: icon + name + target + saved + % + "only X more".
class ContributeGoalCardTablet extends StatelessWidget {
  const ContributeGoalCardTablet({required this.target, super.key});

  final ContributeTarget target;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLowest,
        borderRadius: KpRadii.allXl,
        border: Border(
          bottom: BorderSide(
            color: context.colorScheme.surfaceContainerHighest,
            width: 7,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _GoalIcon(),
              const Gap.m(horizontal: true),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      target.goalName,
                      style: context.textTheme.headlineSmall,
                    ),
                    Text(
                      context.l10n.contributeTargetAmount(
                        target.target.format(),
                      ),
                      style: context.textTheme.labelMedium?.copyWith(
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Gap.m(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                target.saved.format(),
                style: context.textTheme.headlineMedium?.copyWith(
                  color: context.colorScheme.primary,
                ),
              ),
              Text(
                context.l10n.contributePercentComplete(target.percent),
                style: context.textTheme.labelMedium?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          const Gap.s(),
          KpProgressBar(value: target.progress, height: 10),
          const Gap.s(),
          Text(
            context.l10n.contributeMoreToGoal(target.outstanding.format()),
            style: context.textTheme.bodySmall?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class _GoalIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: KpSpacing.xxl,
      height: KpSpacing.xxl,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: context.colorScheme.secondaryContainer,
        borderRadius: KpRadii.allL,
      ),
      child: Icon(
        Icons.savings_rounded,
        color: context.colorScheme.onSecondaryContainer,
      ),
    );
  }
}

/// Big amount input with a ₦ prefix and quick-add chips.
class ContributeAmountField extends StatelessWidget {
  const ContributeAmountField({
    required this.controller,
    required this.onQuickAdd,
    super.key,
  });

  final TextEditingController controller;
  final ValueChanged<int> onQuickAdd;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: KpSpacing.l,
            vertical: KpSpacing.l,
          ),
          decoration: BoxDecoration(
            color: context.colorScheme.surfaceContainerLow,
            borderRadius: KpRadii.allXl,
            border: Border.all(
              color: context.colorScheme.surfaceContainerHighest,
              width: 2,
            ),
          ),
          child: Row(
            children: [
              Text(
                '₦',
                style: context.textTheme.displaySmall?.copyWith(
                  color: context.colorScheme.outlineVariant,
                ),
              ),
              const Gap.s(horizontal: true),
              Expanded(
                child: TextField(
                  controller: controller,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                    const _GroupedAmountFormatter(),
                  ],
                  textAlign: TextAlign.center,
                  style: context.textTheme.displaySmall?.copyWith(
                    color: context.colorScheme.onSurface,
                    fontWeight: FontWeight.w900,
                  ),
                  decoration: InputDecoration(
                    isCollapsed: true,
                    border: InputBorder.none,
                    hintText: '0.00',
                    hintStyle: context.textTheme.displaySmall?.copyWith(
                      color: context.colorScheme.outlineVariant,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const Gap.s(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (final amount in kContributeQuickAdds) ...[
              if (amount != kContributeQuickAdds.first)
                const Gap.s(horizontal: true),
              _QuickChip(amount: amount, onTap: () => onQuickAdd(amount)),
            ],
          ],
        ),
      ],
    );
  }
}

class _QuickChip extends StatelessWidget {
  const _QuickChip({required this.amount, required this.onTap});

  final int amount;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colorScheme.surfaceContainerHigh,
      borderRadius: KpRadii.allM,
      child: InkWell(
        onTap: onTap,
        borderRadius: KpRadii.allM,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: KpSpacing.m,
            vertical: KpSpacing.s,
          ),
          child: Text(
            context.l10n.contributeQuickAdd(Money.naira(amount).formatShort()),
            style: context.textTheme.labelLarge,
          ),
        ),
      ),
    );
  }
}

/// Groups an amount string with thousands separators, keeping up to two
/// decimals (e.g. `15000` → `15,000`, `1500.5` → `1,500.5`). Commas in the
/// input are ignored so it is safe to re-run on already-grouped text.
String groupAmountText(String input) {
  final s = input.replaceAll(',', '');
  if (s.isEmpty) return '';
  final dot = s.indexOf('.');
  String intPart;
  String? dec;
  if (dot >= 0) {
    intPart = s.substring(0, dot);
    dec = s.substring(dot + 1).replaceAll(RegExp(r'[^0-9]'), '');
    if (dec.length > 2) dec = dec.substring(0, 2);
  } else {
    intPart = s;
  }
  intPart = intPart.replaceAll(RegExp(r'^0+(?=\d)'), '');
  if (intPart.isEmpty) intPart = '0';

  final buf = StringBuffer();
  for (var i = 0; i < intPart.length; i++) {
    if (i > 0 && (intPart.length - i) % 3 == 0) buf.write(',');
    buf.write(intPart[i]);
  }
  return dot >= 0 ? '$buf.$dec' : buf.toString();
}

/// Live currency formatter for the contribute amount field — inserts thousands
/// separators as the user types and keeps the caret at the end.
class _GroupedAmountFormatter extends TextInputFormatter {
  const _GroupedAmountFormatter();

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final formatted = groupAmountText(newValue.text);
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

/// Mr K encouragement tip.
class ContributeTip extends StatelessWidget {
  const ContributeTip({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: BoxDecoration(
        color: context.colorScheme.primaryContainer.withValues(alpha: 0.12),
        borderRadius: KpRadii.allL,
        border: Border(
          left: BorderSide(
            color: context.colorScheme.primaryContainer,
            width: 4,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const KpMascot.think(size: 44),
          const Gap.s(horizontal: true),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '"${context.l10n.contributeTip}"',
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontStyle: FontStyle.italic,
                    color: context.colorScheme.onSurface,
                  ),
                ),
                const Gap.xxs(),
                Text(
                  '— ${context.l10n.mascotName}',
                  style: context.textTheme.labelSmall?.copyWith(
                    color: context.colorScheme.primary,
                    letterSpacing: 0.5,
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

/// "Add a charity donation" toggle (with a subtitle on tablet).
class ContributeCharityToggle extends StatelessWidget {
  const ContributeCharityToggle({
    required this.value,
    required this.onChanged,
    required this.target,
    this.showSubtitle = false,
    super.key,
  });

  final bool value;
  final ValueChanged<bool> onChanged;
  final ContributeTarget target;
  final bool showSubtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLow,
        borderRadius: KpRadii.allL,
        border: showSubtitle
            ? Border.all(
                color: context.colorScheme.surfaceContainerHighest,
                width: 2,
              )
            : null,
      ),
      child: Row(
        children: [
          Icon(
            Icons.volunteer_activism_rounded,
            color: context.colorScheme.tertiary,
          ),
          const Gap.s(horizontal: true),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.contributeCharity,
                  style: context.textTheme.bodyLarge,
                ),
                if (showSubtitle)
                  Text(
                    context.l10n.contributeCharitySubtitle(
                      target.charityAmount.format(),
                      target.charityCause,
                    ),
                    style: context.textTheme.bodySmall?.copyWith(
                      color: context.colorScheme.onSurfaceVariant,
                    ),
                  ),
              ],
            ),
          ),
          Switch(value: value, onChanged: onChanged),
        ],
      ),
    );
  }
}
