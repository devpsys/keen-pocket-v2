import 'package:core/core.dart';

import 'package:keenpockets/features/charity/data/dtos/charity_drive_dto.dart';
import 'package:keenpockets/features/charity/domain/entities/charity_drive.dart';

extension CharityDriveDtoMapper on CharityDriveDto {
  CharityDrive toEntity() => CharityDrive(
    title: title,
    goal: Money(goal),
    raised: Money(raised),
    donorCount: donorCount,
  );
}
