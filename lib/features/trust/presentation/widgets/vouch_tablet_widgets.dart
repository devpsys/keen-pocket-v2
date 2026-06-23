import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/core/widgets/kp_network_image.dart';
import 'package:keenpockets/features/trust/presentation/widgets/vouch_fixtures.dart';
import 'package:keenpockets/features/trust/presentation/widgets/vouch_widgets.dart';

/// Compact selectable request row (tablet master list — design `_tablet`).
class VouchListRow extends StatelessWidget {
  const VouchListRow({
    required this.request,
    required this.selected,
    required this.onTap,
    super.key,
  });

  final VouchRequest request;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(KpSpacing.m),
        decoration: BoxDecoration(
          color: selected
              ? context.colorScheme.primaryContainer.withValues(alpha: 0.08)
              : context.colorScheme.surfaceContainerLowest,
          borderRadius: KpRadii.allL,
          border: Border.all(
            color: selected
                ? context.colorScheme.primary
                : context.colorScheme.surfaceContainerHighest,
            width: 2,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: KpRadii.allM,
                  child: KpNetworkImage(
                    url: request.avatarUrl,
                    width: 40,
                    height: 40,
                  ),
                ),
                const Gap.s(horizontal: true),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(request.name, style: context.textTheme.titleSmall),
                      Text(
                        context.l10n.vouchReputation(request.reputation),
                        style: context.textTheme.labelSmall?.copyWith(
                          color: context.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  request.timeAgo,
                  style: context.textTheme.labelSmall?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            if (request.note.isNotEmpty) ...[
              const Gap.s(),
              Text(
                request.note,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.bodySmall?.copyWith(
                  fontStyle: FontStyle.italic,
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Detail panel for the selected request (tablet — design `_tablet`).
class VouchDetailPanel extends StatelessWidget {
  const VouchDetailPanel({
    required this.request,
    this.onRecommend,
    this.onDecline,
    super.key,
  });

  final VouchRequest request;
  final VoidCallback? onRecommend;
  final VoidCallback? onDecline;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLowest,
        borderRadius: KpRadii.allXl,
        border: Border.all(
          color: context.colorScheme.surfaceContainerHighest,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.surfaceContainerHighest,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: KpRadii.allL,
                child: KpNetworkImage(
                  url: request.avatarUrl,
                  width: 64,
                  height: 64,
                ),
              ),
              const Gap.m(horizontal: true),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(request.name, style: context.textTheme.titleLarge),
                    const Gap.xxs(),
                    Text(
                      context.l10n.vouchMemberLine(
                        request.location,
                        request.memberSince,
                      ),
                      style: context.textTheme.bodySmall?.copyWith(
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const Gap.xs(),
                    Wrap(
                      spacing: KpSpacing.xs,
                      runSpacing: KpSpacing.xxs,
                      children: [for (final t in request.tags) _Tag(label: t)],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Gap.l(),
          Row(
            children: [
              Expanded(
                child: _StatCard(
                  label: context.l10n.vouchReputationScore,
                  value: '${request.reputation}',
                  tint: context.colorScheme.primary,
                ),
              ),
              const Gap.m(horizontal: true),
              Expanded(
                child: _StatCard(
                  label: context.l10n.vouchTrustNetwork,
                  value: context.l10n.vouchVouchedStat(request.vouchedCount),
                  caption: context.l10n.vouchMutual(request.mutualConnections),
                  tint: context.colorScheme.primary,
                ),
              ),
            ],
          ),
          const Gap.m(),
          _ProgressCard(
            label: context.l10n.vouchSavingConsistency,
            value: request.savingConsistency,
          ),
          const Gap.m(),
          VouchNote(note: request.note.isEmpty ? '—' : request.note),
          const Gap.l(),
          if (request.status == VouchStatus.recommended)
            Opacity(
              opacity: 0.5,
              child: KpButton(
                label: context.l10n.vouchVouched,
                variant: KpButtonVariant.neutral,
                onPressed: () {},
              ),
            )
          else
            Row(
              children: [
                Expanded(
                  child: KpButton(
                    label: context.l10n.vouchRecommend,
                    caps: true,
                    onPressed: onRecommend ?? () {},
                  ),
                ),
                const Gap.s(horizontal: true),
                Expanded(
                  child: KpButton(
                    label: context.l10n.vouchDecline,
                    variant: KpButtonVariant.neutral,
                    caps: true,
                    onPressed: onDecline ?? () {},
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  const _Tag({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.s,
        vertical: KpSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerHighest,
        borderRadius: KpRadii.allS,
      ),
      child: Text(
        label,
        style: context.textTheme.labelSmall?.copyWith(
          color: context.colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.label,
    required this.value,
    required this.tint,
    this.caption,
  });

  final String label;
  final String value;
  final Color tint;
  final String? caption;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLow,
        borderRadius: KpRadii.allL,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label.toUpperCase(),
            style: context.textTheme.labelSmall?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
              letterSpacing: 0.5,
            ),
          ),
          const Gap.xs(),
          Text(
            value,
            style: context.textTheme.headlineSmall?.copyWith(color: tint),
          ),
          if (caption != null) ...[
            const Gap.xxs(),
            Text(
              caption!,
              style: context.textTheme.labelSmall?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _ProgressCard extends StatelessWidget {
  const _ProgressCard({required this.label, required this.value});

  final String label;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLow,
        borderRadius: KpRadii.allL,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label.toUpperCase(),
                style: context.textTheme.labelSmall?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                  letterSpacing: 0.5,
                ),
              ),
              Text(
                '${(value * 100).round()}%',
                style: context.textTheme.labelLarge?.copyWith(
                  color: context.colorScheme.primary,
                ),
              ),
            ],
          ),
          const Gap.s(),
          KpProgressBar(value: value, color: KpColors.gold500, height: 12),
        ],
      ),
    );
  }
}
