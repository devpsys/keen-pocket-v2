import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet.freezed.dart';

/// Kind of wallet activity.
enum WalletTxnKind { topUp, payment, refund }

/// Settlement state of a wallet transaction.
enum WalletTxnStatus { success, settled, refunded }

/// A single wallet ledger entry (domain entity).
@freezed
abstract class WalletTransaction with _$WalletTransaction {
  const factory WalletTransaction({
    required String id,
    required String label,
    required Money amount,
    required bool isCredit,
    required WalletTxnKind kind,
    required String timeAgo,
    Money? balanceAfter,
    String? source,
    WalletTxnStatus? status,
  }) = _WalletTransaction;
}

/// The user's wallet: balance, ledger and spending snapshot (`GET /wallet`).
@freezed
abstract class Wallet with _$Wallet {
  const factory Wallet({
    required Money balance,
    required List<WalletTransaction> transactions,
    String? monthlyDelta,
    Money? spendingUsed,
    Money? spendingLimit,
    String? mascotTip,
  }) = _Wallet;
}
