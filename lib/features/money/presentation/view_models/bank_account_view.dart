/// UI-shaped payout bank account (presentation-only placeholder for now).
class BankAccountView {
  const BankAccountView({
    required this.id,
    required this.label,
    required this.subtitle,
    required this.bankName,
    required this.maskedNuban,
  });

  final String id;
  final String label; // e.g. "Emergency Fund"
  final String subtitle; // e.g. "Primary Savings"
  final String bankName; // e.g. "Zenith Bank"
  final String maskedNuban; // e.g. "**** 5521"
}
