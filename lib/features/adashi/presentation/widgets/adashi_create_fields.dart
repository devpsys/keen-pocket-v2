import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/adashi/presentation/view_models/adashi_view.dart';

/// Shared input decoration for the create-adashi form (filled, 12px, 2px
/// outline that turns brand on focus — design `create_adashi`).
InputDecoration adashiInput(BuildContext context, {String? hint}) {
  return InputDecoration(
    isDense: true,
    hintText: hint,
    filled: true,
    fillColor: context.colorScheme.surfaceContainerLow,
    contentPadding: const EdgeInsets.all(KpSpacing.s),
    enabledBorder: OutlineInputBorder(
      borderRadius: KpRadii.allM,
      borderSide: BorderSide(
        color: context.colorScheme.outlineVariant,
        width: 2,
      ),
    ),
    border: OutlineInputBorder(
      borderRadius: KpRadii.allM,
      borderSide: BorderSide(
        color: context.colorScheme.outlineVariant,
        width: 2,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: KpRadii.allM,
      borderSide: BorderSide(color: context.colorScheme.primary, width: 2),
    ),
  );
}

/// A labelled field inside a chunky card (each phone field is its own card).
class AdashiFieldCard extends StatelessWidget {
  const AdashiFieldCard({required this.label, required this.child, super.key});

  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return KpCard(
      padding: const EdgeInsets.all(KpSpacing.m),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: KpSpacing.xs),
            child: Text(
              label,
              style: context.textTheme.labelLarge?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}

/// Plain label above an input (used inside grouped cards, e.g. the bank card).
class AdashiFieldLabel extends StatelessWidget {
  const AdashiFieldLabel(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: KpSpacing.xs),
      child: Text(
        text,
        style: context.textTheme.labelLarge?.copyWith(
          color: context.colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}

/// Gold "Costs 1 Keen" pill with a coin glyph and a candy bottom edge.
class AdashiCostPill extends StatelessWidget {
  const AdashiCostPill({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.m,
        vertical: KpSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: context.colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(KpRadii.pill),
        border: const Border(
          bottom: BorderSide(color: KpColors.gold600, width: 2),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.monetization_on_rounded,
            size: KpSpacing.m,
            color: context.colorScheme.onSecondaryContainer,
          ),
          const Gap.xs(horizontal: true),
          Text(
            context.l10n.adashiCreateCost,
            style: context.textTheme.labelLarge?.copyWith(
              color: context.colorScheme.onSecondaryContainer,
            ),
          ),
        ],
      ),
    );
  }
}

/// Coral "Costs 1 Keen note" pill with a note glyph (tablet design).
class AdashiCostNotePill extends StatelessWidget {
  const AdashiCostNotePill({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.m,
        vertical: KpSpacing.s,
      ),
      decoration: BoxDecoration(
        color: context.colorScheme.tertiaryContainer,
        borderRadius: BorderRadius.circular(KpRadii.pill),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.payments_rounded,
            size: KpSpacing.m,
            color: context.colorScheme.onTertiaryContainer,
          ),
          const Gap.xs(horizontal: true),
          Text(
            context.l10n.adashiCreateCostNote,
            style: context.textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.w400,
              color: context.colorScheme.onTertiaryContainer,
            ),
          ),
        ],
      ),
    );
  }
}

/// "Manual ⟷ Auto" switch used on the tablet form (design `create_adashi_tablet`).
class AdashiRotationSwitch extends StatelessWidget {
  const AdashiRotationSwitch({
    required this.mode,
    required this.onChanged,
    super.key,
  });

  final RotationMode mode;
  final ValueChanged<RotationMode> onChanged;

  @override
  Widget build(BuildContext context) {
    final isAuto = mode == RotationMode.auto;
    return Row(
      children: [
        Text(
          context.l10n.adashiCreateManual,
          style: context.textTheme.bodyMedium?.copyWith(
            fontWeight: isAuto ? FontWeight.w400 : FontWeight.w800,
            color: isAuto
                ? context.colorScheme.onSurfaceVariant
                : context.colorScheme.onSurface,
          ),
        ),
        Switch(
          value: isAuto,
          onChanged: (v) =>
              onChanged(v ? RotationMode.auto : RotationMode.manual),
        ),
        Text(
          context.l10n.adashiCreateAuto,
          style: context.textTheme.bodyMedium?.copyWith(
            fontWeight: isAuto ? FontWeight.w800 : FontWeight.w400,
            color: isAuto
                ? context.colorScheme.primary
                : context.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}

/// Phone intro card: mascot + "Let's set up your circle!" (design `create_adashi`).
class AdashiCreateIntroCard extends StatelessWidget {
  const AdashiCreateIntroCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLowest,
        borderRadius: KpRadii.allXl,
        border: Border.all(
          color: context.colorScheme.primaryContainer,
          width: 2,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(KpSpacing.xs),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: context.colorScheme.primaryContainer,
            ),
            child: const KpMascot.think(size: 48),
          ),
          const Gap.m(horizontal: true),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.adashiCreateIntroTitle,
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: context.colorScheme.primary,
                  ),
                ),
                const Gap.xxs(),
                Text(
                  context.l10n.adashiCreateIntroBody,
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

/// AUTO / MANUAL segmented control for the rotation mode.
class AdashiRotationToggle extends StatelessWidget {
  const AdashiRotationToggle({
    required this.mode,
    required this.onChanged,
    super.key,
  });

  final RotationMode mode;
  final ValueChanged<RotationMode> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.xxs),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLow,
        borderRadius: KpRadii.allM,
      ),
      child: Row(
        children: [
          _Segment(
            label: context.l10n.adashiCreateAuto.toUpperCase(),
            selected: mode == RotationMode.auto,
            onTap: () => onChanged(RotationMode.auto),
          ),
          _Segment(
            label: context.l10n.adashiCreateManual.toUpperCase(),
            selected: mode == RotationMode.manual,
            onTap: () => onChanged(RotationMode.manual),
          ),
        ],
      ),
    );
  }
}

class _Segment extends StatelessWidget {
  const _Segment({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: KpSpacing.s),
          decoration: BoxDecoration(
            color: selected ? context.colorScheme.primary : null,
            borderRadius: KpRadii.allS,
            border: selected
                ? const Border(
                    bottom: BorderSide(color: KpColors.brand600, width: 3),
                  )
                : null,
          ),
          child: Text(
            label,
            style: context.textTheme.labelLarge?.copyWith(
              color: selected
                  ? context.colorScheme.onPrimary
                  : context.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ),
    );
  }
}

/// "Make public" toggle row.
class AdashiPublicToggle extends StatelessWidget {
  const AdashiPublicToggle({
    required this.value,
    required this.onChanged,
    super.key,
  });

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return KpCard(
      padding: const EdgeInsets.all(KpSpacing.m),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.adashiCreateMakePublic,
                  style: context.textTheme.labelLarge?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
                Text(
                  context.l10n.adashiCreateMakePublicHint,
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
