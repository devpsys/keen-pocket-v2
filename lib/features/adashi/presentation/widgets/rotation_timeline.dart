import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/adashi/presentation/view_models/adashi_view.dart';

/// Vertical stepper showing the rotation order: who has received, who is
/// receiving this cycle, and who is upcoming.
class RotationTimeline extends StatelessWidget {
  const RotationTimeline({required this.members, super.key});

  final List<AdashiMemberView> members;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final member in members)
          _RotationRow(member: member, isLast: member == members.last),
      ],
    );
  }
}

class _RotationRow extends StatelessWidget {
  const _RotationRow({required this.member, required this.isLast});

  final AdashiMemberView member;
  final bool isLast;

  ({IconData icon, Color color, String label}) _style(BuildContext context) {
    return switch (member.status) {
      RotationStatus.received => (
        icon: Icons.check_circle,
        color: context.colors.success,
        label: context.l10n.rotationReceived,
      ),
      RotationStatus.current => (
        icon: Icons.play_circle_fill,
        color: context.colorScheme.primary,
        label: context.l10n.rotationCurrent,
      ),
      RotationStatus.upcoming => (
        icon: Icons.radio_button_unchecked,
        color: context.colorScheme.onSurfaceVariant,
        label: context.l10n.rotationUpcoming,
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    final s = _style(context);
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Icon(s.icon, color: s.color, size: KpSpacing.l),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    color: context.colorScheme.outlineVariant,
                  ),
                ),
            ],
          ),
          const Gap.s(horizontal: true),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: KpSpacing.m),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${member.position}. ${member.name}',
                    style: context.textTheme.titleMedium,
                  ),
                  Text(
                    s.label,
                    style: context.textTheme.bodySmall?.copyWith(
                      color: s.color,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
