import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/core/widgets/kp_network_image.dart';
import 'package:keenpockets/features/adashi/presentation/view_models/adashi_view.dart';

/// Circular pot gauge with target + next-payout pill (design `adashi_rotation`).
class AdashiRotationPot extends StatelessWidget {
  const AdashiRotationPot({required this.rotation, super.key});

  static const double _ring = 192;

  final AdashiRotationView rotation;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: _ring,
          height: _ring,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned.fill(
                child: CircularProgressIndicator(
                  value: rotation.percent / 100,
                  strokeWidth: KpSpacing.s,
                  strokeCap: StrokeCap.round,
                  backgroundColor: context.colorScheme.surfaceContainer,
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    context.l10n.adashiRotationCurrentPot.toUpperCase(),
                    style: context.textTheme.labelSmall?.copyWith(
                      color: context.colorScheme.outline,
                      letterSpacing: 1,
                    ),
                  ),
                  Text(
                    rotation.currentPot.format(),
                    style: context.textTheme.headlineLarge?.copyWith(
                      color: context.colorScheme.primary,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    context.l10n.adashiRotationCollected(rotation.percent),
                    style: context.textTheme.bodySmall?.copyWith(
                      color: context.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Gap.s(),
        Text(
          context.l10n.adashiRotationTarget(rotation.target.format()),
          style: context.textTheme.bodyMedium,
        ),
        const Gap.s(),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: KpSpacing.m,
            vertical: KpSpacing.xs,
          ),
          decoration: BoxDecoration(
            color: context.colorScheme.tertiaryContainer.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(KpRadii.pill),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.timer_rounded,
                size: KpSpacing.m,
                color: context.colorScheme.tertiary,
              ),
              const Gap.xs(horizontal: true),
              Text(
                context.l10n.adashiRotationNextPayout(rotation.payoutDaysLeft),
                style: context.textTheme.labelSmall?.copyWith(
                  color: context.colorScheme.tertiary,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Mr K financial-tip card.
class AdashiMrKTip extends StatelessWidget {
  const AdashiMrKTip({required this.tip, super.key});

  final String tip;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLow,
        borderRadius: KpRadii.allM,
        border: Border.all(color: context.colorScheme.outlineVariant, width: 2),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const KpMascot.think(size: 56),
          const Gap.m(horizontal: true),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.adashiRotationTipTitle.toUpperCase(),
                  style: context.textTheme.labelSmall?.copyWith(
                    color: context.colorScheme.primary,
                    letterSpacing: 1,
                  ),
                ),
                const Gap.xxs(),
                Text(
                  tip,
                  style: context.textTheme.bodySmall?.copyWith(
                    fontStyle: FontStyle.italic,
                    color: context.colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// "Rotation Order" cycle timeline.
class AdashiRotationOrder extends StatelessWidget {
  const AdashiRotationOrder({required this.cycles, super.key});

  final List<AdashiCycleStep> cycles;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          context.l10n.adashiRotationOrder,
          style: context.textTheme.headlineSmall?.copyWith(
            color: context.colorScheme.primary,
          ),
        ),
        const Gap.m(),
        for (final cycle in cycles)
          _CycleRow(cycle: cycle, isLast: cycle == cycles.last),
      ],
    );
  }
}

class _CycleRow extends StatelessWidget {
  const _CycleRow({required this.cycle, required this.isLast});

  final AdashiCycleStep cycle;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
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
                      width: 2,
                      color: context.colorScheme.surfaceContainerHighest,
                    ),
                  ),
                ),
            ],
          ),
          const Gap.m(horizontal: true),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: KpSpacing.m),
              child: _CycleCard(cycle: cycle),
            ),
          ),
        ],
      ),
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
        context.colorScheme.outlineVariant,
        Icons.person_rounded,
        context.colorScheme.onPrimary,
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

class _CycleCard extends StatelessWidget {
  const _CycleCard({required this.cycle});

  final AdashiCycleStep cycle;

  @override
  Widget build(BuildContext context) {
    final active = cycle.status == CycleStepStatus.active;
    final locked = cycle.status == CycleStepStatus.locked;
    return Container(
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: BoxDecoration(
        color: active
            ? context.colorScheme.surfaceContainerLowest
            : context.colorScheme.surfaceContainerLow,
        borderRadius: KpRadii.allM,
        border: Border.all(
          color: active
              ? context.colorScheme.primary
              : context.colorScheme.outlineVariant,
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  _cycleLabel(context),
                  style: context.textTheme.labelSmall?.copyWith(
                    color: active
                        ? context.colorScheme.primary
                        : context.colorScheme.onSurfaceVariant,
                    letterSpacing: 0.5,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              _trailing(context),
            ],
          ),
          const Gap.xs(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cycle.recipientName,
                      style: context.textTheme.titleMedium?.copyWith(
                        fontStyle: locked ? FontStyle.italic : null,
                        color: locked
                            ? context.colorScheme.onSurfaceVariant
                            : context.colorScheme.onSurface,
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
              if (active && cycle.avatarUrl != null)
                KpNetworkImage(
                  url: cycle.avatarUrl!,
                  width: KpSpacing.xl,
                  height: KpSpacing.xl,
                  borderRadius: KpRadii.allM,
                ),
            ],
          ),
        ],
      ),
    );
  }

  String _cycleLabel(BuildContext context) => switch (cycle.status) {
    CycleStepStatus.active => context.l10n.adashiRotationCycleActive(
      cycle.cycleNumber,
    ),
    CycleStepStatus.next => context.l10n.adashiRotationCycleNext(
      cycle.cycleNumber,
    ),
    _ => context.l10n.adashiRotationCycle(cycle.cycleNumber),
  }.toUpperCase();

  Widget _trailing(BuildContext context) {
    switch (cycle.status) {
      case CycleStepStatus.done:
        return Text(
          context.l10n.adashiRotationPaid(cycle.amount.format()),
          style: context.textTheme.labelMedium?.copyWith(
            color: context.colors.success,
          ),
        );
      case CycleStepStatus.active:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.schedule_rounded,
              size: KpSpacing.m,
              color: context.colorScheme.error,
            ),
            const Gap.xxs(horizontal: true),
            Text(
              context.l10n.adashiRotationDaysLeft(cycle.daysLeft ?? 0),
              style: context.textTheme.labelSmall?.copyWith(
                color: context.colorScheme.error,
                letterSpacing: 0.5,
              ),
            ),
          ],
        );
      case CycleStepStatus.next:
        return Text(
          context.l10n.adashiRotationExpected(cycle.dateLabel ?? ''),
          style: context.textTheme.labelSmall?.copyWith(
            color: context.colorScheme.primary,
            letterSpacing: 0.5,
          ),
        );
      case CycleStepStatus.locked:
        return Icon(
          Icons.lock_rounded,
          size: KpSpacing.m,
          color: context.colorScheme.onSurfaceVariant,
        );
    }
  }
}

/// Members list with rating + KYC + contribution status.
class AdashiRotationMembers extends StatelessWidget {
  const AdashiRotationMembers({required this.members, super.key});

  final List<AdashiRotationMember> members;

  @override
  Widget build(BuildContext context) {
    return Column(
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
            Text(
              context.l10n.adashiRotationActiveCount(members.length),
              style: context.textTheme.labelMedium?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
        const Gap.s(),
        for (final member in members) ...[
          _MemberRow(member: member),
          const Gap.s(),
        ],
      ],
    );
  }
}

class _MemberRow extends StatelessWidget {
  const _MemberRow({required this.member});

  final AdashiRotationMember member;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLowest,
        borderRadius: KpRadii.allM,
        border: Border.all(color: context.colorScheme.outlineVariant, width: 2),
      ),
      child: Row(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              KpNetworkAvatar(url: member.avatarUrl, radius: 24),
              Positioned(
                right: -KpSpacing.xxs,
                bottom: -KpSpacing.xxs,
                child: Container(
                  padding: const EdgeInsets.all(KpSpacing.xxs / 2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: context.colorScheme.primary,
                    border: Border.all(
                      color: context.colorScheme.surfaceContainerLowest,
                      width: 2,
                    ),
                  ),
                  child: Icon(
                    Icons.verified_rounded,
                    size: KpSpacing.s,
                    color: context.colorScheme.onPrimary,
                  ),
                ),
              ),
            ],
          ),
          const Gap.m(horizontal: true),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(member.name, style: context.textTheme.bodyLarge),
                const Gap.xxs(),
                Row(
                  children: [
                    Icon(
                      Icons.star_rounded,
                      size: KpSpacing.m,
                      color: context.colorScheme.secondary,
                    ),
                    const Gap.xxs(horizontal: true),
                    Text(member.rating, style: context.textTheme.labelSmall),
                    const Gap.xs(horizontal: true),
                    _KycChip(level: member.kycLevel),
                  ],
                ),
              ],
            ),
          ),
          const Gap.s(horizontal: true),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                (member.isPending
                        ? context.l10n.adashiRotationStatus
                        : context.l10n.adashiRotationContributed)
                    .toUpperCase(),
                style: context.textTheme.labelSmall?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                  letterSpacing: 0.5,
                ),
              ),
              Text(
                member.isPending
                    ? context.l10n.adashiRotationPending
                    : member.contributed!.format(),
                style: context.textTheme.labelLarge?.copyWith(
                  color: member.isPending
                      ? context.colors.warning
                      : context.colors.success,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _KycChip extends StatelessWidget {
  const _KycChip({required this.level});

  final int level;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.xs,
        vertical: KpSpacing.xxs / 2,
      ),
      decoration: BoxDecoration(
        color: context.colors.successContainer,
        borderRadius: KpRadii.allXs,
      ),
      child: Text(
        context.l10n.adashiRotationKycLevel(level).toUpperCase(),
        style: context.textTheme.labelSmall?.copyWith(
          color: context.colors.success,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
