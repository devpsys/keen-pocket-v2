import 'package:core/core.dart';

/// UI-shaped charity drive (presentation-only placeholder for now).
class CharityView {
  const CharityView({
    required this.title,
    required this.goal,
    required this.raised,
    required this.donorCount,
  });

  final String title;
  final Money goal;
  final Money raised;
  final int donorCount;

  double get progress =>
      goal.kobo == 0 ? 0 : (raised.kobo / goal.kobo).clamp(0, 1);
}
