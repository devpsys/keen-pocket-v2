/// Money value object (Nigerian Naira ₦), stored as integer kobo to avoid
/// floating-point drift. A self-validating, formattable shared value object.
///
/// Lives in `packages/core` because multiple features (pockets, contributions,
/// money) depend on it — promoted here per the Phase-8 triggers.
class Money implements Comparable<Money> {
  const Money(this.kobo);

  /// Build from a Naira amount (e.g. `Money.naira(2500)` → ₦2,500.00).
  factory Money.naira(num naira) => Money((naira * 100).round());

  static const Money zero = Money(0);

  /// Amount in kobo (1/100 of a Naira).
  final int kobo;

  double get naira => kobo / 100;

  Money operator +(Money other) => Money(kobo + other.kobo);
  Money operator -(Money other) => Money(kobo - other.kobo);

  /// Formatted as `₦1,234.56` (thousands separated, 2 decimals).
  String format() {
    final whole = (kobo ~/ 100).abs().toString();
    final buf = StringBuffer();
    for (var i = 0; i < whole.length; i++) {
      if (i > 0 && (whole.length - i) % 3 == 0) buf.write(',');
      buf.write(whole[i]);
    }
    final fraction = (kobo.abs() % 100).toString().padLeft(2, '0');
    final sign = kobo < 0 ? '-' : '';
    return '$sign₦$buf.$fraction';
  }

  /// Compact form for tight spaces: `₦10K`, `₦15.5K`, `₦2.5M`, `₦1.2B`.
  /// Amounts below ₦1,000 are shown in full (`₦500`). One decimal place,
  /// trailing `.0` dropped.
  String formatShort() {
    final sign = kobo < 0 ? '-' : '';
    final naira = kobo.abs() / 100;

    String scaled(double value, String suffix) {
      final s = value.toStringAsFixed(1);
      final trimmed = s.endsWith('.0') ? s.substring(0, s.length - 2) : s;
      return '$sign₦$trimmed$suffix';
    }

    if (naira >= 1000000000) return scaled(naira / 1000000000, 'B');
    if (naira >= 1000000) return scaled(naira / 1000000, 'M');
    if (naira >= 1000) return scaled(naira / 1000, 'K');
    return '$sign₦${naira.truncate()}';
  }

  @override
  int compareTo(Money other) => kobo.compareTo(other.kobo);

  @override
  bool operator ==(Object other) => other is Money && other.kobo == kobo;

  @override
  int get hashCode => kobo.hashCode;

  @override
  String toString() => format();
}
