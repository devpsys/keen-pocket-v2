import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/discovery/presentation/cubit/discovery_cubit.dart';
import 'package:keenpockets/features/discovery/presentation/cubit/discovery_state.dart';
import 'package:keenpockets/features/discovery/presentation/view_models/discover_item_view.dart';

/// The Discover tab: search and browse open pockets / public circles.
class DiscoveryPage extends StatelessWidget {
  const DiscoveryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DiscoveryCubit>(
      create: (_) => getIt<DiscoveryCubit>()..load(),
      child: const _DiscoveryView(),
    );
  }
}

class _DiscoveryView extends StatelessWidget {
  const _DiscoveryView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.discoverTitle)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(KpSpacing.m),
            child: KpTextField(
              label: context.l10n.discoverSearchHint,
              onChanged: (q) => context.read<DiscoveryCubit>().search(q),
            ),
          ),
          Expanded(
            child: BlocBuilder<DiscoveryCubit, DiscoveryState>(
              builder: (context, state) {
                return KpAsyncView(
                  status: state.status,
                  empty: KpEmptyView(
                    title: context.l10n.discoverEmptyTitle,
                    message: context.l10n.discoverEmptyMessage,
                  ),
                  loaded: (context) => ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: KpSpacing.m,
                    ),
                    itemCount: state.results.length,
                    itemBuilder: (context, index) {
                      final item = state.results[index];
                      return Card(
                        child: ListTile(
                          leading: Icon(
                            item.type == DiscoverItemType.pocket
                                ? Icons.savings_outlined
                                : Icons.cyclone_outlined,
                          ),
                          title: Text(item.name),
                          subtitle: Text(
                            context.l10n.pocketMembersCount(item.memberCount),
                          ),
                          trailing: Chip(
                            label: Text(
                              item.type == DiscoverItemType.pocket
                                  ? context.l10n.pocketsTitle
                                  : context.l10n.adashiTitle,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
