import 'package:core/core.dart';

import 'package:keenpockets/features/pockets/domain/entities/pocket.dart';

/// Domain contract for pockets. Implemented in data; consumed by use cases.
abstract interface class PocketRepository {
  /// Pockets the current user organises or is a member of.
  Future<Result<List<Pocket>>> getMyPockets();

  /// A single pocket by id (detail view).
  Future<Result<Pocket>> getPocket(String id);
}
