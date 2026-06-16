import 'package:core/core.dart';
import 'package:keenpockets/features/pockets/data/dtos/pocket_dto.dart';
import 'package:keenpockets/features/pockets/domain/entities/pocket.dart';

/// DTO → entity conversion (the only place the wire shape becomes domain).
extension PocketDtoMapper on PocketDto {
  Pocket toEntity() => Pocket(
    id: id,
    name: name,
    organiserId: organiserId,
    handPrice: Money(handPriceKobo),
    totalHands: totalHands,
    filledHands: filledHands,
    memberCount: memberCount,
    isPublic: isPublic,
    memberIds: memberIds.toSet(),
  );
}
