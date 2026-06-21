import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/charity/presentation/widgets/charity_donate_card.dart';

/// Goal kinds for a new drive.
enum CharityGoalType { amount, items }

/// An editable item row in the setup form's Items mode.
class CharitySetupItem {
  CharitySetupItem()
    : name = TextEditingController(),
      unit = TextEditingController(),
      qty = TextEditingController();

  final TextEditingController name;
  final TextEditingController unit;
  final TextEditingController qty;

  void dispose() {
    name.dispose();
    unit.dispose();
    qty.dispose();
  }
}

/// Mr K greeting card atop the setup form (design `charity_setup`).
class CharitySetupGreeting extends StatelessWidget {
  const CharitySetupGreeting({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLowest,
        borderRadius: KpRadii.allXl,
        border: Border.all(
          color: context.colorScheme.surfaceContainerHighest,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.surfaceContainer,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: Row(
        children: [
          const KpMascot.celebrate(size: 72),
          const Gap.m(horizontal: true),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.charitySetupGreetingTitle,
                  style: context.textTheme.titleLarge,
                ),
                const Gap.xxs(),
                Text(
                  context.l10n.charitySetupGreetingBody,
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w400,
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

/// A field label (design uses bold, muted, slightly inset labels).
class CharityFieldLabel extends StatelessWidget {
  const CharityFieldLabel(this.label, {super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: KpSpacing.xxs, bottom: KpSpacing.xs),
      child: Text(
        label,
        style: context.textTheme.labelLarge?.copyWith(
          color: context.colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}

/// Amount / Items segmented control (design `charity_setup`).
class CharityGoalTypeToggle extends StatelessWidget {
  const CharityGoalTypeToggle({
    required this.selected,
    required this.onChanged,
    super.key,
  });

  final CharityGoalType selected;
  final ValueChanged<CharityGoalType> onChanged;

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
          _segment(
            context,
            CharityGoalType.amount,
            context.l10n.charityGoalTypeAmount,
          ),
          const Gap.xxs(horizontal: true),
          _segment(
            context,
            CharityGoalType.items,
            context.l10n.charityGoalTypeItems,
          ),
        ],
      ),
    );
  }

  Widget _segment(BuildContext context, CharityGoalType type, String label) {
    final active = type == selected;
    return Expanded(
      child: GestureDetector(
        onTap: () => onChanged(type),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: KpSpacing.s),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: active ? context.colorScheme.primary : KpColors.transparent,
            borderRadius: KpRadii.allS,
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

/// One editable item row (Item Name / Unit / Qty + delete).
class CharityItemRow extends StatelessWidget {
  const CharityItemRow({required this.item, required this.onRemove, super.key});

  final CharitySetupItem item;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLow,
        borderRadius: KpRadii.allM,
        border: Border.all(
          color: context.colorScheme.surfaceContainerHighest,
          width: 2,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            flex: 2,
            child: _labelled(
              context,
              context.l10n.charityItemNameLabel,
              CharityOutlinedField(controller: item.name, hint: 'Rice'),
            ),
          ),
          const Gap.s(horizontal: true),
          Expanded(
            child: _labelled(
              context,
              context.l10n.charityUnitLabel,
              CharityOutlinedField(controller: item.unit, hint: 'Bags'),
            ),
          ),
          const Gap.s(horizontal: true),
          Expanded(
            child: _labelled(
              context,
              context.l10n.charityQty,
              CharityOutlinedField(
                controller: item.qty,
                hint: '10',
                keyboardType: TextInputType.number,
              ),
            ),
          ),
          const Gap.s(horizontal: true),
          IconButton(
            onPressed: onRemove,
            style: IconButton.styleFrom(
              backgroundColor: context.colorScheme.errorContainer,
              foregroundColor: context.colorScheme.onErrorContainer,
            ),
            icon: const Icon(Icons.delete_rounded),
          ),
        ],
      ),
    );
  }

  Widget _labelled(BuildContext context, String label, Widget field) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: context.textTheme.labelSmall?.copyWith(
            color: context.colorScheme.outline,
            letterSpacing: 0.5,
          ),
        ),
        const Gap.xxs(),
        field,
      ],
    );
  }
}

/// "Show donor breakdown" toggle row (design `charity_setup`).
class CharityBreakdownToggle extends StatelessWidget {
  const CharityBreakdownToggle({
    required this.value,
    required this.onChanged,
    super.key,
  });

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLow,
        borderRadius: KpRadii.allM,
        border: Border.all(
          color: context.colorScheme.surfaceContainerHighest,
          width: 2,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(KpSpacing.s),
            decoration: const BoxDecoration(
              color: KpColors.gold500,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.analytics_rounded, color: KpColors.gold600),
          ),
          const Gap.s(horizontal: true),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.charityShowBreakdown,
                  style: context.textTheme.labelLarge,
                ),
                Text(
                  context.l10n.charityShowBreakdownSub,
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

/// "Create Your Drive" form header (design `charity_setup_tablet`).
class CharityCreateDriveHeader extends StatelessWidget {
  const CharityCreateDriveHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(KpSpacing.s),
          decoration: BoxDecoration(
            color: KpColors.gold500.withValues(alpha: 0.2),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.volunteer_activism_rounded,
            color: KpColors.gold600,
          ),
        ),
        const Gap.s(horizontal: true),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.l10n.charityCreateDriveTitle,
                style: context.textTheme.titleLarge,
              ),
              Text(
                context.l10n.charityCreateDriveSubtitle,
                style: context.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Goal-type chooser as two bordered icon buttons (design `charity_setup_tablet`).
class CharityGoalTypeButtons extends StatelessWidget {
  const CharityGoalTypeButtons({
    required this.selected,
    required this.onChanged,
    super.key,
  });

  final CharityGoalType selected;
  final ValueChanged<CharityGoalType> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _button(
            context,
            type: CharityGoalType.amount,
            icon: Icons.payments_outlined,
            label: context.l10n.charityGoalTypeAmountFull,
          ),
        ),
        const Gap.m(horizontal: true),
        Expanded(
          child: _button(
            context,
            type: CharityGoalType.items,
            icon: Icons.inventory_2_outlined,
            label: context.l10n.charityGoalTypeItemsFull,
          ),
        ),
      ],
    );
  }

  Widget _button(
    BuildContext context, {
    required CharityGoalType type,
    required IconData icon,
    required String label,
  }) {
    final active = type == selected;
    return GestureDetector(
      onTap: () => onChanged(type),
      child: Container(
        padding: const EdgeInsets.all(KpSpacing.m),
        decoration: BoxDecoration(
          color: active
              ? context.colorScheme.primaryContainer.withValues(alpha: 0.1)
              : context.colorScheme.surfaceContainerLowest,
          borderRadius: KpRadii.allM,
          border: Border.all(
            color: active
                ? context.colorScheme.primary
                : context.colorScheme.outlineVariant,
            width: 2,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: KpSpacing.l,
              color: active
                  ? context.colorScheme.primary
                  : context.colorScheme.onSurfaceVariant,
            ),
            const Gap.xs(horizontal: true),
            Flexible(
              child: Text(
                label,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.labelLarge?.copyWith(
                  color: active
                      ? context.colorScheme.primary
                      : context.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Mr K tip card (tablet): brand-tinted with the mascot (design `_tablet`).
class CharitySetupTabletTip extends StatelessWidget {
  const CharitySetupTabletTip({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: BoxDecoration(
        color: KpColors.brand100,
        borderRadius: KpRadii.allXl,
        border: Border.all(
          color: context.colorScheme.primaryContainer.withValues(alpha: 0.3),
          width: 2,
        ),
      ),
      child: Row(
        children: [
          const KpMascot.celebrate(size: 64),
          const Gap.m(horizontal: true),
          Expanded(
            child: Text(
              context.l10n.charitySetupTabletTip,
              style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w400,
                color: context.colorScheme.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Tablet live preview of the drive being created (design `charity_setup_tablet`).
class CharityDrivePreview extends StatelessWidget {
  const CharityDrivePreview({
    required this.title,
    required this.description,
    required this.target,
    this.onSupport,
    super.key,
  });

  final String title;
  final String description;
  final String target;
  final VoidCallback? onSupport;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.l10n.charityLivePreview.toUpperCase(),
              style: context.textTheme.labelMedium?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
                letterSpacing: 1,
              ),
            ),
            Row(
              children: [
                _dot(context, active: true),
                const Gap.xxs(horizontal: true),
                _dot(context, active: false),
                const Gap.xxs(horizontal: true),
                _dot(context, active: false),
              ],
            ),
          ],
        ),
        const Gap.s(),
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: context.colorScheme.surfaceContainerLowest,
            borderRadius: KpRadii.allXl,
            border: Border.all(
              color: context.colorScheme.primaryContainer,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: context.colorScheme.surfaceContainerHighest,
                offset: const Offset(0, 7),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 140,
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(KpSpacing.m),
                color: KpColors.brand100,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: KpSpacing.s,
                    vertical: KpSpacing.xxs,
                  ),
                  decoration: const BoxDecoration(
                    color: KpColors.tertiary300,
                    borderRadius: BorderRadius.all(
                      Radius.circular(KpRadii.pill),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.local_fire_department_rounded,
                        size: KpSpacing.m,
                        color: KpColors.tertiary600,
                      ),
                      const Gap.xxs(horizontal: true),
                      Text(
                        context.l10n.charityTrending,
                        style: context.textTheme.labelSmall?.copyWith(
                          color: KpColors.tertiary600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(KpSpacing.l),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(title, style: context.textTheme.titleLarge),
                    const Gap.xs(),
                    Text(
                      description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: context.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const Gap.m(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          context.l10n.charityRaised('₦120,500'),
                          style: context.textTheme.titleMedium?.copyWith(
                            color: context.colorScheme.primary,
                          ),
                        ),
                        Text('24%', style: context.textTheme.labelLarge),
                      ],
                    ),
                    const Gap.s(),
                    const KpProgressBar(value: 0.24, height: 16),
                    const Gap.s(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          context.l10n.charityTargetLabel(target),
                          style: context.textTheme.labelMedium?.copyWith(
                            color: context.colorScheme.onSurfaceVariant,
                          ),
                        ),
                        Text(
                          context.l10n.charityDonors(42),
                          style: context.textTheme.labelMedium?.copyWith(
                            color: context.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                    const Gap.m(),
                    Align(
                      alignment: Alignment.centerRight,
                      child: KpButton(
                        label: context.l10n.charitySupportDrive,
                        dense: true,
                        onPressed: onSupport ?? () {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _dot(BuildContext context, {required bool active}) {
    return Container(
      width: KpSpacing.xs,
      height: KpSpacing.xs,
      decoration: BoxDecoration(
        color: active
            ? context.colorScheme.primary
            : context.colorScheme.outlineVariant,
        shape: BoxShape.circle,
      ),
    );
  }
}

/// Gold "Pro Tip" card (design `charity_setup`).
class CharityProTip extends StatelessWidget {
  const CharityProTip({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: const BoxDecoration(
        color: KpColors.gold100,
        borderRadius: KpRadii.allXl,
        border: Border(bottom: BorderSide(color: KpColors.gold600, width: 4)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.lightbulb_outline_rounded,
            color: context.colorScheme.onSurface,
          ),
          const Gap.s(horizontal: true),
          Expanded(
            child: Text.rich(
              TextSpan(
                style: context.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: context.colorScheme.onSurface,
                ),
                children: [
                  TextSpan(
                    text: '${context.l10n.charityProTipLabel} ',
                    style: const TextStyle(fontWeight: FontWeight.w800),
                  ),
                  TextSpan(text: context.l10n.charityProTipBody),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
