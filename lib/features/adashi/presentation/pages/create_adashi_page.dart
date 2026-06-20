import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/app/app_nav.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/adashi/presentation/view_models/adashi_view.dart';
import 'package:keenpockets/features/adashi/presentation/widgets/adashi_create_fields.dart';
import 'package:keenpockets/features/adashi/presentation/widgets/adashi_create_forms.dart';

/// Create-adashi form (design `create_adashi` / `create_adashi_tablet`).
/// Presentation-only: collects input and pops on submit; no persistence yet.
class CreateAdashiPage extends StatefulWidget {
  const CreateAdashiPage({super.key});

  @override
  State<CreateAdashiPage> createState() => _CreateAdashiPageState();
}

class _CreateAdashiPageState extends State<CreateAdashiPage> {
  final _name = TextEditingController();
  final _perCycle = TextEditingController();
  final _nuban = TextEditingController();
  final _accountName = TextEditingController();

  static const _dayOptions = [7, 14, 30];
  static const _bankOptions = [
    'Kuda Microfinance Bank',
    'GTBank',
    'Zenith Bank',
    'Access Bank',
  ];

  int _cycleDays = 7;
  DateTime? _startDate;
  RotationMode _mode = RotationMode.auto;
  bool _isPublic = false;
  bool _agreed = false;
  String? _bank;

  @override
  void dispose() {
    _name.dispose();
    _perCycle.dispose();
    _nuban.dispose();
    _accountName.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final now = DateTime(2026, 6, 20);
    final picked = await showDatePicker(
      context: context,
      initialDate: _startDate ?? now,
      firstDate: now,
      lastDate: DateTime(now.year + 5),
    );
    if (picked != null) setState(() => _startDate = picked);
  }

  AdashiCreateFormData get _data => AdashiCreateFormData(
    name: _name,
    perCycle: _perCycle,
    nuban: _nuban,
    accountName: _accountName,
    dayOptions: _dayOptions,
    cycleDays: _cycleDays,
    onCycleDays: (v) => setState(() => _cycleDays = v),
    startDate: _startDate,
    onPickDate: _pickDate,
    mode: _mode,
    onMode: (v) => setState(() => _mode = v),
    bankOptions: _bankOptions,
    bank: _bank,
    onBank: (v) => setState(() => _bank = v),
    onSubmit: () => Navigator.of(context).pop(),
  );

  @override
  Widget build(BuildContext context) {
    return AppTabletShell(
      selectedIndex: kAdashiTabIndex,
      body: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          title: Text(
            context.l10n.adashiCreate,
            style: context.textTheme.titleLarge?.copyWith(
              color: context.colorScheme.primary,
            ),
          ),
        ),
        body: SafeArea(
          child: context.isExpanded
              ? _tabletBody(context)
              : _phoneBody(context),
        ),
      ),
    );
  }

  /// Wraps [child] so its text renders at form weights (labels w500, fields
  /// w400), scoped to the form only (not the mascot/intro or app bar).
  Widget _regularForm(BuildContext context, Widget child) {
    final theme = Theme.of(context);
    return Theme(
      data: theme.copyWith(textTheme: _formWeights(theme.textTheme)),
      child: child,
    );
  }

  // Mascot/instructions left, form card right — centred in the canvas, no
  // divider (design `create_adashi_tablet`).
  Widget _tabletBody(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(KpSpacing.xl),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Expanded(flex: 2, child: AdashiCreateTabletIntro()),
              const Gap.xl(horizontal: true),
              Expanded(
                flex: 3,
                child: _regularForm(
                  context,
                  AdashiCreateTabletForm(data: _data),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _phoneBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(KpSpacing.m),
            children: [
              const Center(child: AdashiCostPill()),
              const Gap.m(),
              const AdashiCreateIntroCard(),
              const Gap.l(),
              _regularForm(
                context,
                AdashiCreatePhoneForm(
                  data: _data,
                  isPublic: _isPublic,
                  onPublic: (v) => setState(() => _isPublic = v),
                  agreed: _agreed,
                  onAgreed: (v) => setState(() => _agreed = v),
                ),
              ),
            ],
          ),
        ),
        // Sticky submit bar (design `create_adashi`).
        DecoratedBox(
          decoration: BoxDecoration(
            color: context.colorScheme.surface,
            border: Border(
              top: BorderSide(
                color: context.colorScheme.surfaceContainerHighest,
                width: 2,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(KpSpacing.m),
            child: KpButton(
              label: context.l10n.adashiCreateSubmit,
              icon: Icons.rocket_launch_rounded,
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ),
      ],
    );
  }
}

/// Form text weights: labels render at w500, everything else (fields, body) at
/// a regular w400.
TextTheme _formWeights(TextTheme t) {
  TextStyle? field(TextStyle? s) => s?.copyWith(fontWeight: FontWeight.w400);
  TextStyle? label(TextStyle? s) => s?.copyWith(fontWeight: FontWeight.w500);
  return TextTheme(
    displayLarge: field(t.displayLarge),
    displayMedium: field(t.displayMedium),
    displaySmall: field(t.displaySmall),
    headlineLarge: field(t.headlineLarge),
    headlineMedium: field(t.headlineMedium),
    headlineSmall: field(t.headlineSmall),
    titleLarge: field(t.titleLarge),
    titleMedium: field(t.titleMedium),
    titleSmall: field(t.titleSmall),
    bodyLarge: field(t.bodyLarge),
    bodyMedium: field(t.bodyMedium),
    bodySmall: field(t.bodySmall),
    labelLarge: label(t.labelLarge),
    labelMedium: label(t.labelMedium),
    labelSmall: label(t.labelSmall),
  );
}
