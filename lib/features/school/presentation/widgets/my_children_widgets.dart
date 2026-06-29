import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/core/widgets/dashed_rrect_painter.dart';
import 'package:keenpockets/core/widgets/kp_network_image.dart';
import 'package:keenpockets/features/school/presentation/children_fixtures.dart';
import 'package:keenpockets/features/school/presentation/view_models/child_view.dart';

/// White candy card with a 2px border and a 7px flat bottom shadow
/// (design `my_children`).
BoxDecoration _childCard(BuildContext context) {
  return BoxDecoration(
    color: context.colorScheme.surface,
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
  );
}

/// Avatar tile colours per child tone (design `my_children`).
({Color bg, Color border}) _toneStyle(BuildContext context, ChildAvatarTone t) {
  return switch (t) {
    ChildAvatarTone.boy => (
      bg: context.colorScheme.secondaryContainer,
      border: KpColors.gold600,
    ),
    ChildAvatarTone.girl => (
      bg: context.colorScheme.errorContainer,
      border: context.colorScheme.error,
    ),
  };
}

/// Filled-bar colour for a term's progress (design `my_children`):
/// fully-paid terms read gold, partially/un-paid read brand blue.
Color _termBarColor(BuildContext context, ChildTermStatus s) {
  return s == ChildTermStatus.paid
      ? KpColors.gold500
      : context.colorScheme.primary;
}

/// Phone "School Fees" list of linked children (design `my_children`).
class MyChildrenPhoneView extends StatelessWidget {
  const MyChildrenPhoneView({
    required this.children,
    this.onLinkChild,
    super.key,
  });

  final List<ChildView> children;
  final VoidCallback? onLinkChild;

  @override
  Widget build(BuildContext context) {
    if (children.isEmpty) {
      return MyChildrenEmptyState(onLinkChild: onLinkChild);
    }
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(
        KpSpacing.m,
        KpSpacing.l,
        KpSpacing.m,
        KpSpacing.xxl,
      ),
      itemCount: children.length,
      separatorBuilder: (_, _) => const Gap.l(),
      itemBuilder: (context, i) => ChildFeeCard(child: children[i]),
    );
  }
}

/// A single child's fee card: avatar, chips, per-term progress and a plan
/// footer (design `my_children`).
class ChildFeeCard extends StatelessWidget {
  const ChildFeeCard({required this.child, super.key});

  final ChildView child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: _childCard(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ChildHeader(child: child),
          const Gap.l(),
          for (var i = 0; i < child.terms.length; i++) ...[
            if (i != 0) const Gap.m(),
            _TermRow(term: child.terms[i]),
          ],
          const Gap.l(),
          _PlanFooter(child: child),
        ],
      ),
    );
  }
}

class _ChildHeader extends StatelessWidget {
  const _ChildHeader({required this.child});

  final ChildView child;

  @override
  Widget build(BuildContext context) {
    final tone = _toneStyle(context, child.tone);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: KpSpacing.xxxl,
          height: KpSpacing.xxxl,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: tone.bg,
            borderRadius: KpRadii.allL,
            border: Border(bottom: BorderSide(color: tone.border, width: 4)),
          ),
          child: Text(child.emoji, style: const TextStyle(fontSize: 34)),
        ),
        const Gap.m(horizontal: true),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                child.name,
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
              const Gap.xs(),
              Wrap(
                spacing: KpSpacing.xs,
                runSpacing: KpSpacing.xs,
                children: [
                  _InfoChip(icon: Icons.school_rounded, label: child.school),
                  _InfoChip(icon: Icons.class_rounded, label: child.className),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.s,
        vertical: KpSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(KpRadii.pill),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: context.colorScheme.onSurfaceVariant),
          const Gap.xxs(horizontal: true),
          Text(
            label,
            style: context.textTheme.labelMedium?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}

class _TermRow extends StatelessWidget {
  const _TermRow({required this.term});

  final ChildTermView term;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              term.label,
              style: context.textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
            const Spacer(),
            Flexible(
              child: Text(
                context.l10n.myChildrenFeeDetail(
                  term.fee.formatShort(),
                  term.paid.formatShort(),
                  term.balance.formatShort(),
                ),
                textAlign: TextAlign.end,
                style: context.textTheme.labelSmall?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ],
        ),
        const Gap.xs(),
        KpProgressBar(
          value: term.percent,
          color: _termBarColor(context, term.status),
        ),
      ],
    );
  }
}

class _PlanFooter extends StatelessWidget {
  const _PlanFooter({required this.child});

  final ChildView child;

  static const double _payWidth = 124;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DottedDivider(color: context.colorScheme.surfaceContainerHighest),
        const Gap.m(),
        Row(
          children: [
            const Icon(
              Icons.event_repeat_rounded,
              color: KpColors.gold600,
              size: 20,
            ),
            const Gap.xs(horizontal: true),
            Expanded(
              child: Text(
                context.l10n.myChildrenPlan(child.planLabel),
                style: context.textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const Gap.s(horizontal: true),
            SizedBox(
              width: _payWidth,
              child: child.isPaidUp
                  ? KpButton(
                      label: context.l10n.myChildrenPaidUp,
                      variant: KpButtonVariant.neutral,
                      dense: true,
                      onPressed: null,
                    )
                  : KpButton(
                      label: context.l10n.myChildrenPayFees,
                      dense: true,
                      onPressed: () {},
                    ),
            ),
          ],
        ),
      ],
    );
  }
}

/// "No children linked!" empty state with Mr. K and a link CTA
/// (design `my_children`).
class MyChildrenEmptyState extends StatelessWidget {
  const MyChildrenEmptyState({this.onLinkChild, super.key});

  final VoidCallback? onLinkChild;

  static const double _ctaWidth = 220;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(KpSpacing.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ClipRRect(
              borderRadius: KpRadii.allXl,
              child: KpNetworkImage(
                url: kChildrenEmptyMascotUrl,
                width: KpSpacing.xxxl + KpSpacing.xxl,
                height: KpSpacing.xxxl + KpSpacing.xxl,
                fit: BoxFit.contain,
              ),
            ),
            const Gap.l(),
            Text(
              context.l10n.myChildrenEmptyTitle,
              style: context.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
            const Gap.xs(),
            Text(
              context.l10n.myChildrenEmptyMessage,
              textAlign: TextAlign.center,
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
            const Gap.l(),
            SizedBox(
              width: _ctaWidth,
              child: KpButton(
                label: context.l10n.myChildrenLinkChild,
                icon: Icons.person_add_rounded,
                onPressed: onLinkChild ?? () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Tablet "My Children" dashboard: a header, a grid of rich child cards plus a
/// "Register Child" card, and a "Smart Savings" banner (design
/// `my_children_tablet`).
class MyChildrenTabletView extends StatelessWidget {
  const MyChildrenTabletView({
    required this.children,
    this.onLinkChild,
    super.key,
  });

  final List<ChildView> children;
  final VoidCallback? onLinkChild;

  static const double _addWidth = 240;
  static const double _threeColBreakpoint = 1040;
  static const double _twoColBreakpoint = 700;

  @override
  Widget build(BuildContext context) {
    if (children.isEmpty) {
      return MyChildrenEmptyState(onLinkChild: onLinkChild);
    }
    return ListView(
      padding: const EdgeInsets.all(KpSpacing.xl),
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.myChildrenHeading,
                    style: context.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const Gap.xxs(),
                  Text(
                    context.l10n.myChildrenSubtitle,
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: context.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            const Gap.l(horizontal: true),
            SizedBox(
              width: _addWidth,
              child: KpButton(
                label: context.l10n.myChildrenAddDependent,
                icon: Icons.person_add_rounded,
                variant: KpButtonVariant.secondary,
                onPressed: onLinkChild ?? () {},
              ),
            ),
          ],
        ),
        const Gap.xl(),
        LayoutBuilder(
          builder: (context, constraints) {
            final w = constraints.maxWidth;
            final columns = w >= _threeColBreakpoint
                ? 3
                : (w >= _twoColBreakpoint ? 2 : 1);
            return _ChildrenGrid(
              columns: columns,
              cards: [
                for (final child in children) ChildTabletCard(child: child),
                _RegisterChildCard(onTap: onLinkChild),
              ],
            );
          },
        ),
        const Gap.xl(),
        SmartSavingsBanner(onStartSaving: onLinkChild),
      ],
    );
  }
}

/// A fixed-column grid that lays cards out in equal-height rows (design
/// `my_children_tablet` bento-grid). Rows stretch so the Register Child card
/// matches the child cards' height.
class _ChildrenGrid extends StatelessWidget {
  const _ChildrenGrid({required this.columns, required this.cards});

  final int columns;
  final List<Widget> cards;

  List<Widget> _rows() {
    final rows = <Widget>[];
    for (var i = 0; i < cards.length; i += columns) {
      final end = (i + columns) <= cards.length ? i + columns : cards.length;
      final rowCards = cards.sublist(i, end);
      if (rows.isNotEmpty) rows.add(const Gap.l());
      rows.add(
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (var j = 0; j < columns; j++) ...[
                if (j != 0) const Gap.l(horizontal: true),
                Expanded(
                  child: j < rowCards.length
                      ? rowCards[j]
                      : const SizedBox.shrink(),
                ),
              ],
            ],
          ),
        ),
      );
    }
    return rows;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: _rows(),
    );
  }
}

/// A rich tablet child card: photo header, fee-progress panel and a status- or
/// receipts-footer depending on whether the child is paid up (design
/// `my_children_tablet`).
class ChildTabletCard extends StatelessWidget {
  const ChildTabletCard({required this.child, super.key});

  final ChildView child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: _childCard(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ChildTabletHeader(child: child),
          const Gap.l(),
          _FeeProgressPanel(child: child),
          const Gap.l(),
          const Spacer(),
          if (child.isPaidUp)
            _PaidUpFooter(child: child)
          else
            _PayFeesFooter(child: child),
        ],
      ),
    );
  }
}

/// Photo avatar + name + school/class rows (design `my_children_tablet`).
class _ChildTabletHeader extends StatelessWidget {
  const _ChildTabletHeader({required this.child});

  final ChildView child;

  static const double _avatar = 80;

  @override
  Widget build(BuildContext context) {
    final tone = _toneStyle(context, child.tone);
    return Row(
      children: [
        Container(
          width: _avatar,
          height: _avatar,
          clipBehavior: Clip.antiAlias,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: tone.bg,
            borderRadius: KpRadii.allL,
            border: Border.all(color: tone.border, width: 2),
          ),
          child: child.avatarUrl != null
              ? KpNetworkImage(
                  url: child.avatarUrl!,
                  width: _avatar,
                  height: _avatar,
                  fit: BoxFit.cover,
                )
              : Text(child.emoji, style: const TextStyle(fontSize: 34)),
        ),
        const Gap.m(horizontal: true),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                child.name,
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
              const Gap.xs(),
              _MetaRow(icon: Icons.school_rounded, text: child.school),
              const Gap.xxs(),
              _MetaRow(icon: Icons.grade_rounded, text: child.className),
            ],
          ),
        ),
      ],
    );
  }
}

class _MetaRow extends StatelessWidget {
  const _MetaRow({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: context.colorScheme.onSurfaceVariant),
        const Gap.xs(horizontal: true),
        Flexible(
          child: Text(
            text,
            style: context.textTheme.labelMedium?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    );
  }
}

/// The bordered "Fee Progress" panel; switches to a paid-up treatment (success
/// tint + verified badge) when the child is fully paid (design `my_children_tablet`).
class _FeeProgressPanel extends StatelessWidget {
  const _FeeProgressPanel({required this.child});

  final ChildView child;

  @override
  Widget build(BuildContext context) {
    final paidUp = child.isPaidUp;
    return Container(
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: BoxDecoration(
        color: paidUp
            ? context.colors.successContainer.withValues(alpha: 0.3)
            : context.colorScheme.surfaceContainerLow,
        borderRadius: KpRadii.allL,
        border: Border.all(
          color: paidUp
              ? context.colorScheme.primary.withValues(alpha: 0.2)
              : context.colorScheme.surfaceContainerHighest,
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  context.l10n.myChildrenFeeProgress.toUpperCase(),
                  style: context.textTheme.labelSmall?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              _PlanPill(label: child.planLabel, paidUp: paidUp),
            ],
          ),
          const Gap.m(),
          _SegmentBar(child: child),
          const Gap.m(),
          if (paidUp)
            _PaidUpBadge(child: child)
          else
            for (final term in child.terms) ...[
              _StatusRow(term: term),
              if (term != child.terms.last) const Gap.s(),
            ],
        ],
      ),
    );
  }
}

/// Plan pill: tinted "30/30/40 PLAN" normally, solid gold "FULL PAYMENT" when
/// paid up (design `my_children_tablet`).
class _PlanPill extends StatelessWidget {
  const _PlanPill({required this.label, required this.paidUp});

  final String label;
  final bool paidUp;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.s,
        vertical: KpSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: paidUp
            ? context.colorScheme.onSecondaryContainer
            : context.colorScheme.primaryContainer.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(KpRadii.pill),
      ),
      child: Text(
        label.toUpperCase(),
        style: context.textTheme.labelSmall?.copyWith(
          color: paidUp
              ? context.colorScheme.onPrimary
              : context.colorScheme.onPrimaryContainer,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

/// The segmented term bar; pads paid-up plans to three ghosted segments
/// (design `my_children_tablet`).
class _SegmentBar extends StatelessWidget {
  const _SegmentBar({required this.child});

  final ChildView child;

  /// Paid-up plans show one solid + two ghosted segments; otherwise one segment
  /// per term coloured by its status.
  List<Color> _segments(BuildContext context) {
    if (child.isPaidUp) {
      final ghost = context.colorScheme.primary.withValues(alpha: 0.3);
      return [context.colorScheme.primary, ghost, ghost];
    }
    return [
      for (final term in child.terms)
        switch (term.status) {
          ChildTermStatus.paid => context.colorScheme.primary,
          ChildTermStatus.partial => KpColors.gold500,
          ChildTermStatus.unpaid => context.colorScheme.surfaceContainerHighest,
        },
    ];
  }

  @override
  Widget build(BuildContext context) {
    final segments = _segments(context);
    return Row(
      children: [
        for (var i = 0; i < segments.length; i++) ...[
          if (i != 0) const Gap.xs(horizontal: true),
          Expanded(
            child: Container(
              height: KpSpacing.m,
              decoration: BoxDecoration(
                color: segments[i],
                borderRadius: BorderRadius.circular(KpRadii.pill),
              ),
            ),
          ),
        ],
      ],
    );
  }
}

/// "TERM 1 PAID UP" verified badge for a fully-paid child (design `my_children_tablet`).
class _PaidUpBadge extends StatelessWidget {
  const _PaidUpBadge({required this.child});

  final ChildView child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: BoxDecoration(
        color: context.colorScheme.surface.withValues(alpha: 0.5),
        borderRadius: KpRadii.allM,
        border: Border.all(
          color: context.colorScheme.primary.withValues(alpha: 0.2),
          width: 2,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.verified_rounded,
            color: context.colorScheme.primary,
            size: 32,
          ),
          const Gap.s(horizontal: true),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                context.l10n
                    .myChildrenPaidUpStatus(child.terms.first.label)
                    .toUpperCase(),
                style: context.textTheme.labelLarge?.copyWith(
                  color: context.colorScheme.onPrimaryContainer,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                context.l10n.myChildrenNextInvoice(child.nextInvoiceDays),
                style: context.textTheme.labelSmall?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatusRow extends StatelessWidget {
  const _StatusRow({required this.term});

  final ChildTermView term;

  @override
  Widget build(BuildContext context) {
    final (IconData icon, Color color, String label) = switch (term.status) {
      ChildTermStatus.paid => (
        Icons.check_circle_rounded,
        context.colorScheme.primary,
        context.l10n.myChildrenStatusPaid,
      ),
      ChildTermStatus.partial => (
        Icons.pending_rounded,
        KpColors.gold600,
        context.l10n.myChildrenStatusPartial,
      ),
      ChildTermStatus.unpaid => (
        Icons.circle_outlined,
        context.colorScheme.outline,
        context.l10n.myChildrenStatusUnpaid,
      ),
    };
    return Row(
      children: [
        Icon(icon, color: color, size: 20),
        const Gap.xs(horizontal: true),
        Expanded(
          child: Text(
            term.label,
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Text(
          label,
          style: context.textTheme.labelMedium?.copyWith(
            color: color,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}

/// Active-child footer: current-term balance + a bright-blue "Pay Fees Now"
/// candy button (design `my_children_tablet`).
class _PayFeesFooter extends StatelessWidget {
  const _PayFeesFooter({required this.child});

  final ChildView child;

  @override
  Widget build(BuildContext context) {
    final currentTerm = child.terms.firstWhere(
      (t) => t.status != ChildTermStatus.paid,
      orElse: () => child.terms.last,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DottedDivider(color: context.colorScheme.surfaceContainerHighest),
        const Gap.m(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.myChildrenCurrentTermBalance,
                    style: context.textTheme.labelSmall?.copyWith(
                      color: context.colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const Gap.xxs(),
                  Text(
                    currentTerm.balance.format(),
                    style: context.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.payments_rounded,
              color: context.colorScheme.primary,
              size: 32,
            ),
          ],
        ),
        const Gap.m(),
        _PayFeesNowButton(onPressed: () {}),
      ],
    );
  }
}

/// Paid-up footer: a "View Receipts" tile and an "Account Statement" ghost
/// button (design `my_children_tablet`).
class _PaidUpFooter extends StatelessWidget {
  const _PaidUpFooter({required this.child});

  final ChildView child;

  static const double _iconCircle = 40;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DottedDivider(color: context.colorScheme.surfaceContainerHighest),
        const Gap.m(),
        Container(
          padding: const EdgeInsets.all(KpSpacing.m),
          decoration: BoxDecoration(
            color: context.colorScheme.surfaceContainerHigh,
            borderRadius: KpRadii.allM,
          ),
          child: Row(
            children: [
              Container(
                width: _iconCircle,
                height: _iconCircle,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: context.colorScheme.surface,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.receipt_long_rounded,
                  color: context.colorScheme.primary,
                ),
              ),
              const Gap.s(horizontal: true),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.l10n.myChildrenViewReceipts,
                      style: context.textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      context.l10n.myChildrenDocumentsFound(child.receiptCount),
                      style: context.textTheme.labelSmall?.copyWith(
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right_rounded,
                color: context.colorScheme.onSurfaceVariant,
              ),
            ],
          ),
        ),
        const Gap.m(),
        _GhostButton(
          label: context.l10n.myChildrenAccountStatement,
          onPressed: () {},
        ),
      ],
    );
  }
}

/// Bright-blue candy CTA with dark text (design `bg-primary-container
/// text-on-primary-container border-shadow-primary`).
class _PayFeesNowButton extends StatelessWidget {
  const _PayFeesNowButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final fg = context.colorScheme.onPrimaryContainer;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colorScheme.primary,
        borderRadius: KpRadii.allM,
        border: Border(bottom: BorderSide(color: fg, width: 4)),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onPressed,
          borderRadius: KpRadii.allM,
          child: Padding(
            padding: const EdgeInsets.all(KpSpacing.m),
            child: Text(
              context.l10n.myChildrenPayFeesNow,
              textAlign: TextAlign.center,
              style: context.textTheme.labelLarge?.copyWith(
                color: fg,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Flat 2px-outlined secondary button (design `border-2 border-outline-variant`).
class _GhostButton extends StatelessWidget {
  const _GhostButton({required this.label, required this.onPressed});

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: KpRadii.allM,
        border: Border.all(
          color: context.colorScheme.surfaceContainerHighest,
          width: 2,
        ),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onPressed,
          borderRadius: KpRadii.allM,
          child: Padding(
            padding: const EdgeInsets.all(KpSpacing.m),
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: context.textTheme.labelLarge?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Dashed "Register Child" add card in the grid (design `my_children_tablet`).
class _RegisterChildCard extends StatelessWidget {
  const _RegisterChildCard({this.onTap});

  final VoidCallback? onTap;

  static const double _circle = 80;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: DashedRRectPainter(
        color: context.colorScheme.surfaceContainerHighest,
        radius: KpRadii.xl,
        strokeWidth: 4,
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onTap,
          borderRadius: KpRadii.allXl,
          child: Padding(
            padding: const EdgeInsets.all(KpSpacing.xl),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: _circle,
                  height: _circle,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: context.colorScheme.surfaceContainerHigh,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.add_rounded,
                    size: KpSpacing.xxl,
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
                const Gap.m(),
                Text(
                  context.l10n.myChildrenRegisterChild,
                  style: context.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const Gap.xs(),
                Text(
                  context.l10n.myChildrenRegisterChildBody,
                  textAlign: TextAlign.center,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// "Smart Savings" promo banner: a tall image with a primary gradient, a pill,
/// headline, body and a gold CTA (design `my_children_tablet`).
class SmartSavingsBanner extends StatelessWidget {
  const SmartSavingsBanner({this.onStartSaving, super.key});

  final VoidCallback? onStartSaving;

  static const double _minHeight = 360;
  static const double _ctaWidth = 220;
  static const double _textWidth = 420;

  @override
  Widget build(BuildContext context) {
    final onPrimary = context.colorScheme.onPrimary;
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: KpRadii.allXl,
        border: Border(
          bottom: BorderSide(
            color: context.colorScheme.outlineVariant,
            width: 7,
          ),
        ),
      ),
      child: Stack(
        children: [
          const Positioned.fill(
            child: KpNetworkImage(
              url: kChildrenSmartSavingsUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    KpColors.brand800.withValues(alpha: 0.85),
                    KpColors.brand800.withValues(alpha: 0.0),
                  ],
                ),
              ),
            ),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(minHeight: _minHeight),
            child: Padding(
              padding: const EdgeInsets.all(KpSpacing.xl),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: KpSpacing.m,
                      vertical: KpSpacing.xxs,
                    ),
                    decoration: BoxDecoration(
                      color: onPrimary.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(KpRadii.pill),
                    ),
                    child: Text(
                      context.l10n.myChildrenSmartSavings.toUpperCase(),
                      style: context.textTheme.labelSmall?.copyWith(
                        color: onPrimary,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  const Gap.m(),
                  SizedBox(
                    width: _textWidth,
                    child: Text(
                      context.l10n.myChildrenSmartSavingsTitle,
                      style: context.textTheme.headlineMedium?.copyWith(
                        color: onPrimary,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  const Gap.s(),
                  SizedBox(
                    width: _textWidth,
                    child: Text(
                      context.l10n.myChildrenLockInMessage,
                      style: context.textTheme.bodyLarge?.copyWith(
                        color: onPrimary.withValues(alpha: 0.9),
                      ),
                    ),
                  ),
                  const Gap.l(),
                  SizedBox(
                    width: _ctaWidth,
                    child: KpButton(
                      label: context.l10n.myChildrenStartSaving,
                      variant: KpButtonVariant.secondary,
                      onPressed: onStartSaving ?? () {},
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

/// A dashed horizontal divider (design `my_children` plan separator).
class DottedDivider extends StatelessWidget {
  const DottedDivider({required this.color, super.key});

  final Color color;

  static const double _thickness = 2;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _thickness,
      width: double.infinity,
      child: CustomPaint(painter: _DashedLinePainter(color)),
    );
  }
}

class _DashedLinePainter extends CustomPainter {
  const _DashedLinePainter(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    const dash = 6.0;
    const gap = 5.0;
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2;
    var x = 0.0;
    while (x < size.width) {
      canvas.drawLine(Offset(x, 0), Offset(x + dash, 0), paint);
      x += dash + gap;
    }
  }

  @override
  bool shouldRepaint(_DashedLinePainter oldDelegate) =>
      oldDelegate.color != color;
}
