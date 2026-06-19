import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/core/widgets/kp_network_image.dart';
import 'package:keenpockets/features/profile/presentation/widgets/profile_fixtures.dart';

/// "Recent Reviews" card: reviewer items in tinted, left-accented boxes plus a
/// see-all action (design `my_profile`).
class ProfileReviews extends StatelessWidget {
  const ProfileReviews({this.onSeeAll, super.key});

  final VoidCallback? onSeeAll;

  @override
  Widget build(BuildContext context) {
    return KpCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            context.l10n.profileRecentReviews,
            style: context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
          const Gap.l(),
          for (final r in kProfileReviews) ...[
            _ReviewItem(review: r),
            const Gap.m(),
          ],
          const Gap.xs(),
          Center(
            child: GestureDetector(
              onTap: onSeeAll,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    context.l10n.profileSeeAllReviews(kProfileReviewCount),
                    style: context.textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: context.colorScheme.primary,
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
            ),
          ),
        ],
      ),
    );
  }
}

class _ReviewItem extends StatelessWidget {
  const _ReviewItem({required this.review});

  final ProfileReview review;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLow,
        borderRadius: KpRadii.allL,
        border: Border(
          left: BorderSide(color: context.colorScheme.primary, width: 4),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              KpNetworkAvatar(url: review.avatarUrl, radius: KpSpacing.l),
              const Gap.s(horizontal: true),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review.author,
                      style: context.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const _Stars(),
                  ],
                ),
              ),
              Text(
                review.timeAgo,
                style: context.textTheme.labelSmall?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          const Gap.s(),
          Text(
            review.body,
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}

class _Stars extends StatelessWidget {
  const _Stars();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 0; i < 5; i++)
          Icon(
            Icons.star_rounded,
            size: KpSpacing.m,
            color: context.colors.warning,
          ),
      ],
    );
  }
}
