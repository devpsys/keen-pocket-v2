import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:keenpockets/app/app_nav.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/core/widgets/kp_network_image.dart';
import 'package:keenpockets/features/gamification/presentation/cubit/leaderboard_cubit.dart';
import 'package:keenpockets/features/gamification/presentation/cubit/leaderboard_state.dart';
import 'package:keenpockets/features/gamification/presentation/leaderboard_fixtures.dart';
import 'package:keenpockets/features/gamification/presentation/widgets/leaderboard_tablet_widgets.dart';
import 'package:keenpockets/features/gamification/presentation/widgets/leaderboard_widgets.dart';

/// Keens leaderboard (designs `leaderboard_rankings` / `_tablet`): a podium +
/// ranked list with the user's standing on phone, and a podium/standing/stats
/// dashboard on tablet. Presentation-only.
class LeaderboardPage extends StatelessWidget {
  const LeaderboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LeaderboardCubit>(
      create: (_) => getIt<LeaderboardCubit>()..load(),
      child: const _LeaderboardView(),
    );
  }
}

class _LeaderboardView extends StatelessWidget {
  const _LeaderboardView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeaderboardCubit, LeaderboardState>(
      builder: (context, state) {
        final cubit = context.read<LeaderboardCubit>();

        if (context.isExpanded) {
          return AppTabletShell(
            body: Scaffold(
              appBar: _appBar(context, title: context.l10n.leaderboardTitle),
              body: KpAsyncView(
                status: state.status,
                loaded: (context) => LeaderboardTabletView(
                  state: state,
                  onScope: cubit.setScope,
                ),
              ),
            ),
          );
        }

        return Scaffold(
          appBar: _appBar(context, title: context.l10n.brandWordmark),
          body: KpAsyncView(
            status: state.status,
            loaded: (context) =>
                LeaderboardPhoneView(state: state, onScope: cubit.setScope),
          ),
        );
      },
    );
  }

  PreferredSizeWidget _appBar(BuildContext context, {required String title}) {
    return AppBar(
      foregroundColor: context.colorScheme.primary,
      scrolledUnderElevation: 0,
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
          onPressed: () {},
          icon: Icon(
            KpIcons.notificationsOutlined,
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
                url: kLeaderboardUserAvatar,
                radius: KpSpacing.s,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
