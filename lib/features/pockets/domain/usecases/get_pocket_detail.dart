import 'package:core/core.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/pockets/domain/entities/pocket.dart';
import 'package:keenpockets/features/pockets/domain/repositories/pocket_repository.dart';

/// Returns a single pocket by id.
@injectable
class GetPocketDetail implements UseCase<Pocket, String> {
  const GetPocketDetail(this._repository);

  final PocketRepository _repository;

  @override
  Future<Result<Pocket>> call(String id) => _repository.getPocket(id);
}
