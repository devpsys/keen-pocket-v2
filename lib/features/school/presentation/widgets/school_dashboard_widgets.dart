import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/core/widgets/kp_network_image.dart';
import 'package:keenpockets/features/school/presentation/school_fixtures.dart';
import 'package:keenpockets/features/school/presentation/view_models/school_view.dart';

/// Accent colours for a term card / trend bar (design `school_dashboard_owner`).
({Color amount, Color icon, Color iconBg, Color bar}) schoolAccentStyle(
  BuildContext context,
  SchoolAccent accent,
) {
  return switch (accent) {
    SchoolAccent.primary => (
      amount: context.colorScheme.primary,
      icon: context.colorScheme.primary,
      iconBg: context.colorScheme.primaryContainer.withValues(alpha: 0.25),
      bar: context.colorScheme.primary,
    ),
    SchoolAccent.primaryDark => (
      amount: KpColors.brand800,
      icon: KpColors.brand800,
      iconBg: context.colorScheme.primary.withValues(alpha: 0.18),
      bar: KpColors.brand800,
    ),
    SchoolAccent.secondary => (
      amount: KpColors.gold600,
      icon: KpColors.gold600,
      iconBg: context.colorScheme.secondaryContainer.withValues(alpha: 0.3),
      bar: context.colorScheme.secondaryContainer,
    ),
    SchoolAccent.neutral => (
      amount: context.colorScheme.onSurfaceVariant,
      icon: context.colorScheme.onSurfaceVariant,
      iconBg: context.colorScheme.surfaceContainerHighest,
      bar: context.colorScheme.surfaceContainerHighest,
    ),
  };
}

/// White card with a 7px coloured bottom border (design `school_dashboard_owner`).
///
/// The phone design's `candy-shadow` is `#e0e3e5` (surfaceContainerHighest); the
/// tablet's `candy-shadow-card` is `#bdc8d2` (outline-variant) — pass [shadow]
/// to override per breakpoint.
BoxDecoration schoolDashCard(BuildContext context, {Color? bg, Color? shadow}) {
  return BoxDecoration(
    color: bg ?? context.colorScheme.surface,
    borderRadius: KpRadii.allXl,
    border: Border(
      bottom: BorderSide(
        color: shadow ?? context.colorScheme.surfaceContainerHighest,
        width: 7,
      ),
    ),
  );
}

/// Phone owner dashboard (design `school_dashboard_owner`).
class SchoolDashboardView extends StatelessWidget {
  const SchoolDashboardView({
    required this.school,
    this.onRecordFees,
    super.key,
  });

  final SchoolView school;
  final VoidCallback? onRecordFees;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(
        KpSpacing.m,
        KpSpacing.l,
        KpSpacing.m,
        KpSpacing.xxl,
      ),
      children: [
        for (final term in school.terms) ...[
          SchoolTermCard(term: term),
          const Gap.l(),
        ],
        SchoolRecordFeesCard(onQuickEntry: onRecordFees),
        const Gap.l(),
        SchoolTrendCard(trend: school.trend),
        const Gap.l(),
        SchoolOwnerCard(percent: school.overallPercent),
      ],
    );
  }
}

/// A term collection summary card (design `school_dashboard_owner`).
class SchoolTermCard extends StatelessWidget {
  const SchoolTermCard({required this.term, super.key});

  final SchoolTermView term;

  @override
  Widget build(BuildContext context) {
    final style = schoolAccentStyle(context, term.accent);
    final pct = (term.percent * 100).round();
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: schoolDashCard(context),
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
                      term.label,
                      style: context.textTheme.labelLarge?.copyWith(
                        color: context.colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const Gap.xxs(),
                    Text(
                      term.collected.format(),
                      style: context.textTheme.headlineSmall?.copyWith(
                        color: style.amount,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(KpSpacing.s),
                decoration: BoxDecoration(
                  color: style.iconBg,
                  borderRadius: KpRadii.allM,
                ),
                child: Icon(
                  term.accent == SchoolAccent.secondary
                      ? Icons.account_balance_rounded
                      : Icons.payments_rounded,
                  color: style.icon,
                ),
              ),
            ],
          ),
          const Gap.m(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n.schoolExpected(term.expected.formatShort()),
                style: context.textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                '$pct%',
                style: context.textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const Gap.xs(),
          KpProgressBar(value: term.percent, color: style.bar),
        ],
      ),
    );
  }
}

/// "Record Fees" quick-action card (design `school_dashboard_owner`).
class SchoolRecordFeesCard extends StatelessWidget {
  const SchoolRecordFeesCard({this.onQuickEntry, super.key});

  final VoidCallback? onQuickEntry;

  @override
  Widget build(BuildContext context) {
    final onPrimary = context.colorScheme.onPrimary;
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: BoxDecoration(
        color: context.colorScheme.primary,
        borderRadius: KpRadii.allXl,
        border: Border(
          bottom: BorderSide(
            color: context.colorScheme.onPrimaryContainer,
            width: 7,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(KpSpacing.s),
                decoration: BoxDecoration(
                  color: onPrimary.withValues(alpha: 0.2),
                  borderRadius: KpRadii.allM,
                ),
                child: Icon(Icons.add_card_rounded, color: onPrimary),
              ),
              const Gap.m(horizontal: true),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.l10n.schoolRecordFees,
                      style: context.textTheme.titleLarge?.copyWith(
                        color: onPrimary,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      context.l10n.schoolNewPaymentEntry,
                      style: context.textTheme.bodySmall?.copyWith(
                        color: onPrimary.withValues(alpha: 0.9),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Gap.m(),
          KpButton(
            label: context.l10n.schoolQuickEntry,
            variant: KpButtonVariant.secondary,
            onPressed: onQuickEntry ?? () {},
          ),
        ],
      ),
    );
  }
}

/// "Collection Trend" bar chart card (design `school_dashboard_owner`).
class SchoolTrendCard extends StatelessWidget {
  const SchoolTrendCard({required this.trend, super.key});

  final List<SchoolTrendBar> trend;

  static const double _chartHeight = 180;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: schoolDashCard(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.insights_rounded, color: context.colorScheme.primary),
              const Gap.s(horizontal: true),
              Text(
                context.l10n.schoolCollectionTrend,
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const Gap.l(),
          SizedBox(
            height: _chartHeight,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (var i = 0; i < trend.length; i++) ...[
                  if (i != 0) const Gap.m(horizontal: true),
                  Expanded(child: _Bar(bar: trend[i])),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Bar extends StatelessWidget {
  const _Bar({required this.bar});

  final SchoolTrendBar bar;

  @override
  Widget build(BuildContext context) {
    final style = schoolAccentStyle(context, bar.accent);
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: FractionallySizedBox(
            heightFactor: bar.fraction.clamp(0.05, 1),
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                color: style.iconBg,
                borderRadius: const BorderRadius.vertical(top: KpRadii.radiusM),
              ),
            ),
          ),
        ),
        const Gap.s(),
        Text(
          bar.label,
          style: context.textTheme.labelSmall?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}

/// "Great work, Owner!" mascot card (design `school_dashboard_owner`).
class SchoolOwnerCard extends StatelessWidget {
  const SchoolOwnerCard({required this.percent, super.key});

  final double percent;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: schoolDashCard(context),
      child: Column(
        children: [
          const ClipRRect(
            borderRadius: KpRadii.allL,
            child: KpNetworkImage(
              url: kSchoolMascotUrl,
              width: KpSpacing.xxxl + KpSpacing.xxl,
              height: KpSpacing.xxxl + KpSpacing.xxl,
              fit: BoxFit.cover,
            ),
          ),
          const Gap.m(),
          Text(
            context.l10n.schoolGreatWork,
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
          const Gap.xs(),
          Text(
            context.l10n.schoolOwnerProgress((percent * 100).round()),
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

/// Tablet owner dashboard (design `school_dashboard_owner_tablet`): a 12-column
/// candy "bento" grid — hero + action centre, parallel term collections, a
/// collection-trend chart with stat tiles, and an integrated-view banner.
class SchoolDashboardTabletView extends StatelessWidget {
  const SchoolDashboardTabletView({
    required this.school,
    this.onRecordFees,
    super.key,
  });

  final SchoolView school;
  final VoidCallback? onRecordFees;

  static const double _maxWidth = 1200;

  @override
  Widget build(BuildContext context) {
    final terms = school.terms;
    return ListView(
      padding: const EdgeInsets.all(KpSpacing.xl),
      children: [
        Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: _maxWidth),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Hero bento section: mascot welcome (8) + action centre (4).
                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        flex: 8,
                        child: _HeroMascotCard(percent: school.overallPercent),
                      ),
                      const Gap.l(horizontal: true),
                      Expanded(
                        flex: 4,
                        child: _ActionCentreCard(onQuickEntry: onRecordFees),
                      ),
                    ],
                  ),
                ),
                const Gap.l(),
                // Parallel collections overview.
                if (terms.isNotEmpty)
                  IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        for (var i = 0; i < terms.length; i++) ...[
                          if (i != 0) const Gap.l(horizontal: true),
                          Expanded(
                            child: _CollectionTermCard(
                              term: terms[i],
                              active: i == 0,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                const Gap.l(),
                // Insights: trend chart (8) + stat tiles (4).
                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        flex: 8,
                        child: _TrendChartCard(trend: school.trend),
                      ),
                      const Gap.l(horizontal: true),
                      Expanded(
                        flex: 4,
                        child: Column(
                          children: [
                            Expanded(
                              child: _StatTile(
                                icon: Icons.account_balance_rounded,
                                color: KpColors.brand800,
                                label: context.l10n.schoolNetSurplus,
                                amount: school.feesCollected.formatShort(),
                              ),
                            ),
                            const Gap.l(),
                            Expanded(
                              child: _StatTile(
                                icon: Icons.pending_actions_rounded,
                                color: KpColors.gold600,
                                label: context.l10n.schoolUnpaidFees,
                                amount: school.unpaidFees.formatShort(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap.l(),
                const _IntegratedViewBanner(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// Hero "Great work, Owner!" card with a yearly-progress callout and Mr. K.
class _HeroMascotCard extends StatelessWidget {
  const _HeroMascotCard({required this.percent});

  final double percent;

  static const double _mascotSize = 150;

  @override
  Widget build(BuildContext context) {
    final pct = (percent * 100).round();
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: schoolDashCard(
        context,
        shadow: context.colorScheme.outlineVariant,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.schoolGreatWork,
                  style: context.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const Gap.xs(),
                Text(
                  context.l10n.schoolHeroBody,
                  style: context.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
                const Gap.l(),
                Container(
                  padding: const EdgeInsets.all(KpSpacing.l),
                  decoration: BoxDecoration(
                    color: context.colorScheme.surfaceContainer,
                    borderRadius: KpRadii.allL,
                    border: const Border(
                      // Design `border-primary` (#006590) → on-brand dark blue.
                      left: BorderSide(color: KpColors.brand800, width: 8),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            context.l10n.schoolYearlyProgress,
                            style: context.textTheme.labelLarge?.copyWith(
                              color: KpColors.brand800,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Text(
                            '$pct%',
                            style: context.textTheme.headlineSmall?.copyWith(
                              color: KpColors.brand800,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                      const Gap.s(),
                      KpProgressBar(value: percent),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Gap.m(horizontal: true),
          const KpNetworkImage(
            url: kSchoolHeroMascotUrl,
            width: _mascotSize,
            height: _mascotSize,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}

/// "Record Fees" action-centre card with a quick-entry CTA.
class _ActionCentreCard extends StatelessWidget {
  const _ActionCentreCard({this.onQuickEntry});

  final VoidCallback? onQuickEntry;

  static const double _iconTile = 56;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: BoxDecoration(
        color: context.colorScheme.primary.withValues(alpha: 0.1),
        borderRadius: KpRadii.allXl,
        border: Border(
          bottom: BorderSide(
            color: context.colorScheme.outlineVariant,
            width: 7,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: _iconTile,
            height: _iconTile,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: context.colorScheme.primary,
              borderRadius: KpRadii.allL,
              border: Border(
                bottom: BorderSide(
                  color: context.colorScheme.onPrimaryContainer,
                  width: 4,
                ),
              ),
            ),
            child: Icon(
              Icons.receipt_long_rounded,
              color: context.colorScheme.onPrimaryContainer,
              size: KpSpacing.xl,
            ),
          ),
          const Gap.m(),
          Text(
            context.l10n.schoolRecordFees,
            style: context.textTheme.titleLarge?.copyWith(
              color: context.colorScheme.onPrimaryContainer,
              fontWeight: FontWeight.w800,
            ),
          ),
          const Gap.xs(),
          Text(
            context.l10n.schoolRecordFeesBody,
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w400,
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
          const Gap.l(),
          const Spacer(),
          _DarkCandyButton(
            label: context.l10n.schoolQuickEntry,
            icon: Icons.send_rounded,
            onPressed: onQuickEntry ?? () {},
          ),
        ],
      ),
    );
  }
}

/// "Admin Profile / SCHOOL OWNER" app-bar cluster with a primary-bordered
/// avatar (design `school_dashboard_owner_tablet` top bar).
class SchoolOwnerBadge extends StatelessWidget {
  const SchoolOwnerBadge({super.key});

  static const double _avatar = 32;
  static const double _ring = 2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 1,
          height: KpSpacing.xl,
          color: context.colorScheme.outlineVariant,
        ),
        const Gap.m(horizontal: true),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              context.l10n.schoolAdminProfile,
              style: context.textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              context.l10n.schoolOwnerRole.toUpperCase(),
              style: context.textTheme.labelSmall?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
        const Gap.s(horizontal: true),
        Container(
          padding: const EdgeInsets.all(_ring),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: context.colorScheme.primary,
              width: _ring,
            ),
          ),
          child: const ClipOval(
            child: KpNetworkImage(
              url: kSchoolAdminAvatarUrl,
              width: _avatar,
              height: _avatar,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}

/// Dashboard FAB (design `school_dashboard_owner_tablet`): a deep-blue candy
/// square (`bg-primary` → `brand800`) with a 4px `candy-shadow-primary` depth.
class SchoolDashboardFab extends StatelessWidget {
  const SchoolDashboardFab({required this.onPressed, super.key});

  final VoidCallback onPressed;

  static const double _size = 56;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: KpColors.brand800,
        borderRadius: KpRadii.allL,
        border: const Border(
          bottom: BorderSide(color: KpColors.brand900, width: 4),
        ),
        boxShadow: [
          BoxShadow(
            color: KpColors.brand900.withValues(alpha: 0.3),
            blurRadius: KpSpacing.s,
            offset: const Offset(0, KpSpacing.xxs),
          ),
        ],
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onPressed,
          borderRadius: KpRadii.allL,
          child: SizedBox(
            width: _size,
            height: _size,
            child: Icon(
              Icons.add_rounded,
              color: context.colorScheme.onPrimary,
              size: KpSpacing.xl,
            ),
          ),
        ),
      ),
    );
  }
}

/// Dark-blue candy CTA (design `bg-primary` button = on-brand `brand800`), used
/// where the design wants a deep-blue action on a light-blue card.
class _DarkCandyButton extends StatelessWidget {
  const _DarkCandyButton({
    required this.label,
    required this.onPressed,
    this.icon,
  });

  final String label;
  final IconData? icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final fg = context.colorScheme.onPrimary;
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: KpColors.brand800,
        borderRadius: KpRadii.allM,
        border: Border(bottom: BorderSide(color: KpColors.brand900, width: 4)),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onPressed,
          borderRadius: KpRadii.allM,
          child: Padding(
            padding: const EdgeInsets.all(KpSpacing.m),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) ...[
                  Icon(icon, size: KpSpacing.l, color: fg),
                  const Gap.xs(horizontal: true),
                ],
                Text(
                  label,
                  style: context.textTheme.labelLarge?.copyWith(
                    color: fg,
                    fontWeight: FontWeight.w800,
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

/// A term collection bento card with a status pill, collected/target figures,
/// a progress track and a contextual CTA (design `school_dashboard_owner_tablet`).
class _CollectionTermCard extends StatelessWidget {
  const _CollectionTermCard({required this.term, required this.active});

  final SchoolTermView term;
  final bool active;

  @override
  Widget build(BuildContext context) {
    final pct = (term.percent * 100).round();
    final cycle = active
        ? context.l10n.schoolActiveCycle
        : context.l10n.schoolUpcomingCycle;
    final cta = active
        ? context.l10n.schoolViewReport
        : context.l10n.schoolManageEnrollments;
    final amountColor = active ? context.colorScheme.primary : KpColors.gold600;
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: schoolDashCard(
        context,
        shadow: context.colorScheme.outlineVariant,
      ),
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
                      cycle.toUpperCase(),
                      style: context.textTheme.labelSmall?.copyWith(
                        color: context.colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const Gap.xxs(),
                    Text(
                      term.label,
                      style: context.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
              _CompletePill(percent: pct, active: active),
            ],
          ),
          const Gap.l(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.l10n.schoolCollected,
                      style: _figureLabel(context),
                    ),
                    const Gap.xxs(),
                    Text(
                      term.collected.formatShort(),
                      style: context.textTheme.headlineMedium?.copyWith(
                        color: amountColor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(context.l10n.schoolTarget, style: _figureLabel(context)),
                  const Gap.xxs(),
                  Text(
                    term.expected.formatShort(),
                    style: context.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Gap.m(),
          _TrackBar(
            value: term.percent,
            fill: active ? KpColors.gold600 : context.colorScheme.secondary,
            track: active
                ? context.colors.successContainer
                : context.colorScheme.surfaceContainer,
          ),
          const Gap.m(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                cta,
                style: context.textTheme.labelLarge?.copyWith(
                  color: context.colorScheme.primary,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const Gap.xxs(horizontal: true),
              Icon(
                Icons.arrow_forward_rounded,
                size: KpSpacing.m,
                color: context.colorScheme.primary,
              ),
            ],
          ),
        ],
      ),
    );
  }

  TextStyle? _figureLabel(BuildContext context) =>
      context.textTheme.labelSmall?.copyWith(
        color: context.colorScheme.onSurfaceVariant,
        fontWeight: FontWeight.w800,
        letterSpacing: 0.5,
      );
}

/// "85% COMPLETE" status pill — green for the active cycle, grey otherwise.
class _CompletePill extends StatelessWidget {
  const _CompletePill({required this.percent, required this.active});

  final int percent;
  final bool active;

  @override
  Widget build(BuildContext context) {
    final bg = active
        ? context.colors.successContainer
        : context.colorScheme.surfaceContainer;
    final fg = active
        ? context.colors.success
        : context.colorScheme.onSurfaceVariant;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.s,
        vertical: KpSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(KpRadii.pill),
      ),
      child: Text(
        context.l10n.schoolPercentComplete(percent),
        style: context.textTheme.labelSmall?.copyWith(
          color: fg,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

/// A recessed progress bar with caller-controlled fill + track colours.
class _TrackBar extends StatelessWidget {
  const _TrackBar({
    required this.value,
    required this.fill,
    required this.track,
  });

  final double value;
  final Color fill;
  final Color track;

  static const double _height = 16;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(KpRadii.pill),
      child: Stack(
        children: [
          Container(height: _height, color: track),
          FractionallySizedBox(
            widthFactor: value.clamp(0.0, 1.0),
            child: Container(
              height: _height,
              decoration: BoxDecoration(
                color: fill,
                borderRadius: BorderRadius.circular(KpRadii.pill),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// "Collection Trend" candy bar chart with an academic-year selector.
class _TrendChartCard extends StatelessWidget {
  const _TrendChartCard({required this.trend});

  final List<SchoolTrendBar> trend;

  static const double _chartHeight = 220;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: schoolDashCard(
        context,
        shadow: context.colorScheme.outlineVariant,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  context.l10n.schoolCollectionTrend,
                  style: context.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: KpSpacing.m,
                  vertical: KpSpacing.xs,
                ),
                decoration: BoxDecoration(
                  color: context.colorScheme.surfaceContainer,
                  borderRadius: KpRadii.allM,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      context.l10n.schoolAcademicYear,
                      style: context.textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Icon(
                      Icons.arrow_drop_down_rounded,
                      color: context.colorScheme.onSurfaceVariant,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Gap.l(),
          SizedBox(
            height: _chartHeight,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (final bar in trend) Expanded(child: _ChartBar(bar: bar)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ChartBar extends StatelessWidget {
  const _ChartBar({required this.bar});

  final SchoolTrendBar bar;

  /// Fraction of the bar filled solid; the remaining top reads as a faint cap.
  static const double _fillRatio = 0.8;

  @override
  Widget build(BuildContext context) {
    final highlighted = bar.accent == SchoolAccent.secondary;
    final (Color fill, Color track) = switch (bar.accent) {
      SchoolAccent.secondary => (
        context.colorScheme.secondaryContainer,
        context.colorScheme.secondaryContainer.withValues(alpha: 0.2),
      ),
      SchoolAccent.primaryDark => (
        KpColors.brand800,
        context.colorScheme.primary.withValues(alpha: 0.18),
      ),
      _ => (
        context.colorScheme.primary,
        context.colorScheme.primary.withValues(alpha: 0.18),
      ),
    };
    return Column(
      children: [
        // The bar's overall height is `fraction` of the chart; inside it a solid
        // fill sits over a small faint cap (design `school_dashboard_owner_tablet`).
        Expanded(
          child: FractionallySizedBox(
            heightFactor: bar.fraction.clamp(0.08, 1),
            widthFactor: 1,
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: KpSpacing.xl),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: track,
                  borderRadius: const BorderRadius.vertical(
                    top: KpRadii.radiusL,
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: FractionallySizedBox(
                    heightFactor: _fillRatio,
                    widthFactor: 1,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: fill,
                        borderRadius: const BorderRadius.vertical(
                          top: KpRadii.radiusL,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const Gap.s(),
        Text(
          bar.label,
          style: context.textTheme.labelSmall?.copyWith(
            color: highlighted
                ? context.colorScheme.primary
                : context.colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}

/// A centred stat tile (Net Surplus / Unpaid Fees).
class _StatTile extends StatelessWidget {
  const _StatTile({
    required this.icon,
    required this.color,
    required this.label,
    required this.amount,
  });

  final IconData icon;
  final Color color;
  final String label;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: KpSpacing.l),
      decoration: schoolDashCard(
        context,
        shadow: context.colorScheme.outlineVariant,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: KpSpacing.xl),
          const Gap.s(),
          Text(
            label.toUpperCase(),
            style: context.textTheme.labelSmall?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.5,
            ),
          ),
          const Gap.xxs(),
          Text(
            amount,
            style: context.textTheme.headlineMedium?.copyWith(
              color: color,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}

/// "Integrated School View" image banner with a primary gradient wash.
class _IntegratedViewBanner extends StatelessWidget {
  const _IntegratedViewBanner();

  static const double _height = 160;
  static const double _textWidth = 320;

  @override
  Widget build(BuildContext context) {
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
            child: KpNetworkImage(url: kSchoolBannerUrl, fit: BoxFit.cover),
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  // Design `from-primary/80 to-transparent` (#006590 → brand800).
                  colors: [
                    KpColors.brand800.withValues(alpha: 0.8),
                    KpColors.brand800.withValues(alpha: 0.0),
                  ],
                ),
              ),
            ),
          ),
          // The text column drives the banner height (≥ _height).
          ConstrainedBox(
            constraints: const BoxConstraints(minHeight: _height),
            child: Padding(
              padding: const EdgeInsets.all(KpSpacing.l),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.schoolIntegratedView,
                    style: context.textTheme.titleLarge?.copyWith(
                      color: context.colorScheme.onPrimary,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const Gap.xs(),
                  SizedBox(
                    width: _textWidth,
                    child: Text(
                      context.l10n.schoolIntegratedViewBody,
                      style: context.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: context.colorScheme.onPrimary.withValues(
                          alpha: 0.9,
                        ),
                      ),
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
