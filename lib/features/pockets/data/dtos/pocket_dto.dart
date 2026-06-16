import 'package:freezed_annotation/freezed_annotation.dart';

part 'pocket_dto.freezed.dart';
part 'pocket_dto.g.dart';

/// Wire representation of a pocket. Mapped to the [Pocket] entity by
/// `PocketMapper`. `hand_price` is in kobo (integer) on the wire.
@freezed
abstract class PocketDto with _$PocketDto {
  const factory PocketDto({
    required String id,
    required String name,
    @JsonKey(name: 'organiser_id') required String organiserId,
    @JsonKey(name: 'hand_price') required int handPriceKobo,
    @JsonKey(name: 'total_hands') required int totalHands,
    @JsonKey(name: 'filled_hands') required int filledHands,
    @JsonKey(name: 'member_count') required int memberCount,
    @JsonKey(name: 'is_public') @Default(false) bool isPublic,
    @JsonKey(name: 'member_ids') @Default(<String>[]) List<String> memberIds,
  }) = _PocketDto;

  factory PocketDto.fromJson(Map<String, dynamic> json) =>
      _$PocketDtoFromJson(json);
}
