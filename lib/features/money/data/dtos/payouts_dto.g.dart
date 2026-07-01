// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payouts_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PayoutDto _$PayoutDtoFromJson(Map<String, dynamic> json) => _PayoutDto(
  id: json['id'] as String,
  reference: json['reference'] as String,
  amount: (json['amount'] as num).toInt(),
  status: json['status'] as String,
  dateLabel: json['date_label'] as String?,
  bankName: json['bank_name'] as String?,
);

Map<String, dynamic> _$PayoutDtoToJson(_PayoutDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reference': instance.reference,
      'amount': instance.amount,
      'status': instance.status,
      'date_label': instance.dateLabel,
      'bank_name': instance.bankName,
    };

_PayoutCollectionDto _$PayoutCollectionDtoFromJson(Map<String, dynamic> json) =>
    _PayoutCollectionDto(
      id: json['id'] as String,
      name: json['name'] as String,
      bankName: json['bank_name'] as String,
      amount: (json['amount'] as num).toInt(),
      percent: (json['percent'] as num).toDouble(),
      progressLabel: json['progress_label'] as String?,
    );

Map<String, dynamic> _$PayoutCollectionDtoToJson(
  _PayoutCollectionDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'bank_name': instance.bankName,
  'amount': instance.amount,
  'percent': instance.percent,
  'progress_label': instance.progressLabel,
};

_BankAccountDto _$BankAccountDtoFromJson(Map<String, dynamic> json) =>
    _BankAccountDto(
      id: json['id'] as String,
      label: json['label'] as String,
      subtitle: json['subtitle'] as String,
      bankName: json['bank_name'] as String,
      maskedNuban: json['masked_nuban'] as String,
    );

Map<String, dynamic> _$BankAccountDtoToJson(_BankAccountDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'subtitle': instance.subtitle,
      'bank_name': instance.bankName,
      'masked_nuban': instance.maskedNuban,
    };

_PayoutsHubDto _$PayoutsHubDtoFromJson(Map<String, dynamic> json) =>
    _PayoutsHubDto(
      payouts:
          (json['payouts'] as List<dynamic>?)
              ?.map((e) => PayoutDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <PayoutDto>[],
      collections:
          (json['collections'] as List<dynamic>?)
              ?.map(
                (e) => PayoutCollectionDto.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const <PayoutCollectionDto>[],
      bankAccounts:
          (json['bank_accounts'] as List<dynamic>?)
              ?.map((e) => BankAccountDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <BankAccountDto>[],
      totalCollected: (json['total_collected'] as num).toInt(),
      mascotTip: json['mascot_tip'] as String?,
    );

Map<String, dynamic> _$PayoutsHubDtoToJson(_PayoutsHubDto instance) =>
    <String, dynamic>{
      'payouts': instance.payouts,
      'collections': instance.collections,
      'bank_accounts': instance.bankAccounts,
      'total_collected': instance.totalCollected,
      'mascot_tip': instance.mascotTip,
    };
