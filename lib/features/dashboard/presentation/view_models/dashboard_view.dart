import 'package:core/core.dart';

/// UI-shaped dashboard aggregation (presentation-only placeholder for now).
class DashboardView {
  const DashboardView({
    required this.greetingName,
    required this.totalSaved,
    required this.activePockets,
    required this.streakDays,
    required this.weeklyGoalProgress,
  });

  final String greetingName;
  final Money totalSaved;
  final int activePockets;
  final int streakDays;
  final double weeklyGoalProgress; // 0..1
}
