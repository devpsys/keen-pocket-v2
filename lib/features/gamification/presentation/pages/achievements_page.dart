import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:keenpockets/app/app_nav.dart';
import 'package:keenpockets/app/router/app_router.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/core/widgets/kp_network_image.dart';
import 'package:keenpockets/features/gamification/presentation/achievements_fixtures.dart';
import 'package:keenpockets/features/gamification/presentation/cubit/achievements_cubit.dart';
import 'package:keenpockets/features/gamification/presentation/cubit/achievements_state.dart';
import 'package:keenpockets/features/gamification/presentation/pages/leaderboard_page.dart';
import 'package:keenpockets/features/gamification/presentation/widgets/achievements_tablet_widgets.dart';
import 'package:keenpockets/features/gamification/presentation/widgets/achievements_widgets.dart';

/// Achievements & badges (designs `my_achievements_badges` / `_tablet`): streak,
/// freezes, badges and milestones. A leaderboard action sits in the app bar.
class AchievementsPage extends StatelessWidget {
  const AchievementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AchievementsCubit>(
      create: (_) => getIt<AchievementsCubit>()..load(),
      child: const _AchievementsView(),
    );
  }
}

class _AchievementsView extends StatelessWidget {
  const _AchievementsView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AchievementsCubit, AchievementsState>(
      builder: (context, state) {
        final body = KpAsyncView(
          status: state.status,
          loaded: (context) {
            final data = state.data;
            if (data == null) return const SizedBox.shrink();
            return context.isExpanded
                ? AchievementsTabletView(data: data)
                : AchievementsPhoneView(
                    data: data,
                    onViewPockets: () =>
                        context.go('${AppRoutes.home}?tab=$kPocketsTabIndex'),
                  );
          },
        );

        if (context.isExpanded) {
          return AppTabletShell(
            body: Scaffold(
              appBar: _appBar(context, title: context.l10n.achievementsMyTitle),
              body: body,
            ),
          );
        }
        return Scaffold(
          appBar: _appBar(
            context,
            title: context.l10n.brandWordmark,
            showBack: true,
          ),
          body: body,
        );
      },
    );
  }

  PreferredSizeWidget _appBar(
    BuildContext context, {
    required String title,
    bool showBack = false,
  }) {
    return AppBar(
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 0,
      leading: showBack
          ? IconButton(
              onPressed: () => Navigator.of(context).maybePop(),
              icon: Icon(
                Icons.arrow_back_rounded,
                color: context.colorScheme.primary,
              ),
            )
          : null,
      shape: Border(
        bottom: BorderSide(
          color: context.colorScheme.surfaceContainerHighest,
          width: 4,
        ),
      ),
      title: Text(
        title,
        style: context.textTheme.titleLarge?.copyWith(
          color: context.colorScheme.primary,
        ),
      ),
      actions: [
        IconButton(
          tooltip: context.l10n.leaderboardTitle,
          onPressed: () => Navigator.of(context).push<void>(
            MaterialPageRoute(builder: (_) => const LeaderboardPage()),
          ),
          icon: Icon(
            Icons.leaderboard_rounded,
            color: context.colorScheme.primary,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: KpSpacing.m),
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(KpSpacing.xxs),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: context.colorScheme.primaryContainer,
                  width: 2,
                ),
              ),
              child: const KpNetworkAvatar(
                url: kAchievementsMascotUrl,
                radius: KpSpacing.s,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
