import 'package:core/core.dart';

/// Lifecycle state of a plan's checklist item.
enum PlanItemStatus { purchased, pending, deferred }

/// UI-shaped checklist item for the grocery plan detail screen
/// (presentation-only placeholder for now).
class PlanItemView {
  const PlanItemView({
    required this.id,
    required this.name,
    required this.quantity,
    required this.unitPrice,
    required this.status,
    required this.category,
    this.starred = false,
    this.claimedBy,
  });

  final String id;
  final String name;
  final int quantity;
  final Money unitPrice;
  final PlanItemStatus status;

  /// Shopping category, e.g. "Pantry" (used by the tablet table column).
  final String category;

  /// Star-priority items are funded first.
  final bool starred;

  /// Name of the collaborator who claimed/bought the item, if any.
  final String? claimedBy;

  Money get total => Money(unitPrice.kobo * quantity);
}
