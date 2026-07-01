import 'package:core/core.dart';

import 'package:keenpockets/features/money/data/dtos/payouts_dto.dart';
import 'package:keenpockets/features/money/domain/entities/payout.dart';

PayoutStatus _status(String raw) => switch (raw) {
  'pending' => PayoutStatus.pending,
  'failed' => PayoutStatus.failed,
  _ => PayoutStatus.success,
};

extension PayoutDtoMapper on PayoutDto {
  Payout toEntity() => Payout(
    id: id,
    reference: reference,
    amount: Money(amount),
    status: _status(status),
    dateLabel: dateLabel,
    bankName: bankName,
  );
}

extension PayoutCollectionDtoMapper on PayoutCollectionDto {
  PayoutCollection toEntity() => PayoutCollection(
    id: id,
    name: name,
    bankName: bankName,
    amount: Money(amount),
    percent: percent,
    progressLabel: progressLabel,
  );
}

extension BankAccountDtoMapper on BankAccountDto {
  BankAccount toEntity() => BankAccount(
    id: id,
    label: label,
    subtitle: subtitle,
    bankName: bankName,
    maskedNuban: maskedNuban,
  );
}

extension PayoutsHubDtoMapper on PayoutsHubDto {
  PayoutsHub toEntity() => PayoutsHub(
    payouts: payouts.map((p) => p.toEntity()).toList(),
    collections: collections.map((c) => c.toEntity()).toList(),
    bankAccounts: bankAccounts.map((b) => b.toEntity()).toList(),
    totalCollected: Money(totalCollected),
    mascotTip: mascotTip,
  );
}
