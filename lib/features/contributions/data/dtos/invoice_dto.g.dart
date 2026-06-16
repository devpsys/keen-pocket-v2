// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InvoiceItemDto _$InvoiceItemDtoFromJson(Map<String, dynamic> json) =>
    _InvoiceItemDto(
      id: json['id'] as String,
      label: json['label'] as String,
      amountKobo: (json['amount'] as num).toInt(),
      type: json['type'] as String? ?? 'paid',
    );

Map<String, dynamic> _$InvoiceItemDtoToJson(_InvoiceItemDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'amount': instance.amountKobo,
      'type': instance.type,
    };

_InvoiceDto _$InvoiceDtoFromJson(Map<String, dynamic> json) => _InvoiceDto(
  id: json['id'] as String,
  contributorId: json['contributor_id'] as String,
  totalKobo: (json['total'] as num).toInt(),
  status: json['status'] as String? ?? 'pending',
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => InvoiceItemDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <InvoiceItemDto>[],
);

Map<String, dynamic> _$InvoiceDtoToJson(_InvoiceDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'contributor_id': instance.contributorId,
      'total': instance.totalKobo,
      'status': instance.status,
      'items': instance.items,
    };
