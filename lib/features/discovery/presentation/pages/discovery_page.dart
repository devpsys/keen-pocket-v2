import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/core/widgets/kp_network_image.dart';
import 'package:keenpockets/features/discovery/presentation/cubit/discovery_cubit.dart';
import 'package:keenpockets/features/discovery/presentation/cubit/discovery_state.dart';
import 'package:keenpockets/features/discovery/presentation/pages/explore_adashi_page.dart';
import 'package:keenpockets/features/discovery/presentation/pages/insights_reports_page.dart';
import 'package:keenpockets/features/discovery/presentation/view_models/discover_item_view.dart';
import 'package:keenpockets/features/discovery/presentation/widgets/discover_filter_chips.dart';
import 'package:keenpockets/features/discovery/presentation/widgets/discover_pocket_card.dart';
import 'package:keenpockets/features/discovery/presentation/widgets/discover_tip_card.dart';
import 'package:keenpockets/features/discovery/presentation/widgets/discovery_fixtures.dart';

/// The Discover tab (design `discover_pockets`): search + categories, then a
/// list/grid of public pockets & circles to join.
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
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(left: KpSpacing.m),
          child: Center(
            child: KpNetworkAvatar(
              url: kDiscoverAvatarUrl,
              radius: KpSpacing.m,
            ),
          ),
        ),
        title: Text(
          context.l10n.discoverTitle,
          style: context.textTheme.titleLarge?.copyWith(
            color: context.colorScheme.primary,
          ),
        ),
        actions: [
          IconButton(
            tooltip: context.l10n.insightsTitle,
            onPressed: () => Navigator.of(context).push<void>(
              MaterialPageRoute(builder: (_) => const InsightsReportsPage()),
            ),
            icon: const Icon(KpIcons.trend),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(KpIcons.notificationsOutlined),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(KpSpacing.m),
        children: [
          KpTextField(
            label: context.l10n.discoverSearchPlaceholder,
            onChanged: (q) => context.read<DiscoveryCubit>().search(q),
          ),
          const Gap.m(),
          const DiscoverFilterChips(),
          const Gap.l(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n.discoverPopularPockets,
                style: context.textTheme.titleLarge,
              ),
              Text(
                context.l10n.discoverViewAll.toUpperCase(),
                style: context.textTheme.labelLarge?.copyWith(
                  color: context.colorScheme.primary,
                ),
              ),
            ],
          ),
          const Gap.s(),
          const _Results(),
          const Gap.xl(),
          const DiscoverTipCard(),
          const Gap.l(),
        ],
      ),
    );
  }
}

class _Results extends StatelessWidget {
  const _Results();

  void _open(BuildContext context, String id) =>
      Navigator.of(context).push<void>(
        MaterialPageRoute(builder: (_) => ExploreAdashiPage(circleId: id)),
      );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiscoveryCubit, DiscoveryState>(
      builder: (context, state) {
        return KpAsyncView(
          status: state.status,
          empty: KpEmptyView(
            title: context.l10n.discoverEmptyTitle,
            message: context.l10n.discoverEmptyMessage,
          ),
          loaded: (context) => context.isExpanded
              ? _ResultsGrid(
                  results: state.results,
                  onOpen: (id) => _open(context, id),
                )
              : _ResultsList(
                  results: state.results,
                  onOpen: (id) => _open(context, id),
                ),
        );
      },
    );
  }
}

class _ResultsList extends StatelessWidget {
  const _ResultsList({required this.results, required this.onOpen});

  final List<DiscoverItemView> results;
  final ValueChanged<String> onOpen;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final item in results) ...[
          DiscoverPocketCard(item: item, onTap: () => onOpen(item.id)),
          const Gap.m(),
        ],
      ],
    );
  }
}

class _ResultsGrid extends StatelessWidget {
  const _ResultsGrid({required this.results, required this.onOpen});

  static const int _columns = 2;

  final List<DiscoverItemView> results;
  final ValueChanged<String> onOpen;

  @override
  Widget build(BuildContext context) {
    final rows = <List<DiscoverItemView>>[
      for (var i = 0; i < results.length; i += _columns)
        results.sublist(i, (i + _columns).clamp(0, results.length)),
    ];
    return Column(
      children: [
        for (final row in rows) ...[
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (var c = 0; c < _columns; c++) ...[
                  if (c > 0) const Gap.m(horizontal: true),
                  Expanded(
                    child: c < row.length
                        ? DiscoverPocketCard(
                            item: row[c],
                            onTap: () => onOpen(row[c].id),
                          )
                        : const SizedBox.shrink(),
                  ),
                ],
              ],
            ),
          ),
          const Gap.m(),
        ],
      ],
    );
  }
}
