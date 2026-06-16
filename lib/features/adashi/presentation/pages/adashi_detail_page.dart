import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/adashi/presentation/cubit/adashi_detail_cubit.dart';
import 'package:keenpockets/features/adashi/presentation/cubit/adashi_detail_state.dart';
import 'package:keenpockets/features/adashi/presentation/view_models/adashi_view.dart';
import 'package:keenpockets/features/adashi/presentation/widgets/rotation_timeline.dart';

/// Detail for one Adashi: current cycle, rotation mode, and the rotation order.
class AdashiDetailPage extends StatelessWidget {
  const AdashiDetailPage({required this.adashiId, super.key});

  final String adashiId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AdashiDetailCubit>(
      create: (_) => getIt<AdashiDetailCubit>()..load(adashiId),
      child: const _AdashiDetailView(),
    );
  }
}

class _AdashiDetailView extends StatelessWidget {
  const _AdashiDetailView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.adashiTitle)),
      body: BlocBuilder<AdashiDetailCubit, AdashiDetailState>(
        builder: (context, state) {
          final adashi = state.adashi;
          return KpAsyncView(
            status: state.status,
            empty: KpEmptyView(
              title: context.l10n.adashiEmptyTitle,
              message: context.l10n.adashiEmptyMessage,
            ),
            loaded: (context) {
              if (adashi == null) return const SizedBox.shrink();
              final summary = adashi.summary;
              return ListView(
                padding: const EdgeInsets.all(KpSpacing.l),
                children: [
                  Text(summary.name, style: context.textTheme.headlineMedium),
                  const Gap.s(),
                  Wrap(
                    spacing: KpSpacing.xs,
                    children: [
                      Chip(
                        label: Text(
                          summary.mode == RotationMode.auto
                              ? context.l10n.adashiModeAuto
                              : context.l10n.adashiModeManual,
                        ),
                      ),
                      Chip(
                        label: Text(
                          context.l10n.adashiCycleProgress(
                            summary.currentCycle,
                            summary.totalCycles,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap.m(),
                  Text(
                    '${context.l10n.adashiPerCycle}: ${summary.perCycle.format()}',
                    style: context.textTheme.titleMedium,
                  ),
                  if (adashi.currentReceiver != null) ...[
                    const Gap.xs(),
                    Text(
                      context.l10n.adashiCurrentReceiver(
                        adashi.currentReceiver!.name,
                      ),
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.colorScheme.primary,
                      ),
                    ),
                  ],
                  const Gap.l(),
                  Text(
                    context.l10n.adashiRotationTitle,
                    style: context.textTheme.titleLarge,
                  ),
                  const Gap.m(),
                  RotationTimeline(members: adashi.rotation),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
