import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/discovery/domain/entities/discover_item.dart';
import 'package:keenpockets/features/discovery/domain/usecases/discover_groups.dart';
import 'package:keenpockets/features/discovery/presentation/cubit/discovery_state.dart';
import 'package:keenpockets/features/discovery/presentation/view_models/discover_item_view.dart'
    as vm;

/// Browses/searches the directory via [DiscoverGroups] and projects results into
/// [DiscoverItemView]s.
@injectable
class DiscoveryCubit extends Cubit<DiscoveryState> {
  DiscoveryCubit(this._discover) : super(const DiscoveryState());

  final DiscoverGroups _discover;

  Future<void> load() => _run('');

  Future<void> search(String query) => _run(query);

  Future<void> _run(String query) async {
    emit(
      state.copyWith(status: StateStatus.loading, query: query, failure: null),
    );
    final result = await _discover(query);
    emit(
      result.fold(
        (failure) =>
            state.copyWith(status: StateStatus.failure, failure: failure),
        (items) {
          final views = items.map((i) => i.toView()).toList();
          return state.copyWith(
            status: views.isEmpty ? StateStatus.empty : StateStatus.success,
            results: views,
            failure: null,
          );
        },
      ),
    );
  }
}

extension on DiscoverItem {
  vm.DiscoverItemView toView() => vm.DiscoverItemView(
    id: id,
    name: name,
    type: switch (type) {
      DiscoverItemType.pocket => vm.DiscoverItemType.pocket,
      DiscoverItemType.adashi => vm.DiscoverItemType.adashi,
    },
    emoji: emoji,
    adminName: adminName,
    badge: switch (badge) {
      DiscoverBadge.kycVerified => vm.DiscoverBadge.kycVerified,
      DiscoverBadge.official => vm.DiscoverBadge.official,
      DiscoverBadge.adashi => vm.DiscoverBadge.adashi,
    },
    contribution: contribution,
    contributionUnit: contributionUnit,
    metricValue: metricValue,
    metricIsStartDate: metricIsStartDate,
    rating: rating,
    memberCount: memberCount,
  );
}
