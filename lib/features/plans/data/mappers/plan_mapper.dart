import 'package:core/core.dart';

import 'package:keenpockets/features/plans/data/dtos/plan_dto.dart';
import 'package:keenpockets/features/plans/domain/entities/plan.dart';

PlanCadence _cadence(String raw) =>
    raw == 'weekly' ? PlanCadence.weekly : PlanCadence.monthly;

extension PlanDtoMapper on PlanDto {
  Plan toEntity() => Plan(
    id: id,
    name: name,
    periodLabel: periodLabel,
    cadence: _cadence(cadence),
    bought: bought,
    pending: pending,
    deferred: deferred,
    spent: Money(spent),
    budget: Money(budget),
  );
}
