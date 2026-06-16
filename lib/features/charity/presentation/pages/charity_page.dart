import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/charity/presentation/cubit/charity_cubit.dart';
import 'package:keenpockets/features/charity/presentation/cubit/charity_state.dart';

/// A pocket-scoped charity drive: progress towards the goal + donate.
class CharityPage extends StatelessWidget {
  const CharityPage({required this.pocketId, super.key});

  final String pocketId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CharityCubit>(
      create: (_) => getIt<CharityCubit>()..load(pocketId),
      child: const _CharityView(),
    );
  }
}

class _CharityView extends StatelessWidget {
  const _CharityView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.charityTitle)),
      body: BlocBuilder<CharityCubit, CharityState>(
        builder: (context, state) {
          return KpAsyncView(
            status: state.status,
            loaded: (context) {
              final d = state.drive;
              if (d == null) return const SizedBox.shrink();
              return Padding(
                padding: const EdgeInsets.all(KpSpacing.l),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(d.title, style: context.textTheme.headlineMedium),
                    const Gap.l(),
                    ClipRRect(
                      borderRadius: KpRadii.allS,
                      child: LinearProgressIndicator(
                        value: d.progress,
                        minHeight: KpSpacing.s,
                      ),
                    ),
                    const Gap.s(),
                    Text(
                      context.l10n.charityRaisedOfGoal(
                        d.raised.format(),
                        d.goal.format(),
                      ),
                      style: context.textTheme.titleMedium,
                    ),
                    const Gap.xs(),
                    Text(
                      context.l10n.charityDonors(d.donorCount),
                      style: context.textTheme.bodySmall?.copyWith(
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const Gap.xl(),
                    KpButton(
                      label: context.l10n.charityDonate,
                      icon: Icons.volunteer_activism,
                      onPressed: () {},
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
