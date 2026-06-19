import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/core/widgets/kp_network_image.dart';
import 'package:keenpockets/features/pockets/domain/entities/pocket.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/pocket_detail_fixtures.dart';

/// Right-rail members roster: the organiser first (with an ORGANIZER chip),
/// then each member with an online/away presence dot and a MEMBER chip.
class PocketMembersRosterTablet extends StatelessWidget {
  const PocketMembersRosterTablet({required this.pocket, super.key});

  final Pocket pocket;

  @override
  Widget build(BuildContext context) {
    return KpCard(
      padding: const EdgeInsets.all(KpSpacing.l),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n
                    .pocketDetailMembersWithCount(pocket.memberCount)
                    .toUpperCase(),
                style: context.textTheme.labelSmall?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.person_add_rounded,
                  color: context.colorScheme.primary,
                ),
              ),
            ],
          ),
          const Gap.s(),
          _MemberRow(
            name: kPocketOrganiserName,
            avatarUrl: kPocketOrganiserAvatar,
            online: true,
            chipLabel: context.l10n.pocketDetailRoleOrganizer,
            chipBackground: context.colorScheme.primaryContainer,
            chipForeground: context.colorScheme.onPrimaryContainer,
          ),
          for (final m in kPocketMembers) ...[
            const Gap.s(),
            _MemberRow(
              name: m.name,
              avatarUrl: m.avatarUrl,
              online: m.online,
              chipLabel: context.l10n.pocketDetailRoleMember,
              chipBackground: context.colorScheme.surfaceContainerHighest,
              chipForeground: context.colorScheme.onSurfaceVariant,
            ),
          ],
        ],
      ),
    );
  }
}

/// A single roster row: avatar with presence dot, name and a role chip.
class _MemberRow extends StatelessWidget {
  const _MemberRow({
    required this.name,
    required this.avatarUrl,
    required this.online,
    required this.chipLabel,
    required this.chipBackground,
    required this.chipForeground,
  });

  static const double _avatar = 40;
  static const double _dot = 12;

  final String name;
  final String avatarUrl;
  final bool online;
  final String chipLabel;
  final Color chipBackground;
  final Color chipForeground;

  @override
  Widget build(BuildContext context) {
    final dotColor = online ? context.colors.success : context.colors.warning;
    return Row(
      children: [
        SizedBox(
          width: _avatar,
          height: _avatar,
          child: Stack(
            children: [
              KpNetworkAvatar(url: avatarUrl, radius: _avatar / 2),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  width: _dot,
                  height: _dot,
                  decoration: BoxDecoration(
                    color: dotColor,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: context.colorScheme.surface,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const Gap.s(horizontal: true),
        Expanded(child: Text(name, style: context.textTheme.labelLarge)),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: KpSpacing.xs,
            vertical: KpSpacing.xxs,
          ),
          decoration: BoxDecoration(
            color: chipBackground,
            borderRadius: KpRadii.allM,
          ),
          child: Text(
            chipLabel,
            style: context.textTheme.labelSmall?.copyWith(
              color: chipForeground,
            ),
          ),
        ),
      ],
    );
  }
}
