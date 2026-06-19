import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/plans/presentation/widgets/plan_checklist_row.dart';
import 'package:keenpockets/features/plans/presentation/widgets/plan_detail_fixtures.dart';

/// "Item Checklist" card on the tablet plan-detail screen (design
/// `grocery_plan_detail_tablet`): a header with a Quick Add button, a row of
/// column labels and one [PlanChecklistRow] per item.
class PlanChecklistCard extends StatelessWidget {
  const PlanChecklistCard({super.key});

  static const double _quickAddWidth = 140;

  @override
  Widget build(BuildContext context) {
    return KpCard(
      padding: const EdgeInsets.all(KpSpacing.l),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  context.l10n.planDetailItemChecklist,
                  style: context.textTheme.titleLarge,
                ),
              ),
              const Gap.s(horizontal: true),
              SizedBox(
                width: _quickAddWidth,
                child: KpButton(
                  label: context.l10n.planQuickAdd,
                  icon: KpIcons.add,
                  onPressed: () {},
                ),
              ),
            ],
          ),
          const Gap.l(),
          const _ColumnHeader(),
          Divider(color: context.colorScheme.outlineVariant),
          for (final item in kPlanDetailItems) PlanChecklistRow(item: item),
        ],
      ),
    );
  }
}

class _ColumnHeader extends StatelessWidget {
  const _ColumnHeader();

  @override
  Widget build(BuildContext context) {
    final style = context.textTheme.labelSmall?.copyWith(
      color: context.colorScheme.onSurfaceVariant,
    );
    return Padding(
      padding: const EdgeInsets.only(bottom: KpSpacing.xs),
      child: Row(
        children: [
          Expanded(
            flex: PlanChecklistFlex.status,
            child: Text(context.l10n.planColStatus.toUpperCase(), style: style),
          ),
          Expanded(
            flex: PlanChecklistFlex.item,
            child: Text(context.l10n.planColItem.toUpperCase(), style: style),
          ),
          Expanded(
            flex: PlanChecklistFlex.category,
            child: Text(
              context.l10n.planColCategory.toUpperCase(),
              style: style,
            ),
          ),
          Expanded(
            flex: PlanChecklistFlex.price,
            child: Text(context.l10n.planColPrice.toUpperCase(), style: style),
          ),
          Expanded(
            flex: PlanChecklistFlex.actions,
            child: Text(
              context.l10n.planColActions.toUpperCase(),
              style: style,
            ),
          ),
        ],
      ),
    );
  }
}
