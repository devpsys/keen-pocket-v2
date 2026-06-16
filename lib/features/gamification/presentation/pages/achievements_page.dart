import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/gamification/presentation/cubit/achievements_cubit.dart';
import 'package:keenpockets/features/gamification/presentation/cubit/achievements_state.dart';

/// Achievements: earned badges + the Keens leaderboard.
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
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.achievementsTitle)),
      body: BlocBuilder<AchievementsCubit, AchievementsState>(
        builder: (context, state) {
          return KpAsyncView(
            status: state.status,
            loaded: (context) {
              final data = state.data;
              if (data == null) return const SizedBox.shrink();
              return ListView(
                padding: const EdgeInsets.all(KpSpacing.l),
                children: [
                  Text(
                    context.l10n.badgesTitle,
                    style: context.textTheme.titleLarge,
                  ),
                  const Gap.s(),
                  Wrap(
                    spacing: KpSpacing.s,
                    runSpacing: KpSpacing.s,
                    children: [
                      for (final b in data.badges)
                        Chip(
                          avatar: Icon(
                            b.earned ? Icons.emoji_events : Icons.lock_outline,
                            size: KpSpacing.m,
                            color: b.earned
                                ? context.colors.warning
                                : context.colorScheme.onSurfaceVariant,
                          ),
                          label: Text(b.label),
                        ),
                    ],
                  ),
                  const Gap.l(),
                  Text(
                    context.l10n.leaderboardTitle,
                    style: context.textTheme.titleLarge,
                  ),
                  const Gap.s(),
                  for (final e in data.leaderboard)
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: CircleAvatar(child: Text('${e.rank}')),
                      title: Text(e.name),
                      tileColor: e.isMe
                          ? context.colorScheme.primaryContainer
                          : null,
                      trailing: Text(
                        context.l10n.profileKeens(e.keens),
                        style: context.textTheme.titleMedium,
                      ),
                    ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
