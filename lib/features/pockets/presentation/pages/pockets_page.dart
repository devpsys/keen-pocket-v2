import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/error/failure_localizer.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/core/widgets/soft_text_theme.dart';
import 'package:keenpockets/features/pockets/domain/entities/pocket.dart';
import 'package:keenpockets/features/pockets/presentation/cubit/pockets_cubit.dart';
import 'package:keenpockets/features/pockets/presentation/cubit/pockets_state.dart';
import 'package:keenpockets/features/pockets/presentation/pages/create_pocket_page.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/pockets_app_bar.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/pockets_list_view.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/pockets_tablet_view.dart';

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

  void _create(BuildContext context) {
    Navigator.of(
      context,
    ).push<void>(MaterialPageRoute(builder: (_) => const CreatePocketPage()));
  }

  Widget _body(BuildContext context, List<Pocket> pockets) {
    return context.isExpanded
        ? PocketsTabletView(
            pockets: pockets,
            onOpenPocket: onOpenPocket,
            onCreate: () => _create(context),
          )
        : PocketsListView(
            pockets: pockets,
            onOpenPocket: onOpenPocket,
            onCreate: () => _create(context),
          );
  }

  @override
  Widget build(BuildContext context) {
    // Soften the design-system's chunky weights one step for this page.
    final theme = Theme.of(context);
    return Theme(
      data: theme.copyWith(textTheme: softenTextWeights(theme.textTheme)),
      child: Scaffold(
        appBar: const PocketsAppBar(),
        body: BlocBuilder<PocketsCubit, PocketsState>(
          builder: (context, state) {
            return KpAsyncView(
              status: state.status,
              empty: _body(context, const []),
              failure: KpErrorView(
                message:
                    state.failure?.localizedMessage(context) ??
                    context.l10n.errorGeneric,
                retryLabel: context.l10n.retry,
                onRetry: () => context.read<PocketsCubit>().load(),
              ),
              loaded: (context) => RefreshIndicator(
                onRefresh: () => context.read<PocketsCubit>().load(),
                child: _body(context, state.pockets),
              ),
            );
          },
        ),
      ),
    );
  }
}
