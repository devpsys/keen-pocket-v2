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
      name: 'Ketu Foodies',
      type: DiscoverItemType.pocket,
      emoji: '🛒',
      adminName: 'Adeola',
      badge: DiscoverBadge.kycVerified,
      contribution: Money(500000),
      contributionUnit: 'mo',
      metricValue: '18/20',
      metricIsStartDate: false,
      rating: 4.8,
      memberCount: 18,
    ),
    DiscoverItemView(
      id: 'p11',
      name: 'UI 2024 Fees',
      type: DiscoverItemType.pocket,
      emoji: '🏫',
      adminName: 'Student Union',
      badge: DiscoverBadge.official,
      contribution: Money(5000000),
      contributionUnit: 'term',
      metricValue: '45 Joined',
      metricIsStartDate: false,
      rating: 5,
      memberCount: 45,
    ),
    DiscoverItemView(
      id: 'a10',
      name: 'Esusu Masters',
      type: DiscoverItemType.adashi,
      emoji: '🔄',
      adminName: 'Bankole',
      badge: DiscoverBadge.adashi,
      contribution: Money(1000000),
      contributionUnit: 'cycle',
      metricValue: 'June 1st',
      metricIsStartDate: true,
      rating: 4.2,
      memberCount: 8,
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
