// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pocket_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PocketDto _$PocketDtoFromJson(Map<String, dynamic> json) => _PocketDto(
  id: json['id'] as String,
  name: json['name'] as String,
  organiserId: json['organiser_id'] as String,
  handPriceKobo: (json['hand_price'] as num).toInt(),
  totalHands: (json['total_hands'] as num).toInt(),
  filledHands: (json['filled_hands'] as num).toInt(),
  memberCount: (json['member_count'] as num).toInt(),
  isPublic: json['is_public'] as bool? ?? false,
  memberIds:
      (json['member_ids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
);

Map<String, dynamic> _$PocketDtoToJson(_PocketDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'organiser_id': instance.organiserId,
      'hand_price': instance.handPriceKobo,
      'total_hands': instance.totalHands,
      'filled_hands': instance.filledHands,
      'member_count': instance.memberCount,
      'is_public': instance.isPublic,
      'member_ids': instance.memberIds,
    };
