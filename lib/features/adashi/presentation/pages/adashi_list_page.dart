import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/adashi/presentation/cubit/adashi_list_cubit.dart';
import 'package:keenpockets/features/adashi/presentation/cubit/adashi_list_state.dart';
import 'package:keenpockets/features/adashi/presentation/widgets/adashi_card.dart';

/// The Adashi tab: rotating savings circles with the universal states.
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.adashiTitle)),
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
              child: ListView.separated(
                padding: const EdgeInsets.all(KpSpacing.m),
                itemCount: state.circles.length,
                separatorBuilder: (_, _) => const Gap.s(),
                itemBuilder: (context, index) {
                  final adashi = state.circles[index];
                  return AdashiCard(
                    adashi: adashi,
                    onTap: () => onOpenAdashi?.call(adashi.id),
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
