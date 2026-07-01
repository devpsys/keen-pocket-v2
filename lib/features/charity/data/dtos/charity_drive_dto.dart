import 'package:freezed_annotation/freezed_annotation.dart';

part 'charity_drive_dto.freezed.dart';
part 'charity_drive_dto.g.dart';

/// Wire model for `GET /pockets/{id}/charity` (money as integer kobo).
@freezed
abstract class CharityDriveDto with _$CharityDriveDto {
  const factory CharityDriveDto({
    required String title,
    required int goal, // kobo
    required int raised, // kobo
    @JsonKey(name: 'donor_count') required int donorCount,
  }) = _CharityDriveDto;

  factory CharityDriveDto.fromJson(Map<String, dynamic> json) =>
      _$CharityDriveDtoFromJson(json);
}
