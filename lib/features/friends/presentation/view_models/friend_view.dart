/// Relationship state of a connection.
enum FriendStatus { friend, incoming, outgoing }

/// UI-shaped friend/connection (presentation-only placeholder for now).
class FriendView {
  const FriendView({
    required this.id,
    required this.name,
    required this.status,
  });

  final String id;
  final String name;
  final FriendStatus status;
}
