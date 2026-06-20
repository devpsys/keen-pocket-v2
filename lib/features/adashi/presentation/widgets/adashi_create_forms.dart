import 'dart:math' as math;

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/adashi/presentation/view_models/adashi_view.dart';
import 'package:keenpockets/features/adashi/presentation/widgets/adashi_create_fields.dart';

/// Shared field state passed from the page to either form.
class AdashiCreateFormData {
  const AdashiCreateFormData({
    required this.name,
    required this.perCycle,
    required this.nuban,
    required this.accountName,
    required this.dayOptions,
    required this.cycleDays,
    required this.onCycleDays,
    required this.startDate,
    required this.onPickDate,
    required this.mode,
    required this.onMode,
    required this.bankOptions,
    required this.bank,
    required this.onBank,
    required this.onSubmit,
  });

  final TextEditingController name;
  final TextEditingController perCycle;
  final TextEditingController nuban;
  final TextEditingController accountName;
  final List<int> dayOptions;
  final int cycleDays;
  final ValueChanged<int> onCycleDays;
  final DateTime? startDate;
  final VoidCallback onPickDate;
  final RotationMode mode;
  final ValueChanged<RotationMode> onMode;
  final List<String> bankOptions;
  final String? bank;
  final ValueChanged<String?> onBank;
  final VoidCallback onSubmit;
}

/// Phone create-adashi form (design `create_adashi`): each field in its own
/// chunky card, a collection-bank section, and a terms checkbox.
class AdashiCreatePhoneForm extends StatelessWidget {
  const AdashiCreatePhoneForm({
    required this.data,
    required this.isPublic,
    required this.onPublic,
    required this.agreed,
    required this.onAgreed,
    super.key,
  });

  final AdashiCreateFormData data;
  final bool isPublic;
  final ValueChanged<bool> onPublic;
  final bool agreed;
  final ValueChanged<bool> onAgreed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AdashiFieldCard(
          label: context.l10n.adashiCreateName,
          child: TextField(
            controller: data.name,
            decoration: adashiInput(
              context,
              hint: context.l10n.adashiCreateNameHint,
            ),
          ),
        ),
        const Gap.m(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: AdashiFieldCard(
                label: context.l10n.adashiCreatePerCycle,
                child: TextField(
                  controller: data.perCycle,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: adashiInput(
                    context,
                    hint: context.l10n.adashiCreatePerCycleHint,
                  ),
                ),
              ),
            ),
            const Gap.m(horizontal: true),
            Expanded(
              child: AdashiFieldCard(
                label: context.l10n.adashiCreateCycleDays,
                child: _CycleDaysDropdown(data: data),
              ),
            ),
          ],
        ),
        const Gap.m(),
        AdashiFieldCard(
          label: context.l10n.adashiCreateStartDate,
          child: _DateField(date: data.startDate, onTap: data.onPickDate),
        ),
        const Gap.m(),
        AdashiFieldCard(
          label: context.l10n.adashiCreateRotationMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AdashiRotationToggle(mode: data.mode, onChanged: data.onMode),
              const Gap.xs(),
              Text(
                context.l10n.adashiCreateAutoHint,
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
        const Gap.m(),
        AdashiPublicToggle(value: isPublic, onChanged: onPublic),
        const Gap.l(),
        _BankSectionHeader(),
        const Gap.s(),
        KpCard(
          padding: const EdgeInsets.all(KpSpacing.m),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AdashiFieldLabel(context.l10n.adashiCreateBank),
              _BankDropdown(data: data),
              const Gap.m(),
              AdashiFieldLabel(context.l10n.adashiCreateNuban),
              TextField(
                controller: data.nuban,
                keyboardType: TextInputType.number,
                maxLength: 10,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: adashiInput(
                  context,
                  hint: context.l10n.adashiCreateNubanHint,
                ).copyWith(counterText: ''),
              ),
              const Gap.m(),
              AdashiFieldLabel(context.l10n.adashiCreateAccountName),
              TextField(
                controller: data.accountName,
                decoration: adashiInput(
                  context,
                  hint: context.l10n.adashiCreateAccountNameHint,
                ),
              ),
            ],
          ),
        ),
        const Gap.m(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Checkbox(value: agreed, onChanged: (v) => onAgreed(v ?? false)),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: KpSpacing.s),
                child: Text(
                  context.l10n.adashiCreateTerms,
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// Tablet create-adashi form (design `create_adashi_tablet`): one card with the
/// fields in a tighter grid, plus the submit button + add-members note.
class AdashiCreateTabletForm extends StatelessWidget {
  const AdashiCreateTabletForm({required this.data, super.key});

  final AdashiCreateFormData data;

  @override
  Widget build(BuildContext context) {
    // Design uses a flat 2px-bordered card (not the candy KpCard).
    return Container(
      padding: const EdgeInsets.all(KpSpacing.xl),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLowest,
        borderRadius: KpRadii.allXl,
        border: Border.all(
          color: context.colorScheme.surfaceContainerHighest,
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AdashiFieldLabel(context.l10n.adashiCreateName),
          TextField(
            controller: data.name,
            decoration: adashiInput(
              context,
              hint: context.l10n.adashiCreateNameHint,
            ),
          ),
          const Gap.m(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AdashiFieldLabel(context.l10n.adashiCreatePerCycle),
                    TextField(
                      controller: data.perCycle,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration:
                          adashiInput(
                            context,
                            hint: context.l10n.adashiCreatePerCycleHint,
                          ).copyWith(
                            prefixText: '₦ ',
                            prefixStyle: context.textTheme.bodyMedium,
                          ),
                    ),
                  ],
                ),
              ),
              const Gap.m(horizontal: true),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AdashiFieldLabel(context.l10n.adashiCreateCycleDuration),
                    _CycleDaysDropdown(data: data),
                  ],
                ),
              ),
            ],
          ),
          const Gap.m(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AdashiFieldLabel(context.l10n.adashiCreateStartDate),
                    _DateField(date: data.startDate, onTap: data.onPickDate),
                  ],
                ),
              ),
              const Gap.m(horizontal: true),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AdashiFieldLabel(context.l10n.adashiCreateRotationMode),
                    AdashiRotationSwitch(
                      mode: data.mode,
                      onChanged: data.onMode,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Gap.l(),
          Text(
            context.l10n.adashiCreatePayoutDetails,
            style: context.textTheme.headlineSmall,
          ),
          const Gap.m(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AdashiFieldLabel(context.l10n.adashiCreateBank),
                    _BankDropdown(data: data),
                  ],
                ),
              ),
              const Gap.m(horizontal: true),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AdashiFieldLabel(context.l10n.adashiCreateNuban),
                    TextField(
                      controller: data.nuban,
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: adashiInput(
                        context,
                        hint: context.l10n.adashiCreateNubanHint,
                      ).copyWith(counterText: ''),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Gap.m(),
          AdashiFieldLabel(context.l10n.adashiCreateAccountName),
          TextField(
            controller: data.accountName,
            decoration: adashiInput(
              context,
              hint: context.l10n.adashiCreateAccountNameHint,
            ),
          ),
          const Gap.l(),
          KpButton(
            label: context.l10n.adashiCreateSubmit,
            icon: Icons.add_circle_rounded,
            onPressed: data.onSubmit,
          ),
          const Gap.s(),
          Center(
            child: Text(
              context.l10n.adashiCreateAddMembersNote,
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

/// Tablet left pane: mascot in a gold circle with a chat bubble, the
/// "Create your Adashi" intro, and the coral cost-note pill.
class AdashiCreateTabletIntro extends StatelessWidget {
  const AdashiCreateTabletIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(KpSpacing.xl),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                // Chat bubble with a downward tail (design `create_adashi_tablet`).
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(KpSpacing.m),
                      decoration: BoxDecoration(
                        color: context.colorScheme.surfaceContainerLowest,
                        borderRadius: KpRadii.allL,
                        border: Border.all(
                          color: context.colorScheme.surfaceContainerHighest,
                          width: 2,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: KpColors.neutral200,
                            offset: Offset(0, KpSpacing.xxs),
                          ),
                        ],
                      ),
                      child: Text(
                        context.l10n.adashiCreateIntroTitle,
                        style: context.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: context.colorScheme.primary,
                        ),
                      ),
                    ),
                    // A rotated square forms the bubble's downward point.
                    Positioned(
                      bottom: -KpSpacing.xs / 2,
                      left: KpSpacing.l,
                      child: Transform.rotate(
                        angle: math.pi / 4,
                        child: Container(
                          width: KpSpacing.s,
                          height: KpSpacing.s,
                          decoration: BoxDecoration(
                            color: context.colorScheme.surfaceContainerLowest,
                            border: Border(
                              right: BorderSide(
                                color:
                                    context.colorScheme.surfaceContainerHighest,
                                width: 2,
                              ),
                              bottom: BorderSide(
                                color:
                                    context.colorScheme.surfaceContainerHighest,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Gap.m(),
                // Mascot in a gold circle with a candy shadow.
                Container(
                  width: 200,
                  height: 200,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: KpColors.gold100,
                    boxShadow: [
                      BoxShadow(
                        color: KpColors.gold500,
                        offset: Offset(0, KpSpacing.xs),
                      ),
                    ],
                  ),
                  child: const KpMascot.celebrate(size: 150),
                ),
              ],
            ),
          ),
          const Gap.xl(),
          Text(
            context.l10n.adashiCreateTabletTitle,
            style: context.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          const Gap.s(),
          Text(
            context.l10n.adashiCreateTabletBody,
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w400,
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
          const Gap.xl(),
          const AdashiCostNotePill(),
        ],
      ),
    );
  }
}

class _BankSectionHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.account_balance_rounded, color: context.colorScheme.primary),
        const Gap.xs(horizontal: true),
        Text(
          context.l10n.adashiCreateCollectionBank,
          style: context.textTheme.headlineSmall?.copyWith(
            color: context.colorScheme.primary,
          ),
        ),
      ],
    );
  }
}

class _CycleDaysDropdown extends StatelessWidget {
  const _CycleDaysDropdown({required this.data});

  final AdashiCreateFormData data;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<int>(
      initialValue: data.cycleDays,
      isExpanded: true,
      decoration: adashiInput(context),
      items: [
        for (final d in data.dayOptions)
          DropdownMenuItem<int>(
            value: d,
            child: Text(context.l10n.adashiCreateDaysOption(d)),
          ),
      ],
      onChanged: (v) => data.onCycleDays(v ?? data.cycleDays),
    );
  }
}

class _BankDropdown extends StatelessWidget {
  const _BankDropdown({required this.data});

  final AdashiCreateFormData data;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      initialValue: data.bank,
      isExpanded: true,
      decoration: adashiInput(context),
      hint: Text(context.l10n.adashiCreateSelectBank),
      items: [
        for (final b in data.bankOptions)
          DropdownMenuItem<String>(value: b, child: Text(b)),
      ],
      onChanged: data.onBank,
    );
  }
}

class _DateField extends StatelessWidget {
  const _DateField({required this.date, required this.onTap});

  final DateTime? date;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final label = date == null
        ? context.l10n.adashiCreateStartDateHint
        : DateFormat('MM/dd/yyyy').format(date!);
    return InkWell(
      onTap: onTap,
      borderRadius: KpRadii.allM,
      child: InputDecorator(
        decoration: adashiInput(context),
        child: Row(
          children: [
            Expanded(
              child: Text(
                label,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: date == null
                      ? context.colorScheme.onSurfaceVariant
                      : context.colorScheme.onSurface,
                ),
              ),
            ),
            Icon(
              Icons.calendar_today_rounded,
              size: KpSpacing.m,
              color: context.colorScheme.onSurfaceVariant,
            ),
          ],
        ),
      ),
    );
  }
}
