import 'package:core/core.dart';

/// PRESENTATION-ONLY wallet/payment snapshot for the pay-from-wallet screen
/// (design `pay_from_wallet`). Replaced by `money` wallet data later.
class PayWalletView {
  const PayWalletView({
    required this.walletBalance,
    required this.invoiceAmount,
    required this.monthlySpent,
    required this.monthlyLimit,
  });

  final Money walletBalance;
  final Money invoiceAmount;
  final Money monthlySpent;
  final Money monthlyLimit;

  bool get sufficient => walletBalance.kobo >= invoiceAmount.kobo;
  Money get newBalance => walletBalance - invoiceAmount;
  Money get shortfall => invoiceAmount - walletBalance;
  double get limitProgress =>
      monthlyLimit.kobo == 0 ? 0 : monthlySpent.kobo / monthlyLimit.kobo;
}

final kPayWallet = PayWalletView(
  walletBalance: Money.naira(12500),
  invoiceAmount: Money.naira(5000),
  monthlySpent: Money.naira(45000),
  monthlyLimit: Money.naira(100000),
);
