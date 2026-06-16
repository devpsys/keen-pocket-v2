import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice_dto.freezed.dart';
part 'invoice_dto.g.dart';

/// Wire representation of an invoice line item. Amounts are kobo (int).
@freezed
abstract class InvoiceItemDto with _$InvoiceItemDto {
  const factory InvoiceItemDto({
    required String id,
    required String label,
    @JsonKey(name: 'amount') required int amountKobo,
    @Default('paid') String type,
  }) = _InvoiceItemDto;

  factory InvoiceItemDto.fromJson(Map<String, dynamic> json) =>
      _$InvoiceItemDtoFromJson(json);
}

/// Wire representation of an invoice.
@freezed
abstract class InvoiceDto with _$InvoiceDto {
  const factory InvoiceDto({
    required String id,
    @JsonKey(name: 'contributor_id') required String contributorId,
    @JsonKey(name: 'total') required int totalKobo,
    @Default('pending') String status,
    @Default(<InvoiceItemDto>[]) List<InvoiceItemDto> items,
  }) = _InvoiceDto;

  factory InvoiceDto.fromJson(Map<String, dynamic> json) =>
      _$InvoiceDtoFromJson(json);
}
