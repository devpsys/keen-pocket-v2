// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlanDto _$PlanDtoFromJson(Map<String, dynamic> json) => _PlanDto(
  id: json['id'] as String,
  name: json['name'] as String,
  periodLabel: json['period_label'] as String,
  cadence: json['cadence'] as String,
  bought: (json['bought'] as num).toInt(),
  pending: (json['pending'] as num).toInt(),
  deferred: (json['deferred'] as num).toInt(),
  spent: (json['spent'] as num).toInt(),
  budget: (json['budget'] as num).toInt(),
);

Map<String, dynamic> _$PlanDtoToJson(_PlanDto instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'period_label': instance.periodLabel,
  'cadence': instance.cadence,
  'bought': instance.bought,
  'pending': instance.pending,
  'deferred': instance.deferred,
  'spent': instance.spent,
  'budget': instance.budget,
};
