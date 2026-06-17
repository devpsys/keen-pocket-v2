import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/create_pocket_fields.dart';

/// Sectioned tablet create-pocket form (design `create_pocket_tablet`): grouped
/// sections, side-by-side fields, a duration slider and a "Your Hands" card.
class CreatePocketTabletForm extends StatelessWidget {
  const CreatePocketTabletForm({
    required this.title,
    required this.description,
    required this.perHand,
    required this.capacity,
    required this.year,
    required this.months,
    required this.startMonth,
    required this.onStartMonth,
    required this.durationMonths,
    required this.onDurationMonths,
    required this.hands,
    required this.onHands,
    required this.onSubmit,
    super.key,
  });

  final TextEditingController title;
  final TextEditingController description;
  final TextEditingController perHand;
  final TextEditingController capacity;
  final TextEditingController year;
  final List<String> months;
  final int startMonth;
  final ValueChanged<int> onStartMonth;
  final int durationMonths;
  final ValueChanged<int> onDurationMonths;
  final int hands;
  final ValueChanged<int> onHands;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CreatePocketSectionHeader(
          icon: KpIcons.editNote,
          title: context.l10n.createPocketSectionGeneral,
        ),
        const Gap.s(),
        FieldLabel(context.l10n.createPocketTitleLabel),
        KpTextField(
          label: context.l10n.createPocketTitleHint,
          controller: title,
        ),
        const Gap.m(),
        FieldLabel(context.l10n.createPocketDescLabel),
        KpTextField(
          label: context.l10n.createPocketDescHint,
          controller: description,
        ),
        const Gap.l(),
        CreatePocketSectionHeader(
          icon: KpIcons.calendar,
          title: context.l10n.createPocketSectionTimeline,
        ),
        const Gap.s(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FieldLabel(context.l10n.createPocketYear),
                  KpTextField(
                    label: context.l10n.createPocketYear,
                    controller: year,
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
            ),
            const Gap.m(horizontal: true),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FieldLabel(context.l10n.createPocketStartMonth),
                  _MonthDropdown(
                    months: months,
                    value: startMonth,
                    onChanged: onStartMonth,
                  ),
                ],
              ),
            ),
          ],
        ),
        const Gap.m(),
        FieldLabel(context.l10n.createPocketDuration),
        DurationSlider(months: durationMonths, onChanged: onDurationMonths),
        const Gap.l(),
        CreatePocketSectionHeader(
          icon: KpIcons.payments,
          title: context.l10n.createPocketSectionContribution,
        ),
        const Gap.s(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FieldLabel(context.l10n.createPocketPerHand),
                  KpTextField(
                    label: context.l10n.contributeAmountLabel,
                    controller: perHand,
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
            ),
            const Gap.m(horizontal: true),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FieldLabel(context.l10n.createPocketCapacity),
                  KpTextField(
                    label: context.l10n.createPocketCapacityHint,
                    controller: capacity,
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
            ),
          ],
        ),
        const Gap.l(),
        YourHandsCard(value: hands, onChanged: onHands),
        const Gap.l(),
        const TermsNotice(),
        const Gap.l(),
        KpButton(
          label: context.l10n.createPocketSubmit,
          caps: true,
          icon: KpIcons.rocket,
          variant: KpButtonVariant.secondary,
          onPressed: onSubmit,
        ),
      ],
    );
  }
}

/// Single-column phone create-pocket form (design `create_pocket`).
class CreatePocketPhoneForm extends StatelessWidget {
  const CreatePocketPhoneForm({
    required this.title,
    required this.description,
    required this.year,
    required this.duration,
    required this.perHand,
    required this.capacity,
    required this.months,
    required this.startMonth,
    required this.onStartMonth,
    required this.hands,
    required this.onHands,
    required this.agreed,
    required this.onAgreed,
    required this.onSubmit,
    super.key,
  });

  final TextEditingController title;
  final TextEditingController description;
  final TextEditingController year;
  final TextEditingController duration;
  final TextEditingController perHand;
  final TextEditingController capacity;
  final List<String> months;
  final int startMonth;
  final ValueChanged<int> onStartMonth;
  final int hands;
  final ValueChanged<int> onHands;
  final bool agreed;
  final ValueChanged<bool> onAgreed;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FieldLabel(context.l10n.createPocketTitleLabel),
        KpTextField(
          label: context.l10n.createPocketTitleHint,
          controller: title,
        ),
        const Gap.m(),
        FieldLabel(context.l10n.createPocketDescLabel),
        KpTextField(
          label: context.l10n.createPocketDescHint,
          controller: description,
        ),
        const Gap.m(),
        FieldLabel(context.l10n.createPocketYear),
        KpTextField(
          label: context.l10n.createPocketYear,
          controller: year,
          keyboardType: TextInputType.number,
        ),
        const Gap.m(),
        FieldLabel(context.l10n.createPocketStartMonth),
        _MonthDropdown(
          months: months,
          value: startMonth,
          onChanged: onStartMonth,
        ),
        const Gap.m(),
        FieldLabel(context.l10n.createPocketDuration),
        KpTextField(
          label: context.l10n.createPocketDuration,
          controller: duration,
          keyboardType: TextInputType.number,
        ),
        const Gap.m(),
        FieldLabel(context.l10n.createPocketPerHand),
        KpTextField(
          label: context.l10n.contributeAmountLabel,
          controller: perHand,
          keyboardType: TextInputType.number,
        ),
        const Gap.m(),
        FieldLabel(context.l10n.createPocketCapacity),
        KpTextField(
          label: context.l10n.createPocketCapacityHint,
          controller: capacity,
          keyboardType: TextInputType.number,
        ),
        const Gap.m(),
        FieldLabel(context.l10n.createPocketYourHands),
        HandsStepper(value: hands, onChanged: onHands),
        const Gap.l(),
        TermsCard(agreed: agreed, onChanged: onAgreed),
        const Gap.l(),
        const Center(child: CreatePocketCostPill()),
        const Gap.s(),
        KpButton(
          label: context.l10n.createPocketSubmit,
          caps: true,
          onPressed: agreed ? onSubmit : null,
        ),
      ],
    );
  }
}

class _MonthDropdown extends StatelessWidget {
  const _MonthDropdown({
    required this.months,
    required this.value,
    required this.onChanged,
  });

  final List<String> months;
  final int value;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<int>(
      initialValue: value,
      items: [
        for (var m = 1; m <= 12; m++)
          DropdownMenuItem<int>(value: m, child: Text(months[m - 1])),
      ],
      onChanged: (v) => onChanged(v ?? 1),
    );
  }
}
