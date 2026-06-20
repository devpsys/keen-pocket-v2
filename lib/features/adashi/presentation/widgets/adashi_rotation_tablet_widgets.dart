import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/core/widgets/dashed_rrect_painter.dart';
import 'package:keenpockets/core/widgets/kp_network_image.dart';
import 'package:keenpockets/features/adashi/presentation/view_models/adashi_view.dart';
import 'package:keenpockets/features/group_collaboration/group_collaboration.dart';

/// The design's `candy-card`: white surface, 16px corners, and a single 7px
/// flat bottom border (no top/side borders).
class _CandyCard extends StatelessWidget {
  const _CandyCard({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLowest,
        borderRadius: KpRadii.allL,
        border: Border(
          bottom: BorderSide(
            color: context.colorScheme.surfaceContainerHighest,
            width: 7,
          ),
        ),
      ),
      child: child,
    );
  }
}

/// Target status card (design `adashi_rotation_tablet`): current pot + bar on
/// the left, target + next-payout on the right.
class RotationTabletTarget extends StatelessWidget {
  const RotationTabletTarget({required this.rotation, super.key});

  static const double _barWidth = 192;

  final AdashiRotationView rotation;

  @override
  Widget build(BuildContext context) {
    return _CandyCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.adashiRotationCurrentPot.toUpperCase(),
                  style: context.textTheme.labelSmall?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                    letterSpacing: 1.5,
                  ),
                ),
                const Gap.xxs(),
                Text(
                  rotation.currentPot.format(),
                  style: context.textTheme.headlineLarge,
                ),
                const Gap.s(),
                Row(
                  children: [
                    SizedBox(
                      width: _barWidth,
                      child: KpProgressBar(
                        value: rotation.percent / 100,
                        height: 12,
                      ),
                    ),
                    const Gap.s(horizontal: true),
                    Text(
                      context.l10n.adashiHubPercent(rotation.percent),
                      style: context.textTheme.labelLarge?.copyWith(
                        color: context.colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Gap.m(horizontal: true),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                context.l10n.adashiHubTarget.toUpperCase(),
                style: context.textTheme.labelSmall?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                  letterSpacing: 1.5,
                ),
              ),
              const Gap.xxs(),
              Text(
                rotation.target.format(),
                style: context.textTheme.headlineMedium,
              ),
              const Gap.s(),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.timer_rounded,
                    size: KpSpacing.m,
                    color: context.colorScheme.secondary,
                  ),
                  const Gap.xxs(horizontal: true),
                  Flexible(
                    child: Text(
                      context.l10n.adashiRotationNextPayout(
                        rotation.payoutDaysLeft,
                      ),
                      style: context.textTheme.labelMedium?.copyWith(
                        color: context.colorScheme.secondary,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// "Rotation Order" card with the vertical timeline (tablet).
class RotationTabletOrder extends StatelessWidget {
  const RotationTabletOrder({required this.cycles, super.key});

  final List<AdashiCycleStep> cycles;

  @override
  Widget build(BuildContext context) {
    return _CandyCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            context.l10n.adashiRotationOrder,
            style: context.textTheme.headlineSmall?.copyWith(
              color: context.colorScheme.primary,
            ),
          ),
          const Gap.l(),
          for (final cycle in cycles)
            _CycleRow(cycle: cycle, isLast: cycle == cycles.last),
        ],
      ),
    );
  }
}

class _CycleRow extends StatelessWidget {
  const _CycleRow({required this.cycle, required this.isLast});

  final AdashiCycleStep cycle;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final active = cycle.status == CycleStepStatus.active;
    final locked = cycle.status == CycleStepStatus.locked;
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              _Node(status: cycle.status),
              if (!isLast)
                Expanded(
                  child: Center(
                    child: Container(
                      width: 3,
                      color: context.colorScheme.surfaceContainerHighest,
                    ),
                  ),
                ),
            ],
          ),
          const Gap.m(horizontal: true),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: KpSpacing.l),
              child: Opacity(
                opacity: switch (cycle.status) {
                  CycleStepStatus.next => 0.7,
                  CycleStepStatus.locked => 0.5,
                  _ => 1.0,
                },
                child: Container(
                  padding: const EdgeInsets.all(KpSpacing.m),
                  decoration: BoxDecoration(
                    color: active
                        ? context.colorScheme.surfaceContainerLowest
                        : context.colorScheme.surfaceContainerLow,
                    borderRadius: KpRadii.allM,
                    border: active
                        ? Border.all(
                            color: context.colorScheme.primary,
                            width: 2,
                          )
                        : Border(
                            bottom: BorderSide(
                              color: context.colorScheme.outlineVariant,
                              width: 4,
                            ),
                          ),
                    boxShadow: active
                        ? const [
                            BoxShadow(
                              color: KpColors.brand600,
                              offset: Offset(0, 4),
                            ),
                          ]
                        : null,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _label(context).toUpperCase(),
                              style: context.textTheme.labelSmall?.copyWith(
                                color: active
                                    ? context.colorScheme.primary
                                    : context.colorScheme.onSurfaceVariant,
                                letterSpacing: 0.5,
                              ),
                            ),
                            const Gap.xxs(),
                            Text(
                              cycle.recipientName,
                              style: context.textTheme.titleMedium?.copyWith(
                                fontStyle: locked ? FontStyle.italic : null,
                              ),
                            ),
                            if (active)
                              Text(
                                context.l10n.adashiRotationPayout(
                                  cycle.amount.format(),
                                ),
                                style: context.textTheme.bodySmall?.copyWith(
                                  color: context.colorScheme.onSurfaceVariant,
                                ),
                              ),
                          ],
                        ),
                      ),
                      _trailing(context, active: active, locked: locked),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _label(BuildContext context) => switch (cycle.status) {
    CycleStepStatus.active => context.l10n.adashiRotationCycleActive(
      cycle.cycleNumber,
    ),
    CycleStepStatus.next => context.l10n.adashiRotationCycleNext(
      cycle.cycleNumber,
    ),
    _ => context.l10n.adashiRotationCycle(cycle.cycleNumber),
  };

  Widget _trailing(
    BuildContext context, {
    required bool active,
    required bool locked,
  }) {
    if (active) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: KpSpacing.s,
              vertical: KpSpacing.xxs,
            ),
            decoration: BoxDecoration(
              color: context.colorScheme.tertiaryContainer.withValues(
                alpha: 0.2,
              ),
              borderRadius: KpRadii.allS,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.schedule_rounded,
                  size: KpSpacing.s,
                  color: context.colorScheme.tertiary,
                ),
                const Gap.xxs(horizontal: true),
                Text(
                  context.l10n.adashiRotationDaysLeft(cycle.daysLeft ?? 0),
                  style: context.textTheme.labelSmall?.copyWith(
                    color: context.colorScheme.tertiary,
                  ),
                ),
              ],
            ),
          ),
          if (cycle.avatarUrl != null) ...[
            const Gap.s(),
            KpNetworkAvatar(url: cycle.avatarUrl!, radius: 22),
          ],
        ],
      );
    }
    if (cycle.status == CycleStepStatus.next) {
      return Text(
        context.l10n.adashiRotationExpected(cycle.dateLabel ?? ''),
        style: context.textTheme.labelMedium?.copyWith(
          color: context.colorScheme.primary,
        ),
      );
    }
    if (cycle.status == CycleStepStatus.done) {
      return Text(
        context.l10n.adashiRotationPaid(cycle.amount.format()),
        style: context.textTheme.labelMedium?.copyWith(
          color: context.colors.success,
        ),
      );
    }
    return Icon(
      Icons.lock_rounded,
      size: KpSpacing.m,
      color: context.colorScheme.onSurfaceVariant,
    );
  }
}

class _Node extends StatelessWidget {
  const _Node({required this.status});

  final CycleStepStatus status;

  @override
  Widget build(BuildContext context) {
    final (Color bg, IconData icon, Color fg) = switch (status) {
      CycleStepStatus.done => (
        context.colors.success,
        Icons.check_rounded,
        context.colorScheme.onPrimary,
      ),
      CycleStepStatus.active => (
        context.colorScheme.primary,
        Icons.sync_rounded,
        context.colorScheme.onPrimary,
      ),
      CycleStepStatus.next => (
        context.colorScheme.surfaceContainerHigh,
        Icons.person_rounded,
        context.colorScheme.onSurfaceVariant,
      ),
      CycleStepStatus.locked => (
        context.colorScheme.surfaceContainerHigh,
        Icons.lock_rounded,
        context.colorScheme.onSurfaceVariant,
      ),
    };
    return Container(
      width: KpSpacing.xl,
      height: KpSpacing.xl,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: bg,
        border: Border.all(color: context.colorScheme.surface, width: 3),
      ),
      child: Icon(icon, size: KpSpacing.m, color: fg),
    );
  }
}

/// Bottom action bar: transaction log, group chat, invite.
class RotationTabletActions extends StatelessWidget {
  const RotationTabletActions({required this.adashiId, super.key});

  final String adashiId;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _ActionButton(
            icon: Icons.receipt_long_rounded,
            label: context.l10n.adashiRotationTransactionLog,
            bg: context.colorScheme.secondaryContainer,
            base: KpColors.gold600,
            fg: context.colorScheme.onSecondaryContainer,
          ),
        ),
        const Gap.m(horizontal: true),
        Expanded(
          child: _ActionButton(
            icon: Icons.chat_rounded,
            label: context.l10n.adashiRotationGroupChat,
            bg: context.colorScheme.primaryContainer,
            base: KpColors.brand600,
            fg: context.colorScheme.onPrimaryContainer,
            onTap: () => Navigator.of(context).push<void>(
              MaterialPageRoute(
                builder: (_) => GroupChatPage(groupId: adashiId),
              ),
            ),
          ),
        ),
        const Gap.m(horizontal: true),
        Expanded(
          child: _ActionButton(
            icon: Icons.share_rounded,
            label: context.l10n.adashiRotationInvite,
            bg: context.colorScheme.inverseSurface,
            base: KpColors.neutral1000,
            fg: context.colorScheme.onInverseSurface,
          ),
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.icon,
    required this.label,
    required this.bg,
    required this.base,
    required this.fg,
    this.onTap,
  });

  final IconData icon;
  final String label;
  final Color bg;
  final Color base;
  final Color fg;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(KpSpacing.m),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: KpRadii.allL,
          border: Border(bottom: BorderSide(color: base, width: 4)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: fg),
            const Gap.s(horizontal: true),
            Flexible(
              child: Text(
                label,
                style: context.textTheme.labelLarge?.copyWith(color: fg),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Right-pane Mr K tip box (tablet).
class RotationTabletTip extends StatelessWidget {
  const RotationTabletTip({required this.tip, super.key});

  final String tip;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: BoxDecoration(
        color: context.colorScheme.primaryContainer.withValues(alpha: 0.12),
        borderRadius: KpRadii.allXl,
        border: Border.all(
          color: context.colorScheme.primaryContainer,
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(KpSpacing.xs),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.colorScheme.surfaceContainerLowest,
                  border: Border.all(
                    color: context.colorScheme.primaryContainer,
                    width: 2,
                  ),
                ),
                child: const KpMascot.think(size: 40),
              ),
              const Gap.m(horizontal: true),
              Text(
                context.l10n.adashiRotationTipTitle.toUpperCase(),
                style: context.textTheme.labelMedium?.copyWith(
                  color: context.colorScheme.primary,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
          const Gap.m(),
          Text(
            tip,
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.italic,
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

/// Right-pane members list (tablet).
class RotationTabletMembers extends StatelessWidget {
  const RotationTabletMembers({required this.members, super.key});

  final List<AdashiRotationMember> members;

  @override
  Widget build(BuildContext context) {
    return _CandyCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n.adashiRotationMembers,
                style: context.textTheme.headlineSmall?.copyWith(
                  color: context.colorScheme.primary,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: KpSpacing.s,
                  vertical: KpSpacing.xxs,
                ),
                decoration: BoxDecoration(
                  color: context.colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(KpRadii.pill),
                ),
                child: Text(
                  context.l10n.adashiRotationActiveCount(members.length),
                  style: context.textTheme.labelSmall?.copyWith(
                    color: context.colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
            ],
          ),
          const Gap.m(),
          for (final member in members) ...[
            _MemberRow(member: member),
            const Gap.s(),
          ],
          const Gap.xs(),
          const _InviteMemberButton(),
        ],
      ),
    );
  }
}

class _MemberRow extends StatelessWidget {
  const _MemberRow({required this.member});

  final AdashiRotationMember member;

  @override
  Widget build(BuildContext context) {
    final you = member.state == RotationMemberState.you;
    final scheduled = member.state == RotationMemberState.scheduled;

    // Card chrome differs for the signed-in "you" row and dimmed future rows.
    final (Color bg, Color border) = you
        ? (
            context.colorScheme.primaryContainer.withValues(alpha: 0.12),
            context.colorScheme.primaryContainer,
          )
        : scheduled
        ? (
            context.colorScheme.surfaceContainerLow,
            context.colorScheme.outlineVariant,
          )
        : (
            context.colorScheme.surfaceContainerLowest,
            context.colorScheme.outlineVariant,
          );

    return Opacity(
      opacity: scheduled ? 0.7 : 1.0,
      child: Container(
        padding: const EdgeInsets.all(KpSpacing.s),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: KpRadii.allM,
          border: Border.all(color: border, width: 2),
        ),
        child: Row(
          children: [
            _Leading(member: member),
            const Gap.s(horizontal: true),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(member.name, style: context.textTheme.labelLarge),
                  _Subtitle(member: member),
                ],
              ),
            ),
            _TrailingIcon(member: member),
          ],
        ),
      ),
    );
  }
}

/// Avatar, or the "YOU" chip for the signed-in member.
class _Leading extends StatelessWidget {
  const _Leading({required this.member});

  final AdashiRotationMember member;

  @override
  Widget build(BuildContext context) {
    if (member.state == RotationMemberState.you) {
      return Container(
        width: KpSpacing.xl,
        height: KpSpacing.xl,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: context.colorScheme.primaryContainer,
        ),
        child: Text(
          context.l10n.adashiRotationYouBadge.toUpperCase(),
          style: context.textTheme.labelSmall?.copyWith(
            color: context.colorScheme.onPrimaryContainer,
          ),
        ),
      );
    }
    final contributed = member.state == RotationMemberState.contributed;
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: contributed
              ? context.colorScheme.primary
              : context.colorScheme.outlineVariant,
          width: 2,
        ),
      ),
      child: KpNetworkAvatar(url: member.avatarUrl, radius: 18),
    );
  }
}

/// Per-state subtitle: amount / Pending / Pay Now / Scheduled.
class _Subtitle extends StatelessWidget {
  const _Subtitle({required this.member});

  final AdashiRotationMember member;

  @override
  Widget build(BuildContext context) {
    switch (member.state) {
      case RotationMemberState.contributed:
        return Text(
          member.contributed!.format(),
          style: context.textTheme.labelSmall?.copyWith(
            color: context.colors.success,
          ),
        );
      case RotationMemberState.pending:
        return Text(
          context.l10n.adashiRotationPending,
          style: context.textTheme.labelSmall?.copyWith(
            color: context.colorScheme.secondary,
          ),
        );
      case RotationMemberState.you:
        return InkWell(
          onTap: () {},
          child: Text(
            context.l10n.adashiRotationPayNow,
            style: context.textTheme.labelSmall?.copyWith(
              color: context.colorScheme.primary,
              decoration: TextDecoration.underline,
            ),
          ),
        );
      case RotationMemberState.scheduled:
        return Text(
          context.l10n.adashiRotationScheduled,
          style: context.textTheme.labelSmall?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
          ),
        );
    }
  }
}

class _TrailingIcon extends StatelessWidget {
  const _TrailingIcon({required this.member});

  final AdashiRotationMember member;

  @override
  Widget build(BuildContext context) {
    final (IconData? icon, Color color) = switch (member.state) {
      RotationMemberState.contributed => (
        Icons.verified_rounded,
        context.colorScheme.primary,
      ),
      RotationMemberState.pending => (
        Icons.schedule_rounded,
        context.colorScheme.outline,
      ),
      RotationMemberState.you => (
        Icons.person_rounded,
        context.colorScheme.primary,
      ),
      RotationMemberState.scheduled => (null, context.colorScheme.outline),
    };
    if (icon == null) return const SizedBox.shrink();
    return Icon(icon, size: KpSpacing.m, color: color);
  }
}

/// Dashed "Invite New Member" button at the foot of the members list.
class _InviteMemberButton extends StatelessWidget {
  const _InviteMemberButton();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: KpRadii.allM,
      child: CustomPaint(
        foregroundPainter: DashedRRectPainter(
          color: context.colorScheme.primary,
          radius: KpRadii.m,
          strokeWidth: 1.5,
        ),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: KpSpacing.s),
          child: Text(
            '+ ${context.l10n.adashiRotationInviteMember}',
            style: context.textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.w400,
              color: context.colorScheme.primary,
            ),
          ),
        ),
      ),
    );
  }
}
