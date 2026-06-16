import 'package:core/core.dart';

/// UI-shaped school summary (presentation-only placeholder for now).
class SchoolView {
  const SchoolView({
    required this.name,
    required this.classCount,
    required this.studentCount,
    required this.feesCollected,
  });

  final String name;
  final int classCount;
  final int studentCount;
  final Money feesCollected;
}
