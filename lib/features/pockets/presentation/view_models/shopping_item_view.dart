import 'package:core/core.dart';

/// UI-shaped group-shopping suggestion (presentation-only placeholder for now).
///
/// Lives in `pockets` even though it's rendered from design phase H — the
/// suggestion belongs to a pocket (map §2/§6).
class ShoppingItemView {
  const ShoppingItemView({
    required this.id,
    required this.name,
    required this.category,
    required this.unitPrice,
    required this.peopleSharing,
    required this.totalCost,
    this.emoji = '🛒',
    this.suggestionsClosed = false,
  });

  final String id;
  final String name;
  final String category; // e.g. "Grains" — data, shown in a pill
  final Money unitPrice;
  final int peopleSharing;
  final Money totalCost;
  final String emoji; // category glyph (emoji-first convention)
  final bool suggestionsClosed;
}
