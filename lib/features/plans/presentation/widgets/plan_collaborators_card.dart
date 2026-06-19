import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/plans/presentation/widgets/plan_detail_fixtures.dart';

/// "Shared with" collaborators card on the tablet plan-detail screen (design
/// `grocery_plan_detail_tablet`): a header with the collaborator count, a list
/// of members and an invite-by-email row.
class PlanCollaboratorsCard extends StatelessWidget {
  const PlanCollaboratorsCard({super.key});

  static const double _avatar = 40;
  static const double _sendWidth = 84;

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
                  context.l10n.planSharedWith,
                  style: context.textTheme.titleLarge,
                ),
              ),
              const Gap.s(horizontal: true),
              Text(
                context.l10n.planCollaboratorsCount(
                  kPlanDetailCollaboratorCount,
                ),
                style: context.textTheme.labelLarge?.copyWith(
                  color: context.colorScheme.primary,
                ),
              ),
            ],
          ),
          const Gap.m(),
          for (final c in kPlanDetailCollaborators)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: KpSpacing.xs),
              child: _CollaboratorRow(collaborator: c),
            ),
          const Gap.s(),
          Divider(color: context.colorScheme.outlineVariant),
          const Gap.s(),
          Text(
            context.l10n.planInviteLabel.toUpperCase(),
            style: context.textTheme.labelSmall?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
          const Gap.xs(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: KpTextField(
                  label: context.l10n.planInviteLabel,
                  hint: context.l10n.planInviteHint,
                ),
              ),
              const Gap.xs(horizontal: true),
              SizedBox(
                width: _sendWidth,
                child: KpButton(
                  label: context.l10n.planInviteSend,
                  caps: true,
                  variant: KpButtonVariant.primary,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CollaboratorRow extends StatelessWidget {
  const _CollaboratorRow({required this.collaborator});

  final PlanCollaborator collaborator;

  @override
  Widget build(BuildContext context) {
    final initial = collaborator.name.isEmpty
        ? ''
        : collaborator.name.characters.first;
    return Row(
      children: [
        Container(
          width: PlanCollaboratorsCard._avatar,
          height: PlanCollaboratorsCard._avatar,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.colorScheme.surfaceContainerHighest,
          ),
          child: Text(
            initial,
            style: context.textTheme.titleMedium?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
        const Gap.s(horizontal: true),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(collaborator.name, style: context.textTheme.titleMedium),
              Text(
                collaborator.owner
                    ? context.l10n.planRoleOwner
                    : context.l10n.planRoleCollaborator,
                style: context.textTheme.labelSmall?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
        Icon(
          collaborator.owner
              ? Icons.verified_user_rounded
              : Icons.person_remove_rounded,
          color: collaborator.owner
              ? context.colorScheme.outline
              : context.colorScheme.error,
        ),
      ],
    );
  }
}
