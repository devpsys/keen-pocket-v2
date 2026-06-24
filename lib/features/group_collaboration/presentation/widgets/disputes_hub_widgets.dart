import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/group_collaboration/presentation/view_models/dispute_view.dart';

/// White "candy" card: 2px outline + a flat 7px bottom shadow (design
/// `disputes_hub`). [faded] dims dismissed cases.
BoxDecoration disputeCandyDecoration(
  BuildContext context, {
  bool faded = false,
}) {
  return BoxDecoration(
    color: context.colorScheme.surface,
    borderRadius: KpRadii.allXl,
    border: Border.all(
      color: context.colorScheme.surfaceContainerHighest,
      width: 2,
    ),
    boxShadow: [
      BoxShadow(
        color: context.colorScheme.surfaceContainerHighest.withValues(
          alpha: faded ? 0.5 : 1,
        ),
        offset: const Offset(0, 7),
      ),
    ],
  );
}

/// Phone disputes hub (design `disputes_hub`): title + raise CTA, an admin-view
/// toggle, the active-cases summary, then the case list. Presentation-only.
class DisputesHubView extends StatelessWidget {
  const DisputesHubView({
    required this.disputes,
    required this.adminView,
    this.resolvedThisMonth,
    this.avgResolution,
    this.onToggleAdmin,
    super.key,
  });

  final List<DisputeView> disputes;
  final bool adminView;
  final int? resolvedThisMonth;
  final String? avgResolution;
  final ValueChanged<bool>? onToggleAdmin;

  int get _openCount =>
      disputes.where((d) => d.status == DisputeStatus.open).length;

  @override
  Widget build(BuildContext context) {
    return ListView(
      // Extra bottom room so the case list clears the raise-dispute FAB.
      padding: const EdgeInsets.fromLTRB(
        KpSpacing.m,
        KpSpacing.l,
        KpSpacing.m,
        KpSpacing.xxxl + KpSpacing.l,
      ),
      children: [
        Row(
          children: [
            Text('⚖️', style: context.textTheme.headlineMedium),
            const Gap.xs(horizontal: true),
            Text(
              context.l10n.disputesTitle,
              style: context.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
            const Expanded(child: SizedBox.shrink()),
            _AdminToggle(value: adminView, onChanged: onToggleAdmin),
          ],
        ),
        const Gap.s(),
        DisputeSummaryCard(
          openCount: _openCount,
          resolvedThisMonth: resolvedThisMonth,
          avgResolution: avgResolution,
        ),
        const Gap.l(),
        if (disputes.isEmpty)
          const DisputesEmptyState()
        else
          for (final d in disputes) ...[
            DisputeHubCard(dispute: d, adminView: adminView),
            const Gap.l(),
          ],
      ],
    );
  }
}

class _AdminToggle extends StatelessWidget {
  const _AdminToggle({required this.value, this.onChanged});

  final bool value;
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          context.l10n.disputesAdminView,
          style: context.textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w400,
            color: context.colorScheme.onSurfaceVariant,
          ),
        ),
        const Gap.s(horizontal: true),
        Switch(value: value, onChanged: onChanged),
      ],
    );
  }
}

/// Summary "Active Cases" bento card with a gold gavel and two mini stats.
class DisputeSummaryCard extends StatelessWidget {
  const DisputeSummaryCard({
    required this.openCount,
    this.resolvedThisMonth,
    this.avgResolution,
    super.key,
  });

  final int openCount;
  final int? resolvedThisMonth;
  final String? avgResolution;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: disputeCandyDecoration(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: KpSpacing.xxl,
                height: KpSpacing.xxl,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: context.colorScheme.secondaryContainer,
                  borderRadius: KpRadii.allL,
                ),
                child: Icon(
                  Icons.gavel_rounded,
                  color: context.colorScheme.onSecondaryContainer,
                  size: KpSpacing.xl,
                ),
              ),
              const Gap.m(horizontal: true),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.disputesActiveCases,
                    style: context.textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: context.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  Text(
                    context.l10n.disputesOpenLabel(openCount),
                    style: context.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ],
          ),
          if (resolvedThisMonth != null) ...[
            const Gap.l(),
            _StatRow(
              label: context.l10n.disputesResolvedThisMonth,
              value: '$resolvedThisMonth',
              valueColor: context.colors.success,
            ),
          ],
          if (avgResolution != null) ...[
            const Gap.s(),
            _StatRow(
              label: context.l10n.disputesAvgResolution,
              value: avgResolution!,
            ),
          ],
        ],
      ),
    );
  }
}

class _StatRow extends StatelessWidget {
  const _StatRow({required this.label, required this.value, this.valueColor});

  final String label;
  final String value;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.s),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainer,
        borderRadius: KpRadii.allM,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              label,
              style: context.textTheme.bodySmall?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          const Gap.s(horizontal: true),
          Text(
            value,
            style: context.textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.w500,
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }
}

/// A single dispute case card (design `disputes_hub`). Reveals admin resolution
/// actions on open cases when [adminView] is on.
class DisputeHubCard extends StatelessWidget {
  const DisputeHubCard({
    required this.dispute,
    this.adminView = false,
    this.onResolve,
    this.onDismiss,
    super.key,
  });

  final DisputeView dispute;
  final bool adminView;
  final VoidCallback? onResolve;
  final VoidCallback? onDismiss;

  @override
  Widget build(BuildContext context) {
    final dismissed = dispute.status == DisputeStatus.dismissed;
    return Opacity(
      opacity: dismissed ? 0.75 : 1,
      child: Container(
        padding: const EdgeInsets.all(KpSpacing.l),
        decoration: disputeCandyDecoration(context, faded: dismissed),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        dispute.title,
                        style: context.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const Gap.xxs(),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: dispute.author,
                              style: context.textTheme.labelMedium?.copyWith(
                                color: context.colorScheme.primary,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: '  ·  ${dispute.timeAgo}',
                              style: context.textTheme.labelMedium?.copyWith(
                                fontWeight: FontWeight.w500,
                                color: context.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap.s(horizontal: true),
                DisputeStatusPill(status: dispute.status),
              ],
            ),
            const Gap.s(),
            Text(
              dispute.description,
              style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w400,
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
            if (dispute.resolutionNote != null) ...[
              const Gap.m(),
              _ResolutionBox(note: dispute.resolutionNote!),
            ],
            if (adminView && dispute.status == DisputeStatus.open) ...[
              const Gap.m(),
              _AdminActions(onResolve: onResolve, onDismiss: onDismiss),
            ],
          ],
        ),
      ),
    );
  }
}

class _ResolutionBox extends StatelessWidget {
  const _ResolutionBox({required this.note});

  final String note;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.s),
      decoration: BoxDecoration(
        color: context.colors.successContainer,
        borderRadius: KpRadii.allL,
        border: Border.all(
          color: context.colors.success.withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.verified_rounded,
            size: KpSpacing.m,
            color: context.colors.success,
          ),
          const Gap.s(horizontal: true),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.disputesResolutionNote,
                  style: context.textTheme.labelMedium?.copyWith(
                    color: context.colors.success,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const Gap.xxs(),
                Text(
                  note,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: context.colors.success,
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

class _AdminActions extends StatelessWidget {
  const _AdminActions({this.onResolve, this.onDismiss});

  final VoidCallback? onResolve;
  final VoidCallback? onDismiss;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Divider(),
        const Gap.s(),
        Container(
          padding: const EdgeInsets.all(KpSpacing.s),
          decoration: BoxDecoration(
            color: context.colorScheme.surfaceContainer,
            borderRadius: KpRadii.allL,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.l10n.disputesResolutionNoteLabel,
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Gap.xs(),
              TextField(
                minLines: 2,
                maxLines: 4,
                style: context.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w400,
                ),
                decoration: InputDecoration(
                  hintText: context.l10n.disputesResolutionPlaceholder,
                ),
              ),
            ],
          ),
        ),
        const Gap.s(),
        Row(
          children: [
            Expanded(
              child: KpButton(
                label: context.l10n.disputesResolveCase,
                variant: KpButtonVariant.success,
                dense: true,
                onPressed: onResolve ?? () {},
              ),
            ),
            const Gap.s(horizontal: true),
            Expanded(
              child: KpButton(
                label: context.l10n.disputesDismissAction,
                variant: KpButtonVariant.neutral,
                dense: true,
                onPressed: onDismiss ?? () {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// Status pill used by both phone and tablet (uppercase, bordered).
class DisputeStatusPill extends StatelessWidget {
  const DisputeStatusPill({required this.status, super.key});

  final DisputeStatus status;

  @override
  Widget build(BuildContext context) {
    final (Color bg, Color fg, String label) = switch (status) {
      DisputeStatus.open => (
        context.colors.warningContainer,
        context.colors.warning,
        context.l10n.disputeStatusOpen,
      ),
      DisputeStatus.resolved => (
        context.colors.successContainer,
        context.colors.success,
        context.l10n.disputeStatusResolved,
      ),
      DisputeStatus.dismissed => (
        context.colorScheme.surfaceContainerHighest,
        context.colorScheme.onSurfaceVariant,
        context.l10n.disputeStatusDismissed,
      ),
    };
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.s,
        vertical: KpSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: const BorderRadius.all(Radius.circular(KpRadii.pill)),
        border: Border.all(color: fg.withValues(alpha: 0.3)),
      ),
      child: Text(
        label.toUpperCase(),
        style: context.textTheme.labelSmall?.copyWith(
          color: fg,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

/// Dashed empty state (design `disputes_hub`).
class DisputesEmptyState extends StatelessWidget {
  const DisputesEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: KpSpacing.xxl),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const KpMascot.celebrate(size: 96),
          const Gap.m(),
          Text(
            context.l10n.disputesEmptyTitle,
            style: context.textTheme.titleLarge?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
          const Gap.xxs(),
          Text(
            context.l10n.disputesEmptyMessage,
            textAlign: TextAlign.center,
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
