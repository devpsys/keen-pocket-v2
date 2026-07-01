import 'package:core/core.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/charity/domain/entities/charity_drive.dart';
import 'package:keenpockets/features/charity/domain/repositories/charity_repository.dart';

/// Dev-only stub so the charity drive renders without a backend. Mirrors the old
/// presentation placeholder. `prod`/`staging` use [CharityRepositoryImpl].
@LazySingleton(as: CharityRepository, env: ['dev'])
class FakeCharityRepository implements CharityRepository {
  const FakeCharityRepository();

  @override
  Future<Result<CharityDrive>> getDrive(String pocketId) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return const Right(
      CharityDrive(
        title: 'Support the Relief Fund',
        goal: Money(20000000),
        raised: Money(12000000),
        donorCount: 24,
      ),
    );
  }
}
