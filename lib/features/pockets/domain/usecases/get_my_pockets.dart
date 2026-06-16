import 'package:core/core.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/pockets/domain/entities/pocket.dart';
import 'package:keenpockets/features/pockets/domain/repositories/pocket_repository.dart';

/// Returns the current user's pockets.
@injectable
class GetMyPockets implements UseCase<List<Pocket>, NoParams> {
  const GetMyPockets(this._repository);

  final PocketRepository _repository;

  @override
  Future<Result<List<Pocket>>> call(NoParams params) =>
      _repository.getMyPockets();
}
