import 'package:core/core.dart';

import 'package:keenpockets/features/discovery/domain/entities/discover_item.dart';

/// Browses/searches the pocket & adashi directory (see docs/API_SPEC.md §11).
abstract interface class DiscoveryRepository {
  /// Empty [query] returns the browse feed; otherwise a name search.
  Future<Result<List<DiscoverItem>>> discover(String query);
}
