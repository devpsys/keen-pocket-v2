import 'package:freezed_annotation/freezed_annotation.dart';

part 'plan_dto.freezed.dart';
part 'plan_dto.g.dart';

/// Wire model for a plan (`GET /plans`). Money as integer kobo; `cadence` token.
@freezed
abstract class PlanDto with _$PlanDto {
  const factory PlanDto({
    required String id,
    required String name,
    @JsonKey(name: 'period_label') required String periodLabel,
    required String cadence, // weekly | monthly
    required int bought,
    required int pending,
    required int deferred,
    required int spent, // kobo
    required int budget, // kobo
  }) = _PlanDto;

  factory PlanDto.fromJson(Map<String, dynamic> json) =>
      _$PlanDtoFromJson(json);
}
