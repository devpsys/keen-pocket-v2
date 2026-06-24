import 'dart:math' as math;

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/group_collaboration/presentation/disputes_fixtures.dart';
import 'package:keenpockets/features/group_collaboration/presentation/view_models/dispute_view.dart';

/// Tablet disputes hub (design `disputes_hub_tablet`): a master list of cases on
/// the left and the selected case's detail on the right, with Mr. K's advice
/// floating in the corner. The nav rail is provided by `AppTabletShell`.
class DisputesHubTabletView extends StatelessWidget {
  const DisputesHubTabletView({
    required this.disputes,
    required this.selectedId,
    this.onSelect,
    this.onRaise,
    super.key,
  });

  final List<DisputeView> disputes;
  final String? selectedId;
  final ValueChanged<String>? onSelect;
  final VoidCallback? onRaise;

  @override
  Widget build(BuildContext context) {
    final selected =
        disputes.where((d) => d.id == selectedId).firstOrNull ??
        (disputes.isNotEmpty ? disputes.first : null);
    return Row(
      children: [
        // Master list ~28% of the pane, the detail takes the rest (design
        // `disputes_hub_tablet`), so it reflows with the available width.
        Expanded(
          flex: 2,
          child: _MasterList(
            disputes: disputes,
            selectedId: selected?.id,
            onSelect: onSelect,
          ),
        ),
        Expanded(
          flex: 5,
          child: selected == null
              ? const SizedBox.shrink()
              : _DetailPane(dispute: selected, onRaise: onRaise),
        ),
      ],
    );
  }
}

// ── Master list ─────────────────────────────────────────────────────────────
class _MasterList extends StatelessWidget {
  const _MasterList({
    required this.disputes,
    required this.selectedId,
    this.onSelect,
  });

  final List<DisputeView> disputes;
  final String? selectedId;
  final ValueChanged<String>? onSelect;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        border: Border(
          right: BorderSide(color: context.colorScheme.outlineVariant),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(KpSpacing.l),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.disputesHubTitle,
                  style: context.textTheme.titleMedium,
                ),
                const Gap.s(),
                Row(
                  children: [
                    _FilterChip(
                      label: context.l10n.disputesAllCases(disputes.length),
                      selected: true,
                    ),
                    const Gap.xs(horizontal: true),
                    _FilterChip(
                      label: context.l10n.disputesFilterActive,
                      selected: false,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(KpSpacing.m),
              itemCount: disputes.length,
              separatorBuilder: (_, _) => const Gap.m(),
              itemBuilder: (_, i) {
                final d = disputes[i];
                return _CaseItem(
                  dispute: d,
                  selected: d.id == selectedId,
                  onTap: () => onSelect?.call(d.id),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({required this.label, required this.selected});

  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.s,
        vertical: KpSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: selected
            ? context.colorScheme.primaryContainer
            : context.colorScheme.surfaceContainerHigh,
        borderRadius: const BorderRadius.all(Radius.circular(KpRadii.pill)),
      ),
      child: Text(
        label,
        style: context.textTheme.labelSmall?.copyWith(
          color: selected
              ? context.colorScheme.onPrimaryContainer
              : context.colorScheme.onSurfaceVariant,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

class _CaseItem extends StatelessWidget {
  const _CaseItem({required this.dispute, required this.selected, this.onTap});

  final DisputeView dispute;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: KpRadii.allL,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(KpSpacing.m),
        decoration: BoxDecoration(
          color: context.colorScheme.surface,
          borderRadius: KpRadii.allL,
          border: Border.all(
            color: selected
                ? context.colorScheme.primary
                : context.colorScheme.outlineVariant,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: context.colorScheme.outlineVariant,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    dispute.title,
                    style: context.textTheme.labelLarge?.copyWith(
                      color: selected
                          ? context.colorScheme.primary
                          : context.colorScheme.onSurface,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const Gap.xs(horizontal: true),
                _CasePill(status: dispute.status),
              ],
            ),
            const Gap.xs(),
            Text(
              context.l10n.disputesRaisedBy(dispute.author),
              style: context.textTheme.bodySmall?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
            if (dispute.previewQuote != null) ...[
              const Gap.xxs(),
              Text(
                dispute.previewQuote!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.colorScheme.outline,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Small uppercase pill for the master list (open → "Active").
class _CasePill extends StatelessWidget {
  const _CasePill({required this.status});

  final DisputeStatus status;

  @override
  Widget build(BuildContext context) {
    final (Color bg, Color fg, String label) = switch (status) {
      DisputeStatus.open => (
        context.colorScheme.secondaryContainer,
        context.colorScheme.onSecondaryContainer,
        context.l10n.disputeStatusActive,
      ),
      DisputeStatus.resolved => (
        context.colors.successContainer,
        context.colors.success,
        context.l10n.disputeStatusResolved,
      ),
      DisputeStatus.dismissed => (
        context.colorScheme.errorContainer,
        context.colorScheme.error,
        context.l10n.disputeStatusDismissed,
      ),
    };
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.xs,
        vertical: KpSpacing.xxs,
      ),
      decoration: BoxDecoration(color: bg, borderRadius: KpRadii.allS),
      child: Text(
        label.toUpperCase(),
        style: context.textTheme.labelSmall?.copyWith(
          color: fg,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

// ── Detail pane ─────────────────────────────────────────────────────────────
class _DetailPane extends StatelessWidget {
  const _DetailPane({required this.dispute, this.onRaise});

  final DisputeView dispute;
  final VoidCallback? onRaise;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.colorScheme.surface,
      child: Stack(
        children: [
          ListView(
            // Extra bottom room so the timeline can scroll clear of the
            // floating Mr. K advice card.
            padding: const EdgeInsets.fromLTRB(
              KpSpacing.xl,
              KpSpacing.xl,
              KpSpacing.xl,
              KpSpacing.xxxl + KpSpacing.xxl,
            ),
            children: [
              _DetailHeader(dispute: dispute, onRaise: onRaise),
              const Gap.l(),
              _StatusCard(dispute: dispute),
              if (dispute.timeline.isNotEmpty) ...[
                const Gap.m(),
                _TimelineCard(entries: dispute.timeline),
              ],
            ],
          ),
          const Positioned(
            right: KpSpacing.l,
            bottom: KpSpacing.l,
            child: _MrKAdvice(),
          ),
        ],
      ),
    );
  }
}

class _DetailHeader extends StatelessWidget {
  const _DetailHeader({required this.dispute, this.onRaise});

  final DisputeView dispute;
  final VoidCallback? onRaise;

  // KpButton stretches to its constraints, so give the auto-width design CTA a
  // bounded box rather than letting it fill the header row.
  static const double _raiseButtonWidth = 200;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (dispute.caseNumber != null) ...[
                _CaseNumberChip(caseNumber: dispute.caseNumber!),
                const Gap.s(),
              ],
              Text(
                dispute.title,
                style: context.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
        const Gap.m(horizontal: true),
        SizedBox(
          width: _raiseButtonWidth,
          child: KpButton(
            label: context.l10n.disputesRaise,
            dense: true,
            onPressed: onRaise ?? () {},
          ),
        ),
      ],
    );
  }
}

class _CaseNumberChip extends StatelessWidget {
  const _CaseNumberChip({required this.caseNumber});

  final String caseNumber;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(KpRadii.pill)),
        boxShadow: [BoxShadow(color: KpColors.gold600, offset: Offset(0, 2))],
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: KpSpacing.m,
          vertical: KpSpacing.xxs,
        ),
        decoration: BoxDecoration(
          color: context.colorScheme.secondaryContainer,
          borderRadius: const BorderRadius.all(Radius.circular(KpRadii.pill)),
        ),
        child: Text(
          context.l10n.disputesCaseNumber(caseNumber),
          style: context.textTheme.labelMedium?.copyWith(
            color: context.colorScheme.onSecondaryContainer,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}

/// Candy card decoration for the detail pane (7px flat bottom shadow).
BoxDecoration _detailCard(BuildContext context) => BoxDecoration(
  color: context.colorScheme.surface,
  borderRadius: KpRadii.allXl,
  border: Border.all(color: context.colorScheme.outlineVariant, width: 2),
  boxShadow: [
    BoxShadow(
      color: context.colorScheme.outlineVariant,
      offset: const Offset(0, 7),
    ),
  ],
);

class _StatusCard extends StatelessWidget {
  const _StatusCard({required this.dispute});

  final DisputeView dispute;

  @override
  Widget build(BuildContext context) {
    final investigation = dispute.investigation;
    final draft = dispute.draftNote;
    final resolution = dispute.resolutionNote;
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: _detailCard(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: KpSpacing.xxl,
                height: KpSpacing.xxl,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: context.colorScheme.primary,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.error_rounded,
                  color: context.colorScheme.onPrimary,
                  size: KpSpacing.xl,
                ),
              ),
              const Gap.m(horizontal: true),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.l10n.disputesActiveInvestigation,
                      style: context.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const Gap.xs(),
                    Text(
                      investigation ?? dispute.description,
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (draft != null) ...[
            const Gap.l(),
            _DraftNote(
              title: context.l10n.disputesResolutionDraft,
              body: draft,
            ),
          ],
          if (draft == null && resolution != null) ...[
            const Gap.l(),
            _DraftNote(
              title: context.l10n.disputesResolutionNote,
              body: resolution,
            ),
          ],
        ],
      ),
    );
  }
}

class _DraftNote extends StatelessWidget {
  const _DraftNote({required this.title, required this.body});

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainer,
        borderRadius: KpRadii.allM,
        border: Border(
          left: BorderSide(color: context.colorScheme.primary, width: 4),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: context.textTheme.labelLarge?.copyWith(
              color: context.colorScheme.primary,
              fontWeight: FontWeight.w800,
            ),
          ),
          const Gap.xxs(),
          Text(
            body,
            style: context.textTheme.bodySmall?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}

class _TimelineCard extends StatelessWidget {
  const _TimelineCard({required this.entries});

  final List<DisputeTimelineEntry> entries;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: _detailCard(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.disputesCaseTimeline.toUpperCase(),
            style: context.textTheme.labelMedium?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.5,
            ),
          ),
          const Gap.l(),
          for (var i = 0; i < entries.length; i++)
            _TimelineRow(entry: entries[i], isLast: i == entries.length - 1),
        ],
      ),
    );
  }
}

class _TimelineRow extends StatelessWidget {
  const _TimelineRow({required this.entry, required this.isLast});

  final DisputeTimelineEntry entry;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final pending = entry.state == DisputeTimelineState.pending;
    final dotColor = switch (entry.state) {
      DisputeTimelineState.done => context.colorScheme.primary,
      DisputeTimelineState.active => context.colorScheme.secondaryContainer,
      DisputeTimelineState.pending => context.colorScheme.outlineVariant,
    };
    return Opacity(
      opacity: pending ? 0.5 : 1,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  width: KpSpacing.m,
                  height: KpSpacing.m,
                  decoration: BoxDecoration(
                    color: dotColor,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: context.colorScheme.surface,
                      width: 3,
                    ),
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      color: context.colorScheme.outlineVariant,
                    ),
                  ),
              ],
            ),
            const Gap.m(horizontal: true),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(bottom: isLast ? 0 : KpSpacing.l),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      entry.title,
                      style: context.textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const Gap.xxs(),
                    Text(
                      entry.time,
                      style: context.textTheme.labelSmall?.copyWith(
                        color: context.colorScheme.outline,
                      ),
                    ),
                    if (entry.body != null) ...[
                      const Gap.xxs(),
                      Text(
                        entry.body!,
                        style: context.textTheme.bodySmall?.copyWith(
                          color: context.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MrKAdvice extends StatefulWidget {
  const _MrKAdvice();

  @override
  State<_MrKAdvice> createState() => _MrKAdviceState();
}

class _MrKAdviceState extends State<_MrKAdvice>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 2200),
  )..repeat(reverse: true);

  late final Animation<Offset> _bounce = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(0, -0.06),
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _bounce,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          _bubble(context),
          // Downward speech-bubble tail (design `disputes_hub_tablet`).
          Positioned(
            right: KpSpacing.xl,
            bottom: -KpSpacing.xxs,
            child: Transform.rotate(
              angle: math.pi / 4,
              child: Container(
                width: KpSpacing.s,
                height: KpSpacing.s,
                decoration: BoxDecoration(
                  color: context.colorScheme.surface,
                  border: Border(
                    right: BorderSide(
                      color: context.colorScheme.primary,
                      width: 2,
                    ),
                    bottom: BorderSide(
                      color: context.colorScheme.primary,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bubble(BuildContext context) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: KpRadii.allL,
        border: Border.all(color: context.colorScheme.primary, width: 2),
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.primary,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: KpSpacing.xl,
            height: KpSpacing.xl,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: context.colorScheme.secondaryContainer,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.face_rounded,
              color: context.colorScheme.onSecondaryContainer,
            ),
          ),
          const Gap.s(horizontal: true),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.disputesMrKSays,
                  style: context.textTheme.labelSmall?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const Gap.xxs(),
                Text(
                  kDisputesMascotAdvice,
                  style: context.textTheme.bodySmall?.copyWith(
                    fontStyle: FontStyle.italic,
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
