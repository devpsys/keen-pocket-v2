import 'package:core/core.dart';

/// UI-shaped shopping/budget plan (presentation-only placeholder for now).
class PlanView {
  const PlanView({
    required this.id,
    required this.name,
    required this.itemCount,
    required this.budget,
  });

  final String id;
  final String name;
  final int itemCount;
  final Money budget;
}
