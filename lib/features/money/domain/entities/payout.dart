import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payout.freezed.dart';

/// Settlement state of a received payout.
enum PayoutStatus { success, pending, failed }

/// A received payout row (design `payouts_bank_hub`).
@freezed
abstract class Payout with _$Payout {
  const factory Payout({
    required String id,
    required String reference,
    required Money amount,
    required PayoutStatus status,
    String? dateLabel,
    String? bankName,
  }) = _Payout;
}

/// A pocket's collection account + progress (tablet "Pocket Collections").
@freezed
abstract class PayoutCollection with _$PayoutCollection {
  const factory PayoutCollection({
    required String id,
    required String name,
    required String bankName,
    required Money amount,
    required double percent, // 0..1
    String? progressLabel,
  }) = _PayoutCollection;
}

/// A linked payout bank account.
@freezed
abstract class BankAccount with _$BankAccount {
  const factory BankAccount({
    required String id,
    required String label,
    required String subtitle,
    required String bankName,
    required String maskedNuban,
  }) = _BankAccount;
}

/// Everything the payouts/bank hub renders in one load (`GET /payouts`).
@freezed
abstract class PayoutsHub with _$PayoutsHub {
  const factory PayoutsHub({
    required List<Payout> payouts,
    required List<PayoutCollection> collections,
    required List<BankAccount> bankAccounts,
    required Money totalCollected,
    String? mascotTip,
  }) = _PayoutsHub;
}
