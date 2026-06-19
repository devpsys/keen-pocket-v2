import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/adashi/presentation/cubit/adashi_list_cubit.dart';
import 'package:keenpockets/features/adashi/presentation/cubit/adashi_list_state.dart';
import 'package:keenpockets/features/adashi/presentation/view_models/adashi_view.dart';
import 'package:keenpockets/features/adashi/presentation/widgets/adashi_app_bar.dart';
import 'package:keenpockets/features/adashi/presentation/widgets/adashi_list_view.dart';
import 'package:keenpockets/features/adashi/presentation/widgets/adashi_tablet_view.dart';

/// The Adashi tab: rotating savings circles with the universal states. Phone
/// uses a chunky card list (design `adashi_circles`); tablet uses a card-grid
/// cockpit (design `adashi_circles_tablet`).
class AdashiListPage extends StatelessWidget {
  const AdashiListPage({this.onOpenAdashi, super.key});

  final ValueChanged<String>? onOpenAdashi;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AdashiListCubit>(
      create: (_) => getIt<AdashiListCubit>()..load(),
      child: _AdashiListView(onOpenAdashi: onOpenAdashi),
    );
  }
}

class _AdashiListView extends StatelessWidget {
  const _AdashiListView({this.onOpenAdashi});

  final ValueChanged<String>? onOpenAdashi;

  void _create(BuildContext context) {
    // Create flow lands in a later Wave-3 screen; no-op for now.
  }

  Widget _body(BuildContext context, List<AdashiSummaryView> circles) {
    return context.isExpanded
        ? AdashiTabletView(
            circles: circles,
            onOpenAdashi: onOpenAdashi,
            onCreate: () => _create(context),
          )
        : AdashiListView(circles: circles, onOpenAdashi: onOpenAdashi);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: context.isExpanded ? null : const AdashiAppBar(),
      floatingActionButton: context.isExpanded
          ? null
          : FloatingActionButton.extended(
              onPressed: () => _create(context),
              backgroundColor: context.colorScheme.secondaryContainer,
              foregroundColor: context.colorScheme.onSecondaryContainer,
              icon: const Icon(KpIcons.add),
              label: Text(context.l10n.adashiCreate),
            ),
      body: BlocBuilder<AdashiListCubit, AdashiListState>(
        builder: (context, state) {
          return KpAsyncView(
            status: state.status,
            empty: KpEmptyView(
              title: context.l10n.adashiEmptyTitle,
              message: context.l10n.adashiEmptyMessage,
            ),
            loaded: (context) => RefreshIndicator(
              onRefresh: () => context.read<AdashiListCubit>().load(),
              child: _body(context, state.circles),
            ),
          );
        },
      ),
    );
  }
}
