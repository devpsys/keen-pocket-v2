import 'package:core/core.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/charity/domain/entities/charity_drive.dart';
import 'package:keenpockets/features/charity/domain/repositories/charity_repository.dart';

/// Fetches a pocket's charity drive (`GET /pockets/{id}/charity`).
@injectable
class GetCharityDrive implements UseCase<CharityDrive, String> {
  const GetCharityDrive(this._repository);

  final CharityRepository _repository;

  @override
  Future<Result<CharityDrive>> call(String pocketId) =>
      _repository.getDrive(pocketId);
}
