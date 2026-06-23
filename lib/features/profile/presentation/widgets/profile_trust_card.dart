import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/profile/presentation/view_models/profile_view.dart';

/// Trust-score ring + KEEN PIONEER badge + blurb (no card chrome of its own, so
/// callers can place it standalone or inside a shared identity card).
/// Tapping (when [onTap] is supplied) opens the full reputation profile.
class ProfileTrustContent extends StatelessWidget {
  const ProfileTrustContent({required this.profile, this.onTap, super.key});

  static const double _ring = 150;

  final ProfileView profile;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(
          child: SizedBox(
            width: _ring,
            height: _ring,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned.fill(
                  child: CircularProgressIndicator(
                    value: profile.trustScore / 100,
                    strokeWidth: KpSpacing.s,
                    strokeCap: StrokeCap.round,
                    backgroundColor:
                        context.colorScheme.surfaceContainerHighest,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${profile.trustScore}',
                      style: context.textTheme.displaySmall?.copyWith(
                        color: context.colorScheme.primary,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      context.l10n.profileTrustScore.toUpperCase(),
                      style: context.textTheme.labelSmall?.copyWith(
                        color: context.colorScheme.onSurfaceVariant,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const Gap.xl(),
        // Full-width KEEN PIONEER candy button.
        Container(
          padding: const EdgeInsets.symmetric(vertical: KpSpacing.m),
          decoration: BoxDecoration(
            color: context.colorScheme.primary,
            borderRadius: KpRadii.allL,
            border: const Border(
              bottom: BorderSide(color: KpColors.brand600, width: 4),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.workspace_premium_rounded,
                size: KpSpacing.l,
                color: context.colorScheme.onPrimary,
              ),
              const Gap.s(horizontal: true),
              Text(
                profile.tier.toUpperCase(),
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: context.colorScheme.onPrimary,
                ),
              ),
            ],
          ),
        ),
        const Gap.m(),
        Text(
          profile.tierBlurb,
          style: context.textTheme.bodySmall?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
            fontStyle: FontStyle.italic,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );

    if (onTap == null) return content;
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: content,
    );
  }
}

/// Standalone trust card (phone): [ProfileTrustContent] inside a KpCard.
class ProfileTrustCard extends StatelessWidget {
  const ProfileTrustCard({required this.profile, this.onTap, super.key});

  final ProfileView profile;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return KpCard(
      child: ProfileTrustContent(profile: profile, onTap: onTap),
    );
  }
}
