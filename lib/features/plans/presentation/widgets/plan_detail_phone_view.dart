import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/plans/presentation/widgets/plan_detail_fixtures.dart';
import 'package:keenpockets/features/plans/presentation/widgets/plan_detail_item_row.dart';

/// Phone layout for the grocery plan detail screen
/// (design `grocery_plan_detail`): planning period + status pills, a bento grid
/// of summary stats, a budget-health bar, the item checklist with an inline
/// add-item form, and the collaborators card.
class PlanDetailPhoneView extends StatelessWidget {
  const PlanDetailPhoneView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(
        KpSpacing.m,
        KpSpacing.m,
        KpSpacing.m,
        // Generous bottom inset so the floating Save button clears the last
        // card.
        KpSpacing.xxxl + KpSpacing.m,
      ),
      children: const [
        _PlanMetaSection(),
        Gap.l(),
        _SummaryGrid(),
        Gap.l(),
        _BudgetHealthCard(),
        Gap.l(),
        _ItemChecklistSection(),
        Gap.m(),
        _AddItemCard(),
        Gap.l(),
        _CollaboratorsSection(),
      ],
    );
  }
}

/// Planning-period line plus the personal-plan / draft status pills.
class _PlanMetaSection extends StatelessWidget {
  const _PlanMetaSection();

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.planDetailPlanningPeriod(kPlanDetailPeriod),
          style: context.textTheme.bodyMedium?.copyWith(
            color: scheme.onSurfaceVariant,
          ),
        ),
        const Gap.xs(),
        Row(
          children: [
            _Pill(
              label: context.l10n.planDetailPersonalPlan,
              background: scheme.secondaryContainer,
              foreground: scheme.onSecondaryContainer,
            ),
            const Gap.xs(horizontal: true),
            _Pill(
              label: context.l10n.planDetailDraft,
              background: scheme.surfaceContainerHighest,
              foreground: scheme.onSurfaceVariant,
            ),
          ],
        ),
      ],
    );
  }
}

/// Small uppercase status chip.
class _Pill extends StatelessWidget {
  const _Pill({
    required this.label,
    required this.background,
    required this.foreground,
  });

  final String label;
  final Color background;
  final Color foreground;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.s,
        vertical: KpSpacing.xxs,
      ),
      decoration: BoxDecoration(color: background, borderRadius: KpRadii.allS),
      child: Text(
        label.toUpperCase(),
        style: context.textTheme.labelSmall?.copyWith(color: foreground),
      ),
    );
  }
}

/// The 2-column bento grid of summary stat tiles.
class _SummaryGrid extends StatelessWidget {
  const _SummaryGrid();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: _StatTile(
                  label: context.l10n.planDetailTotalItems,
                  value: '$kPlanDetailTotalItems',
                  valueColor: context.colorScheme.primary,
                ),
              ),
              const Gap.m(horizontal: true),
              Expanded(
                child: _StatTile(
                  label: context.l10n.planDetailBought,
                  value: '$kPlanDetailBoughtCount',
                  valueColor: context.colors.success,
                ),
              ),
            ],
          ),
        ),
        const Gap.m(),
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: _StatTile(
                  label: context.l10n.planDetailDeferred,
                  value: '$kPlanDetailDeferredCount',
                  valueColor: context.colorScheme.error,
                ),
              ),
              const Gap.m(horizontal: true),
              Expanded(
                child: _StatTile(
                  label: context.l10n.planDetailEstimated,
                  value: kPlanDetailEstimated.format(),
                  valueColor: context.colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// A single white stat tile with a chunky bottom border.
class _StatTile extends StatelessWidget {
  const _StatTile({
    required this.label,
    required this.value,
    required this.valueColor,
  });

  final String label;
  final String value;
  final Color valueColor;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    return Container(
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: KpRadii.allXl,
        border: Border(
          top: BorderSide(color: scheme.surfaceContainerHighest, width: 2),
          left: BorderSide(color: scheme.surfaceContainerHighest, width: 2),
          right: BorderSide(color: scheme.surfaceContainerHighest, width: 2),
          bottom: BorderSide(color: scheme.surfaceContainerHighest, width: 7),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label.toUpperCase(),
            style: context.textTheme.labelSmall?.copyWith(
              color: scheme.onSurfaceVariant,
            ),
          ),
          const Gap.xs(),
          Text(
            value,
            style: context.textTheme.headlineSmall?.copyWith(color: valueColor),
          ),
        ],
      ),
    );
  }
}

/// Budget-health card: spent/budget, the percentage, and the progress bar.
class _BudgetHealthCard extends StatelessWidget {
  const _BudgetHealthCard();

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    final fraction = kPlanDetailSpent.kobo / kPlanDetailBudget.kobo;
    final pct = (fraction * 100).round();

    return KpCard(
      padding: const EdgeInsets.all(KpSpacing.l),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      context.l10n.planDetailBudgetHealth,
                      style: context.textTheme.titleLarge,
                    ),
                    const Gap.xxs(),
                    Text(
                      context.l10n.planDetailSpentOf(
                        kPlanDetailSpent.format(),
                        kPlanDetailBudget.format(),
                      ),
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: scheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              const Gap.s(horizontal: true),
              Text(
                '$pct%',
                style: context.textTheme.headlineSmall?.copyWith(
                  color: context.colors.warning,
                ),
              ),
            ],
          ),
          const Gap.m(),
          KpProgressBar(value: fraction, color: scheme.secondary),
        ],
      ),
    );
  }
}

/// Checklist header plus one [PlanDetailItemRow] per fixture item.
class _ItemChecklistSection extends StatelessWidget {
  const _ItemChecklistSection();

  @override
  Widget build(BuildContext context) {
    return Column(
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
            Icon(Icons.filter_list_rounded, color: context.colorScheme.outline),
          ],
        ),
        const Gap.m(),
        for (final item in kPlanDetailItems) ...[
          PlanDetailItemRow(item: item),
          if (item != kPlanDetailItems.last) const Gap.m(),
        ],
      ],
    );
  }
}

/// Dashed-look, primary-tinted card with the inline add-new-item form.
class _AddItemCard extends StatelessWidget {
  const _AddItemCard();

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: BoxDecoration(
        color: scheme.primaryContainer.withValues(alpha: 0.15),
        borderRadius: KpRadii.allXl,
        border: Border.all(
          color: scheme.primary.withValues(alpha: 0.4),
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.add_circle_outline_rounded,
                size: KpSpacing.m,
                color: scheme.primary,
              ),
              const Gap.xs(horizontal: true),
              Text(
                context.l10n.planAddNewItem.toUpperCase(),
                style: context.textTheme.labelLarge?.copyWith(
                  color: scheme.primary,
                ),
              ),
            ],
          ),
          const Gap.m(),
          KpTextField(label: context.l10n.planItemNameHint),
          const Gap.s(),
          KpTextField(
            label: context.l10n.planItemQtyHint,
            keyboardType: TextInputType.number,
          ),
          const Gap.m(),
          KpButton(
            label: context.l10n.planAddItem,
            caps: true,
            variant: KpButtonVariant.secondary,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

/// "Shared with" header, collaborator list and the invite row.
class _CollaboratorsSection extends StatelessWidget {
  const _CollaboratorsSection();

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                context.l10n.planSharedWith,
                style: context.textTheme.titleLarge,
              ),
            ),
            Text(
              context.l10n.planCollaboratorsCount(kPlanDetailCollaboratorCount),
              style: context.textTheme.labelLarge?.copyWith(
                color: scheme.primary,
              ),
            ),
          ],
        ),
        const Gap.m(),
        KpCard(
          padding: const EdgeInsets.all(KpSpacing.l),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              for (final c in kPlanDetailCollaborators) ...[
                _CollaboratorRow(collaborator: c),
                if (c != kPlanDetailCollaborators.last) const Gap.m(),
              ],
              const Gap.l(),
              Divider(color: scheme.outlineVariant, height: KpSpacing.none),
              const Gap.l(),
              const _InviteRow(),
            ],
          ),
        ),
      ],
    );
  }
}

/// One collaborator: avatar, name, role and a role-dependent trailing icon.
class _CollaboratorRow extends StatelessWidget {
  const _CollaboratorRow({required this.collaborator});

  final PlanCollaborator collaborator;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    final role = collaborator.owner
        ? context.l10n.planRoleOwner
        : context.l10n.planRoleCollaborator;
    final initial = collaborator.name.isNotEmpty
        ? collaborator.name[0].toUpperCase()
        : '?';

    return Row(
      children: [
        CircleAvatar(
          radius: KpSpacing.l / 2,
          backgroundColor: scheme.surfaceContainerHighest,
          child: Text(
            initial,
            style: context.textTheme.labelLarge?.copyWith(
              color: scheme.onSurfaceVariant,
            ),
          ),
        ),
        const Gap.s(horizontal: true),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(collaborator.name, style: context.textTheme.bodyLarge),
              Text(
                role,
                style: context.textTheme.bodySmall?.copyWith(
                  color: scheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
        Icon(
          collaborator.owner
              ? Icons.verified_user_rounded
              : Icons.person_remove_rounded,
          color: collaborator.owner ? scheme.outline : scheme.error,
        ),
      ],
    );
  }
}

/// "Invite via Email or Phone" label, the input and the SEND button.
class _InviteRow extends StatelessWidget {
  const _InviteRow();

  /// Fixed width for the SEND button so it stays compact beside the input.
  static const double _sendButtonWidth = 96;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.planInviteLabel.toUpperCase(),
          style: context.textTheme.labelSmall?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
          ),
        ),
        const Gap.xs(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: KpTextField(label: context.l10n.planInviteHint)),
            const Gap.xs(horizontal: true),
            SizedBox(
              width: _sendButtonWidth,
              child: KpButton(
                label: context.l10n.planInviteSend,
                caps: true,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}
