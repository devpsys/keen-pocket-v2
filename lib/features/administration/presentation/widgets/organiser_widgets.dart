import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/core/widgets/dashed_rrect_painter.dart';
import 'package:keenpockets/core/widgets/kp_network_image.dart';
import 'package:keenpockets/features/administration/presentation/organiser_fixtures.dart';
import 'package:keenpockets/features/administration/presentation/view_models/organiser_view.dart';
import 'package:keenpockets/features/administration/presentation/widgets/admin_widgets.dart';

/// White card with a coloured 7px bottom border + a soft shadow (design
/// `admin_health_dashboard` candy-card).
BoxDecoration organiserCard(BuildContext context, {required Color border}) {
  return BoxDecoration(
    color: context.colorScheme.surface,
    borderRadius: KpRadii.allXl,
    border: Border(bottom: BorderSide(color: border, width: 7)),
    boxShadow: [
      BoxShadow(
        color: context.colorScheme.outlineVariant.withValues(alpha: 0.4),
        blurRadius: KpSpacing.xs,
        offset: const Offset(0, KpSpacing.xxs),
      ),
    ],
  );
}

/// Phone organiser dashboard (design `admin_health_dashboard`).
class OrganiserDashboardView extends StatelessWidget {
  const OrganiserDashboardView({required this.organiser, super.key});

  final OrganiserView organiser;

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
        OrganiserWelcomeHero(activePockets: organiser.activePockets),
        const Gap.l(),
        OrganiserStats(organiser: organiser),
        const Gap.l(),
        const OrganiserHealthHeading(),
        const Gap.m(),
        OrganiserPocketGrid(pockets: organiser.pockets, columns: 1),
        const Gap.l(),
        OrganiserPulseCard(pulse: organiser.pulse),
      ],
    );
  }
}

/// "Morning, Organiser!" welcome hero with CTAs + Mr. K (design
/// `admin_health_dashboard`).
class OrganiserWelcomeHero extends StatelessWidget {
  const OrganiserWelcomeHero({required this.activePockets, super.key});

  final int activePockets;

  static const double _mascot = 120;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: KpRadii.allXl,
        border: Border(
          bottom: BorderSide(
            color: context.colorScheme.outlineVariant,
            width: 6,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.organiserGreeting,
            style: context.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
          const Gap.xs(),
          Text(
            context.l10n.organiserGreetingNote(activePockets),
            style: context.textTheme.bodyLarge?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
          const Gap.m(),
          Row(
            children: [
              Expanded(
                child: AdminCandyButton(
                  label: context.l10n.organiserCreatePocket,
                  face: context.colorScheme.primary,
                  fg: context.colorScheme.onPrimaryContainer,
                  depth: KpColors.brand800,
                  onPressed: () {},
                ),
              ),
              const Gap.s(horizontal: true),
              Expanded(
                child: AdminCandyButton(
                  label: context.l10n.organiserDownloadCsv,
                  face: context.colorScheme.surfaceContainerHigh,
                  fg: context.colorScheme.onSurfaceVariant,
                  depth: context.colorScheme.outlineVariant,
                  onPressed: () {},
                ),
              ),
            ],
          ),
          const Gap.l(),
          Center(
            child: Container(
              width: _mascot,
              height: _mascot,
              clipBehavior: Clip.antiAlias,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: context.colorScheme.primaryContainer.withValues(
                  alpha: 0.4,
                ),
                shape: BoxShape.circle,
                border: Border.all(
                  color: context.colorScheme.primaryContainer,
                  width: 4,
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(KpSpacing.m),
                child: KpNetworkImage(
                  url: kOrganiserMascotUrl,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Total Managed / Active Members / Urgent Actions stat cards.
class OrganiserStats extends StatelessWidget {
  const OrganiserStats({required this.organiser, this.columns = 1, super.key});

  final OrganiserView organiser;
  final int columns;

  @override
  Widget build(BuildContext context) {
    final cards = [
      _StatCard(
        label: context.l10n.organiserTotalManaged,
        icon: Icons.account_balance_wallet_rounded,
        iconColor: KpColors.gold600,
        value: organiser.totalManaged.formatShort(),
        deltaIcon: Icons.trending_up_rounded,
        delta: context.l10n.organiserManagedDelta(organiser.managedDeltaPct),
        deltaColor: KpColors.gold600,
        border: context.colorScheme.secondaryContainer,
      ),
      _StatCard(
        label: context.l10n.organiserActiveMembers,
        icon: Icons.group_rounded,
        iconColor: context.colorScheme.primary,
        value: '${organiser.activeMembers}',
        deltaIcon: Icons.person_add_rounded,
        delta: context.l10n.organiserNewToday(organiser.newMembersToday),
        deltaColor: context.colorScheme.primary,
        border: context.colorScheme.primaryContainer,
      ),
      _StatCard(
        label: context.l10n.organiserUrgentActions,
        icon: Icons.priority_high_rounded,
        iconColor: context.colorScheme.tertiary,
        value: context.l10n.organiserUrgentItems(organiser.urgentActions),
        valueColor: context.colorScheme.tertiary,
        delta: context.l10n.organiserRequiresVerification,
        deltaColor: context.colorScheme.tertiary,
        border: context.colorScheme.tertiaryContainer,
      ),
    ];
    if (columns == 1) {
      return Column(
        children: [
          for (var i = 0; i < cards.length; i++) ...[
            if (i != 0) const Gap.m(),
            cards[i],
          ],
        ],
      );
    }
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (var i = 0; i < cards.length; i++) ...[
            if (i != 0) const Gap.m(horizontal: true),
            Expanded(child: cards[i]),
          ],
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.label,
    required this.icon,
    required this.iconColor,
    required this.value,
    required this.delta,
    required this.deltaColor,
    required this.border,
    this.deltaIcon,
    this.valueColor,
  });

  final String label;
  final IconData icon;
  final Color iconColor;
  final String value;
  final Color? valueColor;
  final IconData? deltaIcon;
  final String delta;
  final Color deltaColor;
  final Color border;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: organiserCard(context, border: border),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  label,
                  style: context.textTheme.labelLarge?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Icon(icon, color: iconColor),
            ],
          ),
          const Gap.s(),
          Text(
            value,
            style: context.textTheme.headlineMedium?.copyWith(
              color: valueColor ?? context.colorScheme.onSurface,
              fontWeight: FontWeight.w800,
            ),
          ),
          const Gap.xs(),
          Row(
            children: [
              if (deltaIcon != null) ...[
                Icon(deltaIcon, size: 16, color: deltaColor),
                const Gap.xxs(horizontal: true),
              ],
              Flexible(
                child: Text(
                  delta,
                  style: context.textTheme.labelMedium?.copyWith(
                    color: deltaColor,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// "Pocket Health Dashboard" heading + help icon.
class OrganiserHealthHeading extends StatelessWidget {
  const OrganiserHealthHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Text(
            context.l10n.organiserPocketHealth,
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        const Gap.xs(horizontal: true),
        Icon(Icons.help_outline_rounded, color: context.colorScheme.outline),
      ],
    );
  }
}

/// Responsive equal-height grid of pocket-health cards + a "Start New Pocket"
/// dashed card (design `admin_health_dashboard`).
class OrganiserPocketGrid extends StatelessWidget {
  const OrganiserPocketGrid({
    required this.pockets,
    required this.columns,
    super.key,
  });

  final List<OrganiserPocketView> pockets;
  final int columns;

  List<Widget> _rows() {
    final cards = <Widget>[
      for (final p in pockets) OrganiserPocketCard(pocket: p),
      const OrganiserStartPocketCard(),
    ];
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

class OrganiserPocketCard extends StatelessWidget {
  const OrganiserPocketCard({required this.pocket, super.key});

  final OrganiserPocketView pocket;

  @override
  Widget build(BuildContext context) {
    final isAdashi = pocket.type == OrganiserPocketType.adashi;
    final pct = (pocket.percent * 100).round();
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: organiserCard(
        context,
        border: context.colorScheme.outlineVariant,
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
                      (isAdashi
                              ? context.l10n.organiserTypeAdashi
                              : context.l10n.organiserTypeSavings)
                          .toUpperCase(),
                      style: context.textTheme.labelMedium?.copyWith(
                        color: isAdashi
                            ? context.colorScheme.primary
                            : KpColors.gold600,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const Gap.xxs(),
                    Text(
                      pocket.name,
                      style: context.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
              const Gap.s(horizontal: true),
              _HealthPill(health: pocket.health, count: pocket.healthCount),
            ],
          ),
          const Gap.m(),
          Row(
            children: [
              Icon(
                Icons.groups_rounded,
                size: 16,
                color: context.colorScheme.onSurfaceVariant,
              ),
              const Gap.xxs(horizontal: true),
              Text(
                context.l10n.organiserMembers(pocket.members),
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          const Gap.l(),
          const Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.l10n.organiserCollected,
                      style: context.textTheme.labelMedium?.copyWith(
                        color: context.colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const Gap.xxs(),
                    Text.rich(
                      TextSpan(
                        style: context.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                        children: [
                          TextSpan(text: pocket.collected.formatShort()),
                          TextSpan(
                            text: ' / ${pocket.target.formatShort()}',
                            style: context.textTheme.bodySmall?.copyWith(
                              color: context.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                '$pct%',
                style: context.textTheme.labelLarge?.copyWith(
                  color: context.colorScheme.primary,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const Gap.xs(),
          KpProgressBar(
            value: pocket.percent,
            color: context.colorScheme.primary,
          ),
        ],
      ),
    );
  }
}

class _HealthPill extends StatelessWidget {
  const _HealthPill({required this.health, required this.count});

  final PocketHealth health;
  final int count;

  @override
  Widget build(BuildContext context) {
    final healthy = health == PocketHealth.healthy;
    final (IconData icon, String label) = switch (health) {
      PocketHealth.pending => (
        Icons.error_rounded,
        context.l10n.organiserHealthPending(count),
      ),
      PocketHealth.atRisk => (
        Icons.warning_rounded,
        context.l10n.organiserHealthAtRisk(count),
      ),
      PocketHealth.overdue => (
        Icons.error_rounded,
        context.l10n.organiserHealthOverdue(count),
      ),
      PocketHealth.healthy => (
        Icons.check_circle_rounded,
        context.l10n.organiserHealthHealthy,
      ),
    };
    final fg = healthy ? context.colors.success : context.colorScheme.tertiary;
    final bg = healthy
        ? context.colors.successContainer.withValues(alpha: 0.5)
        : context.colorScheme.tertiary.withValues(alpha: 0.1);
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.s,
        vertical: KpSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(KpRadii.pill),
        border: Border.all(color: fg.withValues(alpha: 0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: fg),
          const Gap.xxs(horizontal: true),
          Text(
            label,
            style: context.textTheme.labelSmall?.copyWith(
              color: fg,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}

/// Dashed "Start New Pocket" add card (design `admin_health_dashboard`).
class OrganiserStartPocketCard extends StatelessWidget {
  const OrganiserStartPocketCard({super.key});

  static const double _circle = 80;
  static const double _minHeight = 220;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: DashedRRectPainter(
        color: context.colorScheme.outlineVariant,
        radius: KpRadii.xl,
        strokeWidth: 4,
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () {},
          borderRadius: KpRadii.allXl,
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: _minHeight),
            child: Padding(
              padding: const EdgeInsets.all(KpSpacing.l),
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
                      color: context.colorScheme.outline,
                    ),
                  ),
                  const Gap.m(),
                  Text(
                    context.l10n.organiserStartNewPocket,
                    style: context.textTheme.titleLarge?.copyWith(
                      color: context.colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const Gap.xs(),
                  Text(
                    context.l10n.organiserStartNewPocketBody,
                    textAlign: TextAlign.center,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: context.colorScheme.outline,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// "Pulse Checklist" card with action items (design `admin_health_dashboard`).
class OrganiserPulseCard extends StatelessWidget {
  const OrganiserPulseCard({required this.pulse, super.key});

  final List<PulseItemView> pulse;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: organiserCard(
        context,
        border: context.colorScheme.outlineVariant,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.organiserPulseChecklist,
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
          const Gap.m(),
          for (var i = 0; i < pulse.length; i++) ...[
            if (i != 0) const Gap.s(),
            _PulseItem(item: pulse[i]),
          ],
        ],
      ),
    );
  }
}

class _PulseItem extends StatelessWidget {
  const _PulseItem({required this.item});

  final PulseItemView item;

  static const double _icon = 48;

  @override
  Widget build(BuildContext context) {
    final urgent = item.tone == PulseTone.urgent;
    final tint = urgent
        ? context.colorScheme.tertiary
        : context.colorScheme.primary;
    return Container(
      padding: const EdgeInsets.all(KpSpacing.s),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLow,
        borderRadius: KpRadii.allL,
      ),
      child: Row(
        children: [
          Container(
            width: _icon,
            height: _icon,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: tint.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              urgent
                  ? Icons.notification_important_rounded
                  : Icons.verified_rounded,
              color: tint,
            ),
          ),
          const Gap.m(horizontal: true),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: context.textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  item.subtitle,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          const Gap.s(horizontal: true),
          TextButton(
            onPressed: () {},
            child: Text(
              item.action == PulseAction.review
                  ? context.l10n.organiserReview
                  : context.l10n.organiserSendNudge,
              style: context.textTheme.labelLarge?.copyWith(
                color: context.colorScheme.primary,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
