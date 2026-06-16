/// UI-shaped admin/health summary (presentation-only placeholder for now).
class AdminView {
  const AdminView({
    required this.activeAdmins,
    required this.healthScore,
    required this.keensInCirculation,
  });

  final int activeAdmins;
  final int healthScore; // 0..100 collection-health KPI
  final int keensInCirculation;
}
