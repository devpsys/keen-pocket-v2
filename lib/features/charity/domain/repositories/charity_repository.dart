import 'package:core/core.dart';

import 'package:keenpockets/features/charity/domain/entities/charity_drive.dart';

/// Reads a pocket's charity drive (see docs/API_SPEC.md §7).
abstract interface class CharityRepository {
  Future<Result<CharityDrive>> getDrive(String pocketId);
}
