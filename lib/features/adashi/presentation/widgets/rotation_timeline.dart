import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/core/widgets/kp_network_image.dart';
import 'package:keenpockets/features/adashi/presentation/view_models/adashi_view.dart';

/// Vertical rotation stepper (design `adashi_hub`): a connector line with a
/// status node per member, the current receiver highlighted in a candy card,
/// and the signed-in user's row flagged with a "Your turn" badge.
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

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: KpSpacing.l,
            child: Column(
              children: [
                _Node(status: member.status),
                if (!isLast)
                  Expanded(
                    child: Center(
                      child: Container(
                        width: 4,
                        color: context.colorScheme.surfaceContainerHighest,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const Gap.m(horizontal: true),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: KpSpacing.l),
              child: member.status == RotationStatus.current
                  ? _CurrentCard(member: member)
                  : _PlainRow(member: member),
            ),
          ),
        ],
      ),
    );
  }
}

/// The status dot sitting on the connector line.
class _Node extends StatelessWidget {
  const _Node({required this.status});

  final RotationStatus status;

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case RotationStatus.received:
        return _circle(
          color: context.colorScheme.primary,
          child: Icon(
            Icons.check_rounded,
            size: KpSpacing.m,
            color: context.colorScheme.onPrimary,
          ),
        );
      case RotationStatus.current:
        return _circle(
          color: context.colorScheme.primary,
          child: Icon(
            Icons.play_arrow_rounded,
            size: KpSpacing.m,
            color: context.colorScheme.onPrimary,
          ),
        );
      case RotationStatus.upcoming:
        return Container(
          width: KpSpacing.l,
          height: KpSpacing.l,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.colorScheme.surface,
            border: Border.all(color: context.colorScheme.primary, width: 3),
          ),
        );
    }
  }

  Widget _circle({required Color color, required Widget child}) {
    return Container(
      width: KpSpacing.l,
      height: KpSpacing.l,
      alignment: Alignment.center,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      child: child,
    );
  }
}

/// Received / upcoming row (plain, no card chrome).
class _PlainRow extends StatelessWidget {
  const _PlainRow({required this.member});

  final AdashiMemberView member;

  @override
  Widget build(BuildContext context) {
    final subtitle = switch (member.status) {
      RotationStatus.received =>
        member.dateLabel == null
            ? context.l10n.rotationReceived
            : context.l10n.adashiHubReceivedOn(member.dateLabel!),
      RotationStatus.upcoming =>
        member.dateLabel == null
            ? context.l10n.rotationUpcoming
            : context.l10n.adashiHubProjectedOn(member.dateLabel!),
      RotationStatus.current => context.l10n.adashiHubReceivingNow,
    };
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _Avatar(member: member),
        const Gap.s(horizontal: true),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                member.isYou ? context.l10n.adashiHubYouUpcoming : member.name,
                style: context.textTheme.labelLarge,
              ),
              Text(
                subtitle,
                style: context.textTheme.labelSmall?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
        if (member.isYou)
          const _YourTurnBadge()
        else if (member.amountLabel != null)
          Text(
            member.amountLabel!,
            style: context.textTheme.labelLarge?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
      ],
    );
  }
}

/// Highlighted "receiving now" card.
class _CurrentCard extends StatelessWidget {
  const _CurrentCard({required this.member});

  final AdashiMemberView member;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.s),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerHighest,
        borderRadius: KpRadii.allL,
        border: Border(
          bottom: BorderSide(color: context.colorScheme.primary, width: 7),
        ),
      ),
      child: Row(
        children: [
          _Avatar(member: member, ringed: true),
          const Gap.s(horizontal: true),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(member.name, style: context.textTheme.labelLarge),
                Text(
                  context.l10n.adashiHubReceivingNow,
                  style: context.textTheme.labelSmall?.copyWith(
                    color: context.colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
          if (member.amountLabel != null)
            Text(
              member.amountLabel!,
              style: context.textTheme.titleMedium?.copyWith(
                color: context.colorScheme.primary,
              ),
            ),
        ],
      ),
    );
  }
}

/// Member portrait or initials chip.
class _Avatar extends StatelessWidget {
  const _Avatar({required this.member, this.ringed = false});

  final AdashiMemberView member;
  final bool ringed;

  static const double _radius = 20;

  @override
  Widget build(BuildContext context) {
    if (member.avatarUrl != null) {
      final avatar = KpNetworkAvatar(url: member.avatarUrl!, radius: _radius);
      if (!ringed) return avatar;
      return Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: context.colorScheme.primary, width: 2),
        ),
        child: avatar,
      );
    }
    return Container(
      width: _radius * 2,
      height: _radius * 2,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: context.colorScheme.primaryContainer,
      ),
      child: Text(
        _initials(member.name),
        style: context.textTheme.labelLarge?.copyWith(
          color: context.colorScheme.primary,
        ),
      ),
    );
  }

  String _initials(String name) {
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.length >= 2) {
      return '${parts.first[0]}${parts[1][0]}'.toUpperCase();
    }
    return name.isEmpty ? '?' : name.substring(0, 1).toUpperCase();
  }
}

/// Gold "Your turn" badge for the user's upcoming row.
class _YourTurnBadge extends StatelessWidget {
  const _YourTurnBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.s,
        vertical: KpSpacing.xxs,
      ),
      decoration: const BoxDecoration(
        color: KpColors.gold100,
        borderRadius: KpRadii.allS,
        border: Border(bottom: BorderSide(color: KpColors.gold600, width: 2)),
      ),
      child: Text(
        context.l10n.adashiHubYourTurn.toUpperCase(),
        style: context.textTheme.labelSmall?.copyWith(
          color: context.colorScheme.onSurface,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
