import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/error/failure_localizer.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/pockets/presentation/cubit/pockets_cubit.dart';
import 'package:keenpockets/features/pockets/presentation/cubit/pockets_state.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/pocket_card.dart';

/// The Pockets tab: lists the current user's pockets with the universal states.
class PocketsPage extends StatelessWidget {
  const PocketsPage({this.onOpenPocket, super.key});

  /// Navigates to a pocket's detail (wired by the router).
  final ValueChanged<String>? onOpenPocket;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PocketsCubit>(
      create: (_) => getIt<PocketsCubit>()..load(),
      child: _PocketsView(onOpenPocket: onOpenPocket),
    );
  }
}

class _PocketsView extends StatelessWidget {
  const _PocketsView({this.onOpenPocket});

  final ValueChanged<String>? onOpenPocket;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.pocketsTitle)),
      body: BlocBuilder<PocketsCubit, PocketsState>(
        builder: (context, state) {
          return KpAsyncView(
            status: state.status,
            empty: KpEmptyView(
              title: context.l10n.pocketsEmptyTitle,
              message: context.l10n.pocketsEmptyMessage,
            ),
            failure: KpErrorView(
              message:
                  state.failure?.localizedMessage(context) ??
                  context.l10n.errorGeneric,
              retryLabel: context.l10n.retry,
              onRetry: () => context.read<PocketsCubit>().load(),
            ),
            loaded: (context) => RefreshIndicator(
              onRefresh: () => context.read<PocketsCubit>().load(),
              child: ListView.separated(
                padding: const EdgeInsets.all(KpSpacing.m),
                itemCount: state.pockets.length,
                separatorBuilder: (_, _) => const Gap.s(),
                itemBuilder: (context, index) {
                  final pocket = state.pockets[index];
                  return PocketCard(
                    pocket: pocket,
                    onTap: () => onOpenPocket?.call(pocket.id),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
