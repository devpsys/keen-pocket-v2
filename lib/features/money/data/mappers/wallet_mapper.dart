import 'package:core/core.dart';

import 'package:keenpockets/features/money/data/dtos/wallet_dto.dart';
import 'package:keenpockets/features/money/domain/entities/wallet.dart';

WalletTxnKind _kind(String raw) => switch (raw) {
  'top_up' => WalletTxnKind.topUp,
  'refund' => WalletTxnKind.refund,
  _ => WalletTxnKind.payment,
};

WalletTxnStatus? _status(String? raw) => switch (raw) {
  'success' => WalletTxnStatus.success,
  'settled' => WalletTxnStatus.settled,
  'refunded' => WalletTxnStatus.refunded,
  _ => null,
};

extension WalletTransactionDtoMapper on WalletTransactionDto {
  WalletTransaction toEntity() => WalletTransaction(
    id: id,
    label: label,
    amount: Money(amount),
    isCredit: isCredit,
    kind: _kind(kind),
    timeAgo: createdAt,
    balanceAfter: balanceAfter == null ? null : Money(balanceAfter!),
    source: source,
    status: _status(status),
  );
}

extension WalletDtoMapper on WalletDto {
  Wallet toEntity() => Wallet(
    balance: Money(balance),
    transactions: transactions.map((t) => t.toEntity()).toList(),
    monthlyDelta: monthlyDelta,
    spendingUsed: spendingUsed == null ? null : Money(spendingUsed!),
    spendingLimit: spendingLimit == null ? null : Money(spendingLimit!),
    mascotTip: mascotTip,
  );
}
