import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/app/app_nav.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/profile/presentation/widgets/public_profile_fixtures.dart';
import 'package:keenpockets/features/profile/presentation/widgets/public_profile_group_card.dart';
import 'package:keenpockets/features/profile/presentation/widgets/public_profile_identity.dart';
import 'package:keenpockets/features/profile/presentation/widgets/public_profile_identity_card.dart';
import 'package:keenpockets/features/profile/presentation/widgets/public_profile_legend_card.dart';
import 'package:keenpockets/features/profile/presentation/widgets/public_profile_ratings.dart';

/// Public profile view (design `public_profile`): how a member appears to the
/// community — identity, their groups, ratings received, and a reputation
/// banner. Presentation-only, rendered from placeholder fixtures.
class PublicProfilePage extends StatelessWidget {
  const PublicProfilePage({super.key});

  static const double _maxWidth = 640;

  @override
  Widget build(BuildContext context) {
    return AppTabletShell(
      body: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          title: Text(
            context.l10n.brandWordmark,
            style: context.textTheme.titleLarge?.copyWith(
              color: context.colorScheme.primary,
            ),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(KpIcons.settings)),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(KpSpacing.m),
          children: [
            if (context.isExpanded)
              const _TabletLayout()
            else
              const _PhoneLayout(),
          ],
        ),
      ),
    );
  }
}

/// Section header: "Groups by Amaka" + View All link.
class _GroupsHeader extends StatelessWidget {
  const _GroupsHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            context.l10n.publicProfileGroupsBy(kPublicName),
            style: context.textTheme.titleLarge,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text(
          context.l10n.profileViewAll,
          style: context.textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w400,
            color: context.colorScheme.primary,
          ),
        ),
      ],
    );
  }
}

/// Phone layout: a single centered column (design `public_profile`).
class _PhoneLayout extends StatelessWidget {
  const _PhoneLayout();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: PublicProfilePage._maxWidth,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Gap.l(),
            const PublicProfileIdentity(),
            const Gap.xl(),
            const _GroupsHeader(),
            const Gap.m(),
            for (final g in kPublicGroups) ...[
              PublicProfileGroupCard(group: g),
              const Gap.m(),
            ],
            const Gap.l(),
            const PublicProfileRatings(),
            const Gap.xl(),
            const PublicProfileLegendCard(),
            const Gap.l(),
          ],
        ),
      ),
    );
  }
}

/// Tablet layout: a three-column canvas (design `public_profile_tablet`) —
/// identity + legend on the left, groups in the centre, ratings on the right.
class _TabletLayout extends StatelessWidget {
  const _TabletLayout();

  static const double _maxWidth = 1200;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: _maxWidth),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: KpSpacing.l),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                flex: 4,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    PublicProfileIdentityCard(),
                    Gap.l(),
                    PublicProfileLegendCard(),
                  ],
                ),
              ),
              const Gap.l(horizontal: true),
              Expanded(
                flex: 5,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const _GroupsHeader(),
                    const Gap.m(),
                    for (final g in kPublicGroups) ...[
                      PublicProfileGroupCard(group: g),
                      const Gap.m(),
                    ],
                  ],
                ),
              ),
              const Gap.l(horizontal: true),
              const Expanded(flex: 3, child: PublicProfileRatings()),
            ],
          ),
        ),
      ),
    );
  }
}
