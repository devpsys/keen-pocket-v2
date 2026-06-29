import 'package:core/core.dart';

/// Accent used by term cards and trend bars. `primaryDark` is the design's deep
/// `bg-primary` (#006590 → on-brand `brand800`), e.g. the Summer trend bar.
enum SchoolAccent { primary, primaryDark, secondary, neutral }

/// A term's fee collection (design `school_dashboard_owner`).
class SchoolTermView {
  const SchoolTermView({
    required this.label,
    required this.collected,
    required this.expected,
    required this.percent,
    required this.accent,
  });

  final String label; // "Term 1 Collection"
  final Money collected;
  final Money expected;
  final double percent; // 0..1
  final SchoolAccent accent;
}

/// A bar in the "Collection Trend" chart.
class SchoolTrendBar {
  const SchoolTrendBar({
    required this.label,
    required this.fraction,
    required this.accent,
  });

  final String label; // "Term 1"
  final double fraction; // 0..1 (bar height)
  final SchoolAccent accent;
}

/// UI-shaped school owner dashboard (presentation-only placeholder for now).
class SchoolView {
  const SchoolView({
    required this.name,
    required this.classCount,
    required this.studentCount,
    required this.feesCollected,
    this.terms = const [],
    this.trend = const [],
    this.overallPercent = 0,
    this.unpaidFees = Money.zero,
  });

  final String name;
  final int classCount;
  final int studentCount;
  final Money feesCollected; // also the "Net Surplus" stat tile

  // Owner dashboard.
  final List<SchoolTermView> terms;
  final List<SchoolTrendBar> trend;
  final double overallPercent; // 0..1 — "collected 64% of projected fees"
  final Money unpaidFees; // "Unpaid Fees" stat tile
}
