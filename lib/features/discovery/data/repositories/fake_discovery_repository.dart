import 'package:core/core.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/discovery/domain/entities/discover_item.dart';
import 'package:keenpockets/features/discovery/domain/repositories/discovery_repository.dart';

/// Dev-only stub: in-memory browse/search so the directory renders without a
/// backend. Mirrors the old placeholder. `prod`/`staging` use
/// [DiscoveryRepositoryImpl].
@LazySingleton(as: DiscoveryRepository, env: ['dev'])
class FakeDiscoveryRepository implements DiscoveryRepository {
  const FakeDiscoveryRepository();

  static const _all = [
    DiscoverItem(
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
    DiscoverItem(
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
    DiscoverItem(
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

  @override
  Future<Result<List<DiscoverItem>>> discover(String query) async {
    await Future<void>.delayed(const Duration(milliseconds: 250));
    final q = query.trim().toLowerCase();
    final results = q.isEmpty
        ? _all
        : _all.where((i) => i.name.toLowerCase().contains(q)).toList();
    return Right(results);
  }
}
