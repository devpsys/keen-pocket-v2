import 'package:core/core.dart';

/// PRESENTATION-ONLY placeholder for the contribute screen's target goal and
/// charity (design `contribute_amount`). When the domain layer lands this comes
/// from the host pocket/adashi.
class ContributeTarget {
  const ContributeTarget({
    required this.goalName,
    required this.target,
    required this.saved,
    required this.outstanding,
    required this.progress,
    required this.charityCause,
    required this.charityAmount,
  });

  final String goalName;
  final Money target;
  final Money saved;
  final Money outstanding;
  final double progress; // 0–1
  final String charityCause;
  final Money charityAmount;

  int get percent => (progress * 100).round();
}

/// Quick-add presets (in Naira) shown under the amount field.
const kContributeQuickAdds = <int>[1000, 5000, 10000];

final kContributeTarget = ContributeTarget(
  goalName: 'December Turkey Fund',
  target: Money.naira(150000),
  saved: Money.naira(85000),
  outstanding: Money.naira(65000),
  progress: 0.56,
  charityCause: 'Education Fund',
  charityAmount: Money.naira(100),
);

/// App-bar avatar from the design.
const kContributeAvatarUrl =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuBCvNU8ezpCzL9p5mKCXmwxYyDp1jymNuJiWbzc7y4GcKOO53hmEkgfzamMmbN5uW_sReNmxVeRUjPT5Zu14yPfGePYagrLIG6ffY7Uft6xpTqJxqHBtVkJLkuo5RgQzpseO46YZXqZhcwVzx8U8jgpOEJB8IP2IvmhPC0jdUpgWPTJ79PTmG1nZjLyg1MzYLG0ZHqxPcdbqu8O_f8Dl6Gj0Plx1XtEqdjFK-TzzvI2G4M487q3hGoCHLQvD-5cdSqse6HMX4LpmDY';
