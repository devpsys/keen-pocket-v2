import 'package:core/core.dart';

import 'package:keenpockets/features/adashi/presentation/view_models/adashi_view.dart';

/// PLACEHOLDER data for the presentation-only phase. Replace with a use case
/// (domain) + repository (data) when those layers are built — the cubits below
/// only need to swap their source, not their shape.
abstract final class AdashiSamples {
  const AdashiSamples._();

  static List<AdashiSummaryView> list() => const [
    AdashiSummaryView(
      id: 'a1',
      name: 'Family Circle',
      perCycle: Money(2000000),
      memberCount: 6,
      currentCycle: 3,
      totalCycles: 6,
      mode: RotationMode.auto,
    ),
    AdashiSummaryView(
      id: 'a2',
      name: 'Market Women Ajo',
      perCycle: Money(500000),
      memberCount: 10,
      currentCycle: 1,
      totalCycles: 10,
      mode: RotationMode.manual,
    ),
  ];

  static AdashiDetailView? detail(String id) {
    final summary = list()
        .where((a) => a.id == id)
        .cast<AdashiSummaryView?>()
        .firstWhere((_) => true, orElse: () => null);
    if (summary == null) return null;

    final names = [
      'Ada',
      'Bem',
      'Chidi',
      'Dayo',
      'Efe',
      'Funke',
      'Gbenga',
      'Hauwa',
      'Ibrahim',
      'Joy',
    ];
    final rotation = List.generate(summary.memberCount, (i) {
      final position = i + 1;
      final status = position < summary.currentCycle
          ? RotationStatus.received
          : position == summary.currentCycle
          ? RotationStatus.current
          : RotationStatus.upcoming;
      return AdashiMemberView(
        id: 'm$position',
        name: names[i % names.length],
        position: position,
        status: status,
      );
    });
    return AdashiDetailView(summary: summary, rotation: rotation);
  }
}
