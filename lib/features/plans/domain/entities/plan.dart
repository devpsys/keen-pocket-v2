import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'plan.freezed.dart';

/// How often a plan repeats.
enum PlanCadence { weekly, monthly }

/// A shopping/budget plan (`GET /plans`). Domain entity — pure Dart.
@freezed
abstract class Plan with _$Plan {
  const factory Plan({
    required String id,
    required String name,
    required String periodLabel,
    required PlanCadence cadence,
    required int bought,
    required int pending,
    required int deferred,
    required Money spent,
    required Money budget,
  }) = _Plan;

  const Plan._();

  int get itemCount => bought + pending + deferred;

  double get budgetProgress =>
      budget.kobo == 0 ? 0 : (spent.kobo / budget.kobo).clamp(0, 1).toDouble();
}
