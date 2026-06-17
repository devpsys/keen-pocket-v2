import 'package:core/core.dart';

/// How often a plan repeats.
enum PlanCadence { weekly, monthly }

/// UI-shaped shopping/budget plan (presentation-only placeholder for now).
class PlanView {
  const PlanView({
    required this.id,
    required this.name,
    required this.periodLabel,
    required this.cadence,
    required this.bought,
    required this.pending,
    required this.deferred,
    required this.spent,
    required this.budget,
  });

  final String id;
  final String name;

  /// Human-readable planning period, e.g. "June 2026".
  final String periodLabel;
  final PlanCadence cadence;

  final int bought;
  final int pending;
  final int deferred;

  /// Amount spent so far against [budget].
  final Money spent;
  final Money budget;

  int get itemCount => bought + pending + deferred;

  /// Fraction of the budget consumed, clamped to 0–1.
  double get budgetProgress =>
      budget.kobo == 0 ? 0 : (spent.kobo / budget.kobo).clamp(0, 1).toDouble();
}
