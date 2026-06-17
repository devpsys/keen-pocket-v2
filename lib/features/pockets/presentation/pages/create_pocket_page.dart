import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';

/// Create-pocket form (design phase D — `create_pocket`). Presentation-only:
/// the form collects input and pops on submit; no persistence yet.
class CreatePocketPage extends StatefulWidget {
  const CreatePocketPage({super.key});

  @override
  State<CreatePocketPage> createState() => _CreatePocketPageState();
}

class _CreatePocketPageState extends State<CreatePocketPage> {
  final _title = TextEditingController();
  final _description = TextEditingController();
  final _perHand = TextEditingController();
  final _capacity = TextEditingController();
  final _duration = TextEditingController(text: '12');
  final _year = TextEditingController(text: '2026');

  int _startMonth = 1; // 1..12
  int _hands = 1;
  bool _agreed = false;

  @override
  void dispose() {
    _title.dispose();
    _description.dispose();
    _perHand.dispose();
    _capacity.dispose();
    _duration.dispose();
    _year.dispose();
    super.dispose();
  }

  List<String> get _months => [
    for (var m = 1; m <= 12; m++) DateFormat.MMMM().format(DateTime(2000, m)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.createPocketTitle)),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(KpSpacing.l),
          children: [
            _IntroCard(),
            const Gap.l(),
            _Label(context.l10n.createPocketTitleLabel),
            KpTextField(
              label: context.l10n.createPocketTitleHint,
              controller: _title,
            ),
            const Gap.m(),
            _Label(context.l10n.createPocketDescLabel),
            KpTextField(
              label: context.l10n.createPocketDescHint,
              controller: _description,
            ),
            const Gap.m(),
            _Label(context.l10n.createPocketYear),
            KpTextField(
              label: context.l10n.createPocketYear,
              controller: _year,
              keyboardType: TextInputType.number,
            ),
            const Gap.m(),
            _Label(context.l10n.createPocketStartMonth),
            DropdownButtonFormField<int>(
              initialValue: _startMonth,
              items: [
                for (var m = 1; m <= 12; m++)
                  DropdownMenuItem<int>(value: m, child: Text(_months[m - 1])),
              ],
              onChanged: (v) => setState(() => _startMonth = v ?? 1),
            ),
            const Gap.m(),
            _Label(context.l10n.createPocketDuration),
            KpTextField(
              label: context.l10n.createPocketDuration,
              controller: _duration,
              keyboardType: TextInputType.number,
            ),
            const Gap.m(),
            _Label(context.l10n.createPocketPerHand),
            KpTextField(
              label: context.l10n.contributeAmountLabel,
              controller: _perHand,
              keyboardType: TextInputType.number,
            ),
            const Gap.m(),
            _Label(context.l10n.createPocketCapacity),
            KpTextField(
              label: context.l10n.createPocketCapacityHint,
              controller: _capacity,
              keyboardType: TextInputType.number,
            ),
            const Gap.m(),
            _Label(context.l10n.createPocketYourHands),
            _HandsStepper(
              value: _hands,
              onChanged: (v) => setState(() => _hands = v),
            ),
            const Gap.l(),
            _TermsCard(
              agreed: _agreed,
              onChanged: (v) => setState(() => _agreed = v),
            ),
            const Gap.l(),
            Center(child: _CostPill()),
            const Gap.s(),
            KpButton(
              label: context.l10n.createPocketSubmit,
              caps: true,
              onPressed: _agreed ? () => Navigator.of(context).pop() : null,
            ),
          ],
        ),
      ),
    );
  }
}

class _IntroCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return KpCard.financial(
      child: Row(
        children: [
          const KpMascot.think(size: 64),
          const Gap.m(horizontal: true),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.createPocketIntroTitle,
                  style: context.textTheme.titleLarge,
                ),
                const Gap.xxs(),
                Text(
                  context.l10n.createPocketIntroBody,
                  style: context.textTheme.bodySmall?.copyWith(
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

class _CostPill extends StatelessWidget {
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

class _Label extends StatelessWidget {
  const _Label(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: KpSpacing.xs),
      child: Text(text, style: context.textTheme.labelLarge),
    );
  }
}

class _HandsStepper extends StatelessWidget {
  const _HandsStepper({required this.value, required this.onChanged});

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

class _TermsCard extends StatelessWidget {
  const _TermsCard({required this.agreed, required this.onChanged});

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
