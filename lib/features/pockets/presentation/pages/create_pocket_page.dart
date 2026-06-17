import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:keenpockets/app/app_nav.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/create_pocket_forms.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/create_pocket_intro.dart';

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
  int _durationMonths = 6; // tablet slider
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
    return AppTabletShell(
      body: Scaffold(
        appBar: AppBar(
          title: Text(
            context.l10n.createPocketTitle,
            style: context.textTheme.titleLarge?.copyWith(
              color: context.colorScheme.primary,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        // Tablet: a two-pane split (mascot identity left, scrollable form
        // right); phone: a single column.
        body: SafeArea(
          child: context.isExpanded
              ? _tabletBody(context)
              : _phoneBody(context),
        ),
      ),
    );
  }

  Widget _tabletBody(BuildContext context) {
    return Row(
      children: [
        const Expanded(flex: 2, child: CreatePocketTabletIntro()),
        VerticalDivider(width: 1, color: context.colorScheme.outlineVariant),
        Expanded(
          flex: 3,
          child: ColoredBox(
            color: context.colorScheme.surface,
            child: ListView(
              padding: const EdgeInsets.all(KpSpacing.l),
              children: [
                Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 560),
                    child: CreatePocketTabletForm(
                      title: _title,
                      description: _description,
                      perHand: _perHand,
                      capacity: _capacity,
                      year: _year,
                      months: _months,
                      startMonth: _startMonth,
                      onStartMonth: (v) => setState(() => _startMonth = v),
                      durationMonths: _durationMonths,
                      onDurationMonths: (v) =>
                          setState(() => _durationMonths = v),
                      hands: _hands,
                      onHands: (v) => setState(() => _hands = v),
                      onSubmit: () => Navigator.of(context).pop(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _phoneBody(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(KpSpacing.l),
      children: [
        const CreatePocketIntroCard(),
        const Gap.l(),
        CreatePocketPhoneForm(
          title: _title,
          description: _description,
          year: _year,
          duration: _duration,
          perHand: _perHand,
          capacity: _capacity,
          months: _months,
          startMonth: _startMonth,
          onStartMonth: (v) => setState(() => _startMonth = v),
          hands: _hands,
          onHands: (v) => setState(() => _hands = v),
          agreed: _agreed,
          onAgreed: (v) => setState(() => _agreed = v),
          onSubmit: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }
}
