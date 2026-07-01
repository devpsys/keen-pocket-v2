import 'package:core/core.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/discovery/domain/entities/discover_item.dart';
import 'package:keenpockets/features/discovery/domain/repositories/discovery_repository.dart';

/// Browses/searches the directory (`GET /discover?q=`). Params = query string.
@injectable
class DiscoverGroups implements UseCase<List<DiscoverItem>, String> {
  const DiscoverGroups(this._repository);

  final DiscoveryRepository _repository;

  @override
  Future<Result<List<DiscoverItem>>> call(String query) =>
      _repository.discover(query);
}
