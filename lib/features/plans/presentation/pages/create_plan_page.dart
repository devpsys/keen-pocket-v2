import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:keenpockets/app/app_nav.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/plans/presentation/widgets/create_plan_fields.dart';
import 'package:keenpockets/features/plans/presentation/widgets/create_plan_phone_view.dart';
import 'package:keenpockets/features/plans/presentation/widgets/create_plan_tablet_view.dart';

/// Create-plan form (design `create_grocery_plan`). Presentation-only: collects
/// input and pops on submit; no persistence yet.
class CreatePlanPage extends StatefulWidget {
  const CreatePlanPage({super.key});

  @override
  State<CreatePlanPage> createState() => _CreatePlanPageState();
}

class _CreatePlanPageState extends State<CreatePlanPage> {
  final _title = TextEditingController();
  final _budget = TextEditingController();

  bool _isMonth = true;
  int _month = 3; // March, per the design default
  int _year = 2024;
  bool _carryOver = true;

  static const List<int> _years = [2023, 2024, 2025, 2026];

  @override
  void dispose() {
    _title.dispose();
    _budget.dispose();
    super.dispose();
  }

  List<String> get _months => [
    for (var m = 1; m <= 12; m++) DateFormat.MMMM().format(DateTime(2000, m)),
  ];

  CreatePlanFields _fields() => CreatePlanFields(
    title: _title,
    budget: _budget,
    months: _months,
    isMonth: _isMonth,
    onPeriodChanged: (v) => setState(() => _isMonth = v),
    month: _month,
    onMonth: (v) => setState(() => _month = v),
    year: _year,
    years: _years,
    onYear: (v) => setState(() => _year = v),
    carryOver: _carryOver,
    onCarryOver: (v) => setState(() => _carryOver = v),
  );

  void _submit() => Navigator.of(context).pop();

  @override
  Widget build(BuildContext context) {
    final expanded = context.isExpanded;
    return AppTabletShell(
      body: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          title: Text(
            expanded
                ? context.l10n.planTabletTitle
                : context.l10n.brandWordmark,
            style: context.textTheme.titleLarge?.copyWith(
              color: context.colorScheme.primary,
            ),
          ),
        ),
        bottomNavigationBar: expanded
            ? null
            : CreatePlanBottomBar(onSubmit: _submit),
        body: expanded
            ? CreatePlanTabletView(fields: _fields(), onSubmit: _submit)
            : CreatePlanPhoneView(fields: _fields()),
      ),
    );
  }
}
