import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/core/widgets/kp_network_image.dart';
import 'package:keenpockets/features/friends/presentation/cubit/friends_state.dart';
import 'package:keenpockets/features/friends/presentation/referral_fixtures.dart';
import 'package:keenpockets/features/friends/presentation/view_models/referral_view.dart';
import 'package:keenpockets/features/friends/presentation/widgets/refer_earn_widgets.dart';

/// Tablet "chunky" card (design `refer_earn_tablet`): a 7px coloured bottom
/// border as the candy depth — no drop shadow, no full outline.
BoxDecoration _chunkyCard(BuildContext context, {Color? bg}) {
  return BoxDecoration(
    color: bg ?? context.colorScheme.surface,
    borderRadius: KpRadii.allXl,
    border: Border(
      bottom: BorderSide(
        color: context.colorScheme.surfaceContainerHighest,
        width: 7,
      ),
    ),
  );
}

/// Tablet refer-&-earn dashboard (design `refer_earn_tablet`): a hero + invite
/// card on the left and stats + "Your Circle" on the right. The nav rail is
/// provided by `AppTabletShell`. Presentation-only.
class ReferEarnTabletView extends StatelessWidget {
  const ReferEarnTabletView({
    required this.state,
    this.onCopy,
    this.onShare,
    this.onInviteMore,
    super.key,
  });

  final FriendsState state;
  final VoidCallback? onCopy;
  final VoidCallback? onShare;
  final VoidCallback? onInviteMore;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(KpSpacing.xl),
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  const _TabletHero(),
                  const Gap.l(),
                  ReferEarnInviteCard(
                    link: state.inviteLink,
                    code: state.referralCode,
                    onCopy: onCopy,
                    onShare: onShare,
                    decoration: _chunkyCard(context),
                  ),
                ],
              ),
            ),
            const Gap.l(horizontal: true),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  _TabletStats(
                    invited: state.invited,
                    qualified: state.qualified,
                    rewarded: state.rewarded,
                  ),
                  const Gap.l(),
                  _CircleCard(circle: state.circle, onInviteMore: onInviteMore),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _TabletHero extends StatelessWidget {
  const _TabletHero();

  @override
  Widget build(BuildContext context) {
    final onContainer = context.colorScheme.onPrimaryContainer;
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: _chunkyCard(
        context,
        bg: context.colorScheme.primaryContainer,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.referEarnHeroTitle,
                  style: context.textTheme.headlineMedium?.copyWith(
                    color: onContainer,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const Gap.s(),
                Text(
                  context.l10n.referEarnHeroBody,
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: onContainer.withValues(alpha: 0.9),
                  ),
                ),
                const Gap.l(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: KpSpacing.m,
                    vertical: KpSpacing.xs,
                  ),
                  decoration: BoxDecoration(
                    color: context.colorScheme.surface,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(KpRadii.pill),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.bolt_rounded,
                        size: KpSpacing.l,
                        color: context.colorScheme.primary,
                      ),
                      const Gap.xs(horizontal: true),
                      Text(
                        context.l10n.referEarnLimitedOffer,
                        style: context.textTheme.labelLarge?.copyWith(
                          color: context.colorScheme.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Gap.m(horizontal: true),
          const KpNetworkImage(
            url: kReferralMascotUrl,
            width: 150,
            height: 150,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}

class _TabletStats extends StatelessWidget {
  const _TabletStats({
    required this.invited,
    required this.qualified,
    required this.rewarded,
  });

  final int invited;
  final int qualified;
  final int rewarded;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: _TabletStat(
              value: invited,
              label: context.l10n.referEarnInvited,
              bg: context.colorScheme.surface,
              fg: context.colorScheme.onSurface,
            ),
          ),
          const Gap.m(horizontal: true),
          Expanded(
            child: _TabletStat(
              value: qualified,
              label: context.l10n.referEarnQualified,
              bg: context.colorScheme.secondaryContainer,
              fg: context.colorScheme.onSecondaryContainer,
            ),
          ),
          const Gap.m(horizontal: true),
          Expanded(
            child: _TabletStat(
              value: rewarded,
              label: context.l10n.referEarnRewarded,
              bg: context.colorScheme.errorContainer,
              fg: context.colorScheme.error,
            ),
          ),
        ],
      ),
    );
  }
}

class _TabletStat extends StatelessWidget {
  const _TabletStat({
    required this.value,
    required this.label,
    required this.bg,
    required this.fg,
  });

  final int value;
  final String label;
  final Color bg;
  final Color fg;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: _chunkyCard(context, bg: bg),
      child: Column(
        children: [
          Text(
            '$value',
            style: context.textTheme.headlineMedium?.copyWith(
              color: fg,
              fontWeight: FontWeight.w900,
            ),
          ),
          const Gap.xxs(),
          Text(
            label.toUpperCase(),
            style: context.textTheme.labelSmall?.copyWith(
              color: fg,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _CircleCard extends StatelessWidget {
  const _CircleCard({required this.circle, this.onInviteMore});

  final List<ReferralView> circle;
  final VoidCallback? onInviteMore;

  static const double _buttonWidth = double.infinity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: _chunkyCard(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.referEarnYourCircle,
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
          const Gap.m(),
          for (final r in circle) ...[
            ReferralRow(referral: r, showDetail: true, flat: true),
            const Gap.s(),
          ],
          const Gap.s(),
          SizedBox(
            width: _buttonWidth,
            child: KpButton(
              label: context.l10n.referEarnInviteMoreFriends,
              icon: Icons.person_add_outlined,
              variant: KpButtonVariant.secondary,
              onPressed: onInviteMore ?? () {},
            ),
          ),
        ],
      ),
    );
  }
}
