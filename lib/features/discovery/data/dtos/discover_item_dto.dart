import 'package:freezed_annotation/freezed_annotation.dart';

part 'discover_item_dto.freezed.dart';
part 'discover_item_dto.g.dart';

/// Wire model for a discovery result (`GET /discover`). Money as integer kobo;
/// `type`/`badge` are snake_case tokens.
@freezed
abstract class DiscoverItemDto with _$DiscoverItemDto {
  const factory DiscoverItemDto({
    required String id,
    required String name,
    required String type, // pocket | adashi
    required String emoji,
    @JsonKey(name: 'admin_name') required String adminName,
    required String badge, // kyc_verified | official | adashi
    required int contribution, // kobo
    @JsonKey(name: 'contribution_unit') required String contributionUnit,
    @JsonKey(name: 'metric_value') required String metricValue,
    @JsonKey(name: 'metric_is_start_date') required bool metricIsStartDate,
    required double rating,
    @JsonKey(name: 'member_count') required int memberCount,
  }) = _DiscoverItemDto;

  factory DiscoverItemDto.fromJson(Map<String, dynamic> json) =>
      _$DiscoverItemDtoFromJson(json);
}
