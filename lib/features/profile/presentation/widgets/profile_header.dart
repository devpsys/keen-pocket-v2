import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/core/widgets/kp_network_image.dart';
import 'package:keenpockets/features/profile/presentation/view_models/profile_view.dart';
import 'package:keenpockets/features/profile/presentation/widgets/profile_fixtures.dart';

/// Avatar + level badge + name + phone identity block atop my-profile.
class ProfileHeader extends StatelessWidget {
  const ProfileHeader({required this.profile, super.key});

  static const double _avatarRadius = 40;

  final ProfileView profile;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          clipBehavior: Clip.none,
          children: [
            // Thin brand ring → gold ring → portrait (design `my_profile`).
            Container(
              padding: const EdgeInsets.all(KpSpacing.xxs),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: context.colorScheme.primary,
                  width: 2,
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(KpSpacing.xs),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.colorScheme.secondaryContainer,
                ),
                child: const KpNetworkAvatar(
                  url: kProfileAvatarUrl,
                  radius: _avatarRadius,
                ),
              ),
            ),
            Positioned(
              bottom: -KpSpacing.xs,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: KpSpacing.s,
                  vertical: KpSpacing.xxs,
                ),
                decoration: BoxDecoration(
                  color: context.colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(KpRadii.pill),
                  border: Border.all(
                    color: context.colorScheme.surface,
                    width: 2,
                  ),
                ),
                child: Text(
                  context.l10n.profileLevel(profile.level),
                  style: context.textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.w300,
                    color: context.colorScheme.onSecondaryContainer,
                  ),
                ),
              ),
            ),
          ],
        ),
        const Gap.m(),
        Text(profile.name, style: context.textTheme.headlineMedium),
        const Gap.xxs(),
        Text(
          profile.phone,
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
