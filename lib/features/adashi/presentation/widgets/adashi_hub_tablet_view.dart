import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/core/widgets/kp_network_image.dart';
import 'package:keenpockets/features/adashi/presentation/pages/adashi_rotation_page.dart';
import 'package:keenpockets/features/adashi/presentation/pages/manage_adashi_page.dart';
import 'package:keenpockets/features/adashi/presentation/view_models/adashi_view.dart';
import 'package:keenpockets/features/contributions/contributions.dart';
import 'package:keenpockets/features/group_collaboration/group_collaboration.dart';

/// Tablet cockpit for the Adashi hub (design `adashi_hub_tablet`): a welcome
/// header over a 3 / 6 / 3 canvas — admin + mascot on the left, the live cycle
/// in the centre, the rotation timeline + disputes on the right — and a footer
/// row of group-insight stats.
class AdashiHubTabletView extends StatelessWidget {
  const AdashiHubTabletView({required this.detail, super.key});

  static const double _maxWidth = 1280;

  final AdashiDetailView detail;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: _maxWidth),
        child: ListView(
          padding: const EdgeInsets.all(KpSpacing.xl),
          children: [
            _Header(detail: detail),
            const Gap.xl(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _AdminCard(detail: detail),
                      const Gap.l(),
                      const _MascotTip(),
                    ],
                  ),
                ),
                const Gap.l(horizontal: true),
                Expanded(flex: 5, child: _CycleCard(detail: detail)),
                const Gap.l(horizontal: true),
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _TimelineCard(
                        rotation: detail.rotation,
                        adashiId: detail.summary.id,
                      ),
                      const Gap.l(),
                      _DisputesCard(detail: detail),
                    ],
                  ),
                ),
              ],
            ),
            const Gap.l(),
            _FooterStats(detail: detail),
          ],
        ),
      ),
    );
  }
}

/// "Adashi Hub" title + welcome, with a notifications button and profile chip.
class _Header extends StatelessWidget {
  const _Header({required this.detail});

  final AdashiDetailView detail;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.l10n.adashiHubTitle,
                style: context.textTheme.headlineMedium?.copyWith(
                  color: context.colorScheme.primary,
                ),
              ),
              const Gap.xxs(),
              Text(
                context.l10n.adashiHubWelcome(detail.adminName),
                style: context.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
        const Gap.m(horizontal: true),
        _HeaderIconButton(
          icon: Icons.tune_rounded,
          onTap: () => Navigator.of(context).push<void>(
            MaterialPageRoute(
              builder: (_) => ManageAdashiPage(adashiId: detail.summary.id),
            ),
          ),
        ),
        const Gap.s(horizontal: true),
        const _HeaderIconButton(icon: KpIcons.notificationsOutlined),
        const Gap.s(horizontal: true),
        Container(
          padding: const EdgeInsets.fromLTRB(
            KpSpacing.xs,
            KpSpacing.xs,
            KpSpacing.m,
            KpSpacing.xs,
          ),
          decoration: BoxDecoration(
            color: context.colorScheme.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(KpRadii.pill),
            border: Border.all(
              color: context.colorScheme.surfaceContainerHighest,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: context.colorScheme.primary,
                    width: 2,
                  ),
                ),
                child: KpNetworkAvatar(url: detail.adminAvatarUrl, radius: 16),
              ),
              const Gap.s(horizontal: true),
              Text(detail.adminName, style: context.textTheme.labelLarge),
            ],
          ),
        ),
      ],
    );
  }
}

/// Square header icon button (manage / notifications).
class _HeaderIconButton extends StatelessWidget {
  const _HeaderIconButton({required this.icon, this.onTap});

  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colorScheme.surfaceContainerHigh,
      borderRadius: KpRadii.allM,
      child: InkWell(
        onTap: onTap,
        borderRadius: KpRadii.allM,
        child: SizedBox(
          width: KpSpacing.xxl,
          height: KpSpacing.xxl,
          child: Icon(icon, color: context.colorScheme.onSurfaceVariant),
        ),
      ),
    );
  }
}

/// Left pane — admin identity card.
class _AdminCard extends StatelessWidget {
  const _AdminCard({required this.detail});

  final AdashiDetailView detail;

  @override
  Widget build(BuildContext context) {
    return KpCard(
      padding: const EdgeInsets.all(KpSpacing.l),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomRight,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: context.colorScheme.primary,
                    width: 4,
                  ),
                ),
                child: KpNetworkAvatar(url: detail.adminAvatarUrl, radius: 44),
              ),
              Container(
                padding: const EdgeInsets.all(KpSpacing.xs),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.colorScheme.secondaryContainer,
                  border: Border.all(
                    color: context.colorScheme.surfaceContainerLowest,
                    width: 2,
                  ),
                ),
                child: Icon(
                  Icons.verified_user_rounded,
                  size: KpSpacing.m,
                  color: context.colorScheme.onSecondaryContainer,
                ),
              ),
            ],
          ),
          const Gap.m(),
          Text(detail.adminName, style: context.textTheme.headlineSmall),
          const Gap.xxs(),
          Text(
            context.l10n.adashiHubMasterOrganiser,
            style: context.textTheme.labelLarge?.copyWith(
              color: context.colorScheme.primary,
            ),
          ),
          const Gap.m(),
          _ReputationRow(score: detail.reputation),
          const Gap.m(),
          const Divider(),
          const Gap.s(),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              context.l10n.adashiHubPayoutDetails.toUpperCase(),
              style: context.textTheme.labelSmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: context.colorScheme.onSurfaceVariant,
                letterSpacing: 0.5,
              ),
            ),
          ),
          const Gap.s(),
          Container(
            padding: const EdgeInsets.all(KpSpacing.s),
            decoration: BoxDecoration(
              color: context.colorScheme.surfaceContainer,
              borderRadius: KpRadii.allM,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.account_balance_rounded,
                  color: context.colorScheme.primary,
                ),
                const Gap.s(horizontal: true),
                Expanded(
                  child: Text(
                    detail.payoutBank,
                    style: context.textTheme.bodyMedium,
                    overflow: TextOverflow.ellipsis,
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

/// Reputation pill: 5 stars + numeric score on a light-blue fixed surface.
class _ReputationRow extends StatelessWidget {
  const _ReputationRow({required this.score});

  final String score;

  @override
  Widget build(BuildContext context) {
    final filled = (double.tryParse(score) ?? 0).floor().clamp(0, 5);
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.m,
        vertical: KpSpacing.s,
      ),
      decoration: BoxDecoration(
        color: context.colorScheme.primaryContainer,
        borderRadius: KpRadii.allL,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              context.l10n.adashiHubReputationLabel.toUpperCase(),
              style: context.textTheme.labelSmall?.copyWith(
                color: context.colorScheme.onPrimaryContainer,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Gap.s(horizontal: true),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (var i = 0; i < 5; i++)
                Icon(
                  i < filled ? Icons.star_rounded : Icons.star_border_rounded,
                  size: KpSpacing.s,
                  color: context.colorScheme.secondary,
                ),
              const Gap.xxs(horizontal: true),
              Text(
                score,
                style: context.textTheme.labelSmall?.copyWith(
                  color: context.colorScheme.onPrimaryContainer,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Left pane — Mr K motivational tip.
class _MascotTip extends StatelessWidget {
  const _MascotTip();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: BoxDecoration(
        color: context.colorScheme.primaryContainer,
        borderRadius: KpRadii.allXl,
      ),
      child: Stack(
        children: [
          Positioned(
            right: -KpSpacing.s,
            bottom: -KpSpacing.s,
            child: Icon(
              Icons.lightbulb_rounded,
              size: 72,
              color: context.colorScheme.onPrimaryContainer.withValues(
                alpha: 0.15,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.l10n.adashiHubMascotTip,
                style: context.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: context.colorScheme.onPrimaryContainer,
                ),
              ),
              const Gap.s(),
              Text(
                '— ${context.l10n.mascotName}',
                style: context.textTheme.labelSmall?.copyWith(
                  color: context.colorScheme.onPrimaryContainer.withValues(
                    alpha: 0.8,
                  ),
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Centre pane — live cycle, member tiles, and the contribute CTA.
class _CycleCard extends StatelessWidget {
  const _CycleCard({required this.detail});

  static const _initials = ['S.', 'A.', 'M.', 'Y.', 'K.', 'P.', 'H.', 'L.'];

  final AdashiDetailView detail;

  @override
  Widget build(BuildContext context) {
    final summary = detail.summary;
    final percent = (detail.collectionProgress * 100).round();
    return KpCard(
      padding: const EdgeInsets.all(KpSpacing.l),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _CycleBadge(
                      label: context.l10n.adashiHubCycle(summary.currentCycle),
                    ),
                    const Gap.s(),
                    Text(summary.name, style: context.textTheme.headlineSmall),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    context.l10n.adashiHubTarget.toUpperCase(),
                    style: context.textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: context.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  Text(
                    detail.target.format(),
                    style: context.textTheme.headlineSmall?.copyWith(
                      color: context.colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Gap.xl(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: context.textTheme.displaySmall?.copyWith(
                      color: context.colorScheme.onSurface,
                      fontWeight: FontWeight.w900,
                    ),
                    children: [
                      TextSpan(text: detail.collected.format()),
                      TextSpan(
                        text: ' ${context.l10n.adashiHubCollectedSuffix}',
                        style: context.textTheme.titleMedium?.copyWith(
                          color: context.colorScheme.onSurfaceVariant,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                context.l10n.adashiHubPercent(percent),
                style: context.textTheme.headlineSmall?.copyWith(
                  color: context.colorScheme.primary,
                ),
              ),
            ],
          ),
          const Gap.s(),
          KpProgressBar(value: detail.collectionProgress, height: 24),
          const Gap.l(),
          Row(
            children: [
              for (var i = 0; i < summary.memberCount && i < 8; i++) ...[
                if (i > 0) const Gap.xs(horizontal: true),
                Expanded(
                  child: _MemberTile(
                    initial: _initials[i % _initials.length],
                    paid: i < detail.paidMembers,
                  ),
                ),
              ],
            ],
          ),
          const Gap.xl(),
          ContributeButton(
            target: ContributionContext.adashi(
              summary.id,
              cycle: '${summary.currentCycle}',
            ),
            icon: Icons.volunteer_activism_rounded,
            label: context.l10n.adashiHubContribute(
              detail.contributeAmount.format(),
            ),
          ),
          const Gap.s(),
          Center(
            child: Text(
              context.l10n.adashiHubNextPayoutLine(detail.nextPayoutDate),
              style: context.textTheme.labelSmall?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CycleBadge extends StatelessWidget {
  const _CycleBadge({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.s,
        vertical: KpSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: KpColors.gold100,
        borderRadius: BorderRadius.circular(KpRadii.pill),
      ),
      child: Text(
        label.toUpperCase(),
        style: context.textTheme.labelSmall?.copyWith(
          color: context.colorScheme.onSurface,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

class _MemberTile extends StatelessWidget {
  const _MemberTile({required this.initial, required this.paid});

  final String initial;
  final bool paid;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: KpSpacing.xl,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: paid
                ? context.colorScheme.primaryContainer
                : context.colorScheme.surfaceContainerHigh,
            borderRadius: KpRadii.allM,
            border: paid
                ? Border.all(color: context.colorScheme.primary)
                : null,
          ),
          child: Icon(
            paid ? Icons.check_rounded : Icons.pending_outlined,
            size: KpSpacing.m,
            color: paid
                ? context.colorScheme.primary
                : context.colorScheme.outlineVariant,
          ),
        ),
        const Gap.xxs(),
        Text(
          initial,
          style: context.textTheme.labelSmall?.copyWith(
            color: paid
                ? context.colorScheme.primary
                : context.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}

/// Right pane — compact rotation timeline.
class _TimelineCard extends StatelessWidget {
  const _TimelineCard({required this.rotation, required this.adashiId});

  final List<AdashiMemberView> rotation;
  final String adashiId;

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
              Flexible(
                child: Text(
                  context.l10n.adashiHubRotationTitle.toUpperCase(),
                  style: context.textTheme.labelSmall?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                    letterSpacing: 0.5,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              InkWell(
                onTap: () => Navigator.of(context).push<void>(
                  MaterialPageRoute(
                    builder: (_) => AdashiRotationPage(adashiId: adashiId),
                  ),
                ),
                child: Text(
                  context.l10n.adashiHubSeeAll,
                  style: context.textTheme.labelMedium?.copyWith(
                    color: context.colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
          const Gap.m(),
          for (final member in rotation)
            _TimelineRow(member: member, isLast: member == rotation.last),
        ],
      ),
    );
  }
}

class _TimelineRow extends StatelessWidget {
  const _TimelineRow({required this.member, required this.isLast});

  final AdashiMemberView member;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final (Color node, Widget glyph) = switch (member.status) {
      RotationStatus.received => (
        context.colorScheme.outlineVariant,
        Icon(
          Icons.done_rounded,
          size: KpSpacing.s,
          color: context.colorScheme.onPrimary,
        ),
      ),
      RotationStatus.current => (
        context.colorScheme.primary,
        Icon(
          Icons.bolt_rounded,
          size: KpSpacing.s,
          color: context.colorScheme.onPrimary,
        ),
      ),
      RotationStatus.upcoming => (
        context.colorScheme.secondaryContainer,
        Icon(
          Icons.hourglass_empty_rounded,
          size: KpSpacing.s,
          color: context.colorScheme.onSecondaryContainer,
        ),
      ),
    };
    final subtitle = switch (member.status) {
      RotationStatus.received =>
        member.amountLabel == null
            ? context.l10n.rotationReceived
            : context.l10n.adashiHubReceivedOn(member.amountLabel!),
      RotationStatus.current => context.l10n.adashiHubReceivingNow,
      RotationStatus.upcoming => context.l10n.rotationUpcoming,
    };
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: KpSpacing.l,
                height: KpSpacing.l,
                alignment: Alignment.center,
                decoration: BoxDecoration(shape: BoxShape.circle, color: node),
                child: glyph,
              ),
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
          const Gap.s(horizontal: true),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: KpSpacing.m),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    member.isYou
                        ? context.l10n.adashiHubYouUpcoming
                        : member.name,
                    style: context.textTheme.labelLarge,
                  ),
                  Text(
                    subtitle,
                    style: context.textTheme.labelSmall?.copyWith(
                      color: member.status == RotationStatus.current
                          ? context.colorScheme.primary
                          : context.colorScheme.onSurfaceVariant,
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

/// Right pane — disputes summary with an active case + resolution stats.
class _DisputesCard extends StatelessWidget {
  const _DisputesCard({required this.detail});

  final AdashiDetailView detail;

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
                context.l10n.adashiHubDisputesTitle.toUpperCase(),
                style: context.textTheme.labelSmall?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                  letterSpacing: 0.5,
                ),
              ),
              if (detail.openDisputes > 0)
                Container(
                  width: KpSpacing.l,
                  height: KpSpacing.l,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: context.colorScheme.error,
                  ),
                  child: Text(
                    '${detail.openDisputes}',
                    style: context.textTheme.labelSmall?.copyWith(
                      color: context.colorScheme.onError,
                    ),
                  ),
                ),
            ],
          ),
          if (detail.disputeTitle != null) ...[
            const Gap.m(),
            Container(
              padding: const EdgeInsets.all(KpSpacing.m),
              decoration: BoxDecoration(
                color: context.colorScheme.errorContainer,
                borderRadius: KpRadii.allL,
                border: Border(
                  left: BorderSide(color: context.colorScheme.error, width: 4),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.report_rounded,
                        size: KpSpacing.m,
                        color: context.colorScheme.error,
                      ),
                      const Gap.xs(horizontal: true),
                      Expanded(
                        child: Text(
                          detail.disputeTitle!,
                          style: context.textTheme.labelLarge?.copyWith(
                            color: context.colorScheme.onErrorContainer,
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (detail.disputeBody != null) ...[
                    const Gap.xs(),
                    Text(
                      detail.disputeBody!,
                      style: context.textTheme.bodySmall?.copyWith(
                        color: context.colorScheme.onErrorContainer,
                      ),
                    ),
                  ],
                  const Gap.s(),
                  _ResolveButton(
                    onTap: () => Navigator.of(context).push<void>(
                      MaterialPageRoute(
                        builder: (_) =>
                            DisputesHubPage(groupId: detail.summary.id),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          const Gap.m(),
          _StatLine(
            label: context.l10n.adashiHubClosedCases,
            value: detail.closedCases,
          ),
          _StatLine(
            label: context.l10n.adashiHubAvgResolve,
            value: detail.avgResolve,
          ),
        ],
      ),
    );
  }
}

class _ResolveButton extends StatelessWidget {
  const _ResolveButton({this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: KpSpacing.s),
        decoration: BoxDecoration(
          color: context.colorScheme.onErrorContainer,
          borderRadius: KpRadii.allM,
        ),
        child: Text(
          context.l10n.adashiHubResolveNow.toUpperCase(),
          style: context.textTheme.labelSmall?.copyWith(
            color: context.colorScheme.onError,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}

class _StatLine extends StatelessWidget {
  const _StatLine({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: KpSpacing.xs),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              label,
              style: context.textTheme.bodySmall?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(value, style: context.textTheme.labelLarge),
        ],
      ),
    );
  }
}

/// Footer — three group-insight stat cards.
class _FooterStats extends StatelessWidget {
  const _FooterStats({required this.detail});

  final AdashiDetailView detail;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: _StatCard(
              icon: Icons.trending_up_rounded,
              tint: context.colorScheme.tertiary,
              label: context.l10n.adashiHubGroupHealth,
              value: detail.groupHealth,
            ),
          ),
          const Gap.l(horizontal: true),
          Expanded(
            child: _StatCard(
              icon: Icons.savings_rounded,
              tint: context.colorScheme.secondary,
              label: context.l10n.adashiHubTotalSaved,
              value: detail.totalSaved,
            ),
          ),
          const Gap.l(horizontal: true),
          Expanded(
            child: _StatCard(
              icon: Icons.shield_rounded,
              tint: context.colorScheme.primary,
              label: context.l10n.adashiHubSecurity,
              value: detail.securityStatus,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.icon,
    required this.tint,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final Color tint;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: BoxDecoration(
        color: tint.withValues(alpha: 0.08),
        borderRadius: KpRadii.allXl,
        border: Border.all(color: tint.withValues(alpha: 0.4), width: 2),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(KpSpacing.s),
            decoration: BoxDecoration(
              color: tint.withValues(alpha: 0.18),
              borderRadius: KpRadii.allM,
            ),
            child: Icon(icon, color: tint),
          ),
          const Gap.m(horizontal: true),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: context.textTheme.labelSmall?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  value,
                  style: context.textTheme.titleMedium,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
