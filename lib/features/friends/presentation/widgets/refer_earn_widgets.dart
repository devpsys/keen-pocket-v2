import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/core/widgets/dashed_rrect_painter.dart';
import 'package:keenpockets/core/widgets/kp_network_image.dart';
import 'package:keenpockets/features/friends/presentation/cubit/friends_state.dart';
import 'package:keenpockets/features/friends/presentation/referral_fixtures.dart';
import 'package:keenpockets/features/friends/presentation/view_models/referral_view.dart';

/// Pill colours + label for a referral status (shared phone + tablet).
({Color bg, Color fg, String label}) referralAccent(
  BuildContext context,
  ReferralStatus status,
) {
  return switch (status) {
    ReferralStatus.pending => (
      bg: context.colors.warningContainer,
      fg: context.colors.warning,
      label: context.l10n.referEarnStatusPending,
    ),
    ReferralStatus.qualified => (
      bg: context.colors.successContainer,
      fg: context.colors.success,
      label: context.l10n.referEarnStatusQualified,
    ),
    ReferralStatus.rewarded => (
      bg: context.colorScheme.primaryContainer,
      fg: context.colorScheme.onPrimaryContainer,
      label: context.l10n.referEarnStatusRewarded,
    ),
  };
}

/// White "bento" card: 2px outline + a flat 7px bottom shadow (design
/// `refer_earn`).
BoxDecoration referBentoCard(BuildContext context) {
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

/// Phone refer-&-earn screen (design `refer_earn`).
class ReferEarnPhoneView extends StatelessWidget {
  const ReferEarnPhoneView({
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
      padding: const EdgeInsets.only(bottom: KpSpacing.xxl),
      children: [
        const ReferEarnHero(),
        // Overlap the invite card onto the hero (design `-mt-10`).
        Transform.translate(
          offset: const Offset(0, -KpSpacing.xl),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(KpSpacing.m, 0, KpSpacing.m, 0),
            child: Column(
              children: [
                ReferEarnInviteCard(
                  link: state.inviteLink,
                  code: state.referralCode,
                  onCopy: onCopy,
                  onShare: onShare,
                ),
                const Gap.l(),
                ReferEarnStatsRow(
                  invited: state.invited,
                  qualified: state.qualified,
                  rewarded: state.rewarded,
                ),
                const Gap.l(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    context.l10n.referEarnYourCircle,
                    style: context.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const Gap.m(),
                for (final r in state.circle) ...[
                  ReferralRow(referral: r),
                  const Gap.m(),
                ],
                ReferEarnInviteMoreRow(onTap: onInviteMore),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// Gradient hero with the mascot (design `refer_earn`).
class ReferEarnHero extends StatelessWidget {
  const ReferEarnHero({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(
        KpSpacing.l,
        KpSpacing.xl,
        KpSpacing.l,
        KpSpacing.xl,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [context.colorScheme.primary, KpColors.brand700],
        ),
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(40)),
      ),
      child: Column(
        children: [
          Text(
            context.l10n.referEarnHeroTitle,
            textAlign: TextAlign.center,
            style: context.textTheme.displaySmall?.copyWith(
              color: context.colorScheme.onPrimary,
              fontWeight: FontWeight.w900,
            ),
          ),
          const Gap.s(),
          Text(
            context.l10n.referEarnHeroBody,
            textAlign: TextAlign.center,
            style: context.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w400,
              color: context.colorScheme.onPrimary.withValues(alpha: 0.9),
            ),
          ),
          const Gap.l(),
          const KpNetworkImage(
            url: kReferralMascotUrl,
            width: 160,
            height: 160,
            fit: BoxFit.contain,
          ),
          const Gap.l(),
        ],
      ),
    );
  }
}

/// Invite link + referral code + WhatsApp share (design `refer_earn`).
class ReferEarnInviteCard extends StatelessWidget {
  const ReferEarnInviteCard({
    required this.link,
    required this.code,
    this.onCopy,
    this.onShare,
    this.decoration,
    super.key,
  });

  final String link;
  final String code;
  final VoidCallback? onCopy;
  final VoidCallback? onShare;

  /// Overrides the default phone "bento" card (tablet passes its chunky card).
  final BoxDecoration? decoration;

  static const double _copyWidth = 110;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: decoration ?? referBentoCard(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Label(context.l10n.referEarnInviteLink),
          const Gap.s(),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: KpSpacing.m,
                    vertical: KpSpacing.s,
                  ),
                  decoration: BoxDecoration(
                    color: context.colorScheme.surfaceContainer,
                    borderRadius: KpRadii.allM,
                    border: Border.all(
                      color: context.colorScheme.surfaceContainerHighest,
                      width: 2,
                    ),
                  ),
                  child: Text(
                    link,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.bodySmall,
                  ),
                ),
              ),
              const Gap.s(horizontal: true),
              SizedBox(
                width: _copyWidth,
                child: KpButton(
                  label: context.l10n.referEarnCopy,
                  icon: Icons.content_copy_rounded,
                  onPressed: onCopy ?? () {},
                ),
              ),
            ],
          ),
          const Gap.l(),
          _Label(context.l10n.referEarnReferralCode),
          const Gap.s(),
          CustomPaint(
            foregroundPainter: DashedRRectPainter(
              color: context.colorScheme.primary.withValues(alpha: 0.4),
              radius: KpRadii.m,
            ),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: KpSpacing.m),
              alignment: Alignment.center,
              child: Text(
                code,
                style: context.textTheme.headlineSmall?.copyWith(
                  color: context.colorScheme.primary,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 4,
                ),
              ),
            ),
          ),
          const Gap.l(),
          WhatsAppShareButton(onShare: onShare),
        ],
      ),
    );
  }
}

class _Label extends StatelessWidget {
  const _Label(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.textTheme.labelLarge?.copyWith(
        color: context.colorScheme.onSurfaceVariant,
        fontWeight: FontWeight.w800,
      ),
    );
  }
}

/// Candy WhatsApp share button (design `refer_earn`).
class WhatsAppShareButton extends StatelessWidget {
  const WhatsAppShareButton({this.onShare, super.key});

  final VoidCallback? onShare;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        borderRadius: KpRadii.allL,
        boxShadow: [
          BoxShadow(color: KpColors.whatsappDark, offset: Offset(0, 4)),
        ],
      ),
      child: Material(
        color: KpColors.whatsapp,
        borderRadius: KpRadii.allL,
        child: InkWell(
          borderRadius: KpRadii.allL,
          onTap: onShare ?? () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: KpSpacing.m),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.chat_rounded, color: KpColors.neutral0),
                const Gap.s(horizontal: true),
                Text(
                  context.l10n.referEarnShareWhatsApp,
                  style: context.textTheme.titleMedium?.copyWith(
                    color: KpColors.neutral0,
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

/// Invited / Qualified / Rewarded stat cards (design `refer_earn`).
class ReferEarnStatsRow extends StatelessWidget {
  const ReferEarnStatsRow({
    required this.invited,
    required this.qualified,
    required this.rewarded,
    super.key,
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
            child: _StatCard(
              label: context.l10n.referEarnInvited,
              value: invited,
            ),
          ),
          const Gap.m(horizontal: true),
          Expanded(
            child: _StatCard(
              label: context.l10n.referEarnQualified,
              value: qualified,
              color: context.colors.success,
            ),
          ),
          const Gap.m(horizontal: true),
          Expanded(
            child: _StatCard(
              label: context.l10n.referEarnRewarded,
              value: rewarded,
              color: context.colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({required this.label, required this.value, this.color});

  final String label;
  final int value;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: KpRadii.allXl,
        border: Border.all(
          color: color ?? context.colorScheme.surfaceContainerHighest,
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
        children: [
          Text(
            label,
            style: context.textTheme.labelSmall?.copyWith(
              color: color ?? context.colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w800,
            ),
          ),
          const Gap.xxs(),
          Text(
            '$value',
            style: context.textTheme.displaySmall?.copyWith(
              color: color,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}

/// Solid-accent styling for a flat (tablet) referral strip (design
/// `refer_earn_tablet`): tinted row, solid-accent avatar and matching pill.
({
  Color rowBg,
  Color? rowBorder,
  Color avatarBg,
  Color onAvatar,
  Color pillBg,
  Color pillFg,
})
referralFlatStyle(BuildContext context, ReferralStatus status) {
  return switch (status) {
    ReferralStatus.pending => (
      rowBg: context.colorScheme.surfaceContainer,
      rowBorder: null,
      avatarBg: context.colorScheme.surfaceContainerHighest,
      onAvatar: context.colorScheme.onSurfaceVariant,
      pillBg: context.colorScheme.surfaceContainerHighest,
      pillFg: context.colorScheme.onSurfaceVariant,
    ),
    ReferralStatus.qualified => (
      rowBg: context.colorScheme.secondaryContainer.withValues(alpha: 0.15),
      rowBorder: context.colorScheme.secondaryContainer.withValues(alpha: 0.4),
      avatarBg: context.colorScheme.secondaryContainer,
      onAvatar: context.colorScheme.onSecondaryContainer,
      pillBg: context.colorScheme.secondaryContainer,
      pillFg: context.colorScheme.onSecondaryContainer,
    ),
    ReferralStatus.rewarded => (
      rowBg: context.colorScheme.primary.withValues(alpha: 0.1),
      rowBorder: context.colorScheme.primary.withValues(alpha: 0.3),
      avatarBg: context.colorScheme.primary,
      onAvatar: context.colorScheme.onPrimary,
      pillBg: context.colorScheme.primary,
      pillFg: context.colorScheme.onPrimary,
    ),
  };
}

/// A row in "Your Circle" (design `refer_earn` / `_tablet`).
class ReferralRow extends StatelessWidget {
  const ReferralRow({
    required this.referral,
    this.showDetail = false,
    this.flat = false,
    super.key,
  });

  final ReferralView referral;
  final bool showDetail;

  /// Tablet: a flat tinted strip inside the "Your Circle" card (no candy depth),
  /// rather than a standalone bento card.
  final bool flat;

  @override
  Widget build(BuildContext context) {
    final accent = referralAccent(context, referral.status);
    final flatStyle = flat ? referralFlatStyle(context, referral.status) : null;

    final avatar = Container(
      width: KpSpacing.xl,
      height: KpSpacing.xl,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: flatStyle?.avatarBg ?? context.colorScheme.surfaceContainer,
        shape: BoxShape.circle,
      ),
      child: Text(
        referral.initial,
        style: context.textTheme.titleMedium?.copyWith(
          color: flatStyle?.onAvatar ?? accent.fg,
          fontWeight: FontWeight.w900,
        ),
      ),
    );

    final pill = flatStyle == null
        ? ReferralStatusPill(status: referral.status)
        : Container(
            padding: const EdgeInsets.symmetric(
              horizontal: KpSpacing.s,
              vertical: KpSpacing.xxs,
            ),
            decoration: BoxDecoration(
              color: flatStyle.pillBg,
              borderRadius: const BorderRadius.all(
                Radius.circular(KpRadii.pill),
              ),
            ),
            child: Text(
              accent.label.toUpperCase(),
              style: context.textTheme.labelSmall?.copyWith(
                color: flatStyle.pillFg,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.5,
              ),
            ),
          );

    final hasReward = referral.rewardAmount != null && showDetail;

    return Container(
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: flatStyle == null
          ? referBentoCard(context)
          : BoxDecoration(
              color: flatStyle.rowBg,
              borderRadius: KpRadii.allL,
              border: flatStyle.rowBorder == null
                  ? null
                  : Border.all(color: flatStyle.rowBorder!),
            ),
      child: Row(
        children: [
          avatar,
          const Gap.m(horizontal: true),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  referral.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const Gap.xxs(),
                Text(
                  showDetail
                      ? (referral.detail ?? referral.joinedLabel)
                      : referral.joinedLabel,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          const Gap.s(horizontal: true),
          // Rewarded (tablet): pill above the reward amount; otherwise inline.
          if (hasReward && flat)
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                pill,
                const Gap.xxs(),
                Text(
                  referral.rewardAmount!,
                  style: context.textTheme.labelMedium?.copyWith(
                    color: context.colorScheme.primary,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            )
          else ...[
            if (hasReward) ...[
              Text(
                referral.rewardAmount!,
                style: context.textTheme.labelMedium?.copyWith(
                  color: context.colorScheme.primary,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const Gap.s(horizontal: true),
            ],
            pill,
          ],
        ],
      ),
    );
  }
}

class ReferralStatusPill extends StatelessWidget {
  const ReferralStatusPill({required this.status, super.key});

  final ReferralStatus status;

  @override
  Widget build(BuildContext context) {
    final accent = referralAccent(context, status);
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.s,
        vertical: KpSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: accent.bg,
        borderRadius: const BorderRadius.all(Radius.circular(KpRadii.pill)),
      ),
      child: Text(
        accent.label,
        style: context.textTheme.labelSmall?.copyWith(
          color: accent.fg,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

/// Dashed "Invite more friends!" row (design `refer_earn`).
class ReferEarnInviteMoreRow extends StatelessWidget {
  const ReferEarnInviteMoreRow({this.onTap, super.key});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.75,
      child: CustomPaint(
        foregroundPainter: DashedRRectPainter(
          color: context.colorScheme.surfaceContainerHighest,
          radius: KpRadii.l,
        ),
        child: SizedBox(
          width: double.infinity,
          child: Material(
            color: KpColors.transparent,
            borderRadius: KpRadii.allL,
            child: InkWell(
              borderRadius: KpRadii.allL,
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: KpSpacing.l),
                child: Column(
                  children: [
                    Icon(
                      Icons.person_add_outlined,
                      size: KpSpacing.xl,
                      color: context.colorScheme.onSurfaceVariant,
                    ),
                    const Gap.s(),
                    Text(
                      context.l10n.referEarnInviteMore,
                      style: context.textTheme.labelLarge?.copyWith(
                        color: context.colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
