/// What kind of group a discovery result is.
enum DiscoverItemType { pocket, adashi }

/// UI-shaped discovery result (presentation-only placeholder for now).
class DiscoverItemView {
  const DiscoverItemView({
    required this.id,
    required this.name,
    required this.type,
    required this.memberCount,
  });

  final String id;
  final String name;
  final DiscoverItemType type;
  final int memberCount;
}
