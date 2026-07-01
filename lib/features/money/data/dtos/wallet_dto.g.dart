// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WalletTransactionDto _$WalletTransactionDtoFromJson(
  Map<String, dynamic> json,
) => _WalletTransactionDto(
  id: json['id'] as String,
  label: json['label'] as String,
  amount: (json['amount'] as num).toInt(),
  isCredit: json['is_credit'] as bool,
  kind: json['kind'] as String,
  createdAt: json['created_at'] as String,
  balanceAfter: (json['balance_after'] as num?)?.toInt(),
  source: json['source'] as String?,
  status: json['status'] as String?,
);

Map<String, dynamic> _$WalletTransactionDtoToJson(
  _WalletTransactionDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'label': instance.label,
  'amount': instance.amount,
  'is_credit': instance.isCredit,
  'kind': instance.kind,
  'created_at': instance.createdAt,
  'balance_after': instance.balanceAfter,
  'source': instance.source,
  'status': instance.status,
};

_WalletDto _$WalletDtoFromJson(Map<String, dynamic> json) => _WalletDto(
  balance: (json['balance'] as num).toInt(),
  transactions:
      (json['transactions'] as List<dynamic>?)
          ?.map((e) => WalletTransactionDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <WalletTransactionDto>[],
  monthlyDelta: json['monthly_delta'] as String?,
  spendingUsed: (json['spending_used'] as num?)?.toInt(),
  spendingLimit: (json['spending_limit'] as num?)?.toInt(),
  mascotTip: json['mascot_tip'] as String?,
);

Map<String, dynamic> _$WalletDtoToJson(_WalletDto instance) =>
    <String, dynamic>{
      'balance': instance.balance,
      'transactions': instance.transactions,
      'monthly_delta': instance.monthlyDelta,
      'spending_used': instance.spendingUsed,
      'spending_limit': instance.spendingLimit,
      'mascot_tip': instance.mascotTip,
    };
