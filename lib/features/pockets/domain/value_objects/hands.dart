/// "Hands" — the number of shares a member buys in a Pocket. A positive count.
class Hands implements Comparable<Hands> {
  const Hands._(this.count);

  /// Throws [ArgumentError] for non-positive counts.
  factory Hands(int count) {
    if (count < 1) {
      throw ArgumentError.value(count, 'count', 'Hands must be >= 1');
    }
    return Hands._(count);
  }

  /// Lenient constructor returning null instead of throwing (for parsing).
  static Hands? tryCreate(int count) => count < 1 ? null : Hands._(count);

  final int count;

  @override
  int compareTo(Hands other) => count.compareTo(other.count);

  @override
  bool operator ==(Object other) => other is Hands && other.count == count;

  @override
  int get hashCode => count.hashCode;

  @override
  String toString() => '$count';
}
