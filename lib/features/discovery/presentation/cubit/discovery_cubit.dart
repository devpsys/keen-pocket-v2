import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/discovery/presentation/cubit/discovery_state.dart';
import 'package:keenpockets/features/discovery/presentation/view_models/discover_item_view.dart';

/// PRESENTATION-ONLY: in-memory search over placeholder data; swap for a use
/// case (directory search) later.
@injectable
class DiscoveryCubit extends Cubit<DiscoveryState> {
  DiscoveryCubit() : super(const DiscoveryState());

  static const _all = [
    DiscoverItemView(
      id: 'p10',
      name: 'School Fees Pocket',
      type: DiscoverItemType.pocket,
      memberCount: 12,
    ),
    DiscoverItemView(
      id: 'a10',
      name: 'Traders Adashi',
      type: DiscoverItemType.adashi,
      memberCount: 8,
    ),
    DiscoverItemView(
      id: 'p11',
      name: 'Rent Savings',
      type: DiscoverItemType.pocket,
      memberCount: 5,
    ),
  ];

  Future<void> load() async => _emit('');

  Future<void> search(String query) async => _emit(query);

  void _emit(String query) {
    emit(state.copyWith(status: StateStatus.loading, query: query));
    final q = query.trim().toLowerCase();
    final results = q.isEmpty
        ? _all
        : _all.where((i) => i.name.toLowerCase().contains(q)).toList();
    emit(
      state.copyWith(
        status: results.isEmpty ? StateStatus.empty : StateStatus.success,
        results: results,
      ),
    );
  }
}
