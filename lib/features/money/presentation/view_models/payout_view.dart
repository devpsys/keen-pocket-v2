import 'package:core/core.dart';

/// Settlement state of a received payout (design `payouts_bank_hub`).
enum PayoutStatus { success, pending, failed }

/// A received payout row.
class PayoutView {
  const PayoutView({
    required this.id,
    required this.reference,
    required this.amount,
    required this.status,
    this.dateLabel,
    this.bankName,
  });

  final String id;
  final String reference; // "KP-9921-X"
  final Money amount;
  final PayoutStatus status;
  final String? dateLabel; // tablet: "Oct 24, 2023"
  final String? bankName; // tablet: "Zenith Bank"
}

/// A pocket's collection account + progress (tablet "Pocket Collections").
class PayoutCollectionView {
  const PayoutCollectionView({
    required this.id,
    required this.name,
    required this.bankName,
    required this.amount,
    required this.percent,
    this.progressLabel,
  });

  final String id;
  final String name; // "Emergency Fund"
  final String bankName; // "Zenith Bank"
  final Money amount; // ₦250,400.00
  final double percent; // 0..1
  final String? progressLabel; // "Collection Progress" / "Target: ₦2.5M"
}
