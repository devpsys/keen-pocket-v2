import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'charity_drive.freezed.dart';

/// A pocket's charity drive (`GET /pockets/{id}/charity`). Domain entity.
@freezed
abstract class CharityDrive with _$CharityDrive {
  const factory CharityDrive({
    required String title,
    required Money goal,
    required Money raised,
    required int donorCount,
  }) = _CharityDrive;

  const CharityDrive._();

  double get progress =>
      goal.kobo == 0 ? 0 : (raised.kobo / goal.kobo).clamp(0, 1);
}
