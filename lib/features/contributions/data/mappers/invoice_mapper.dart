import 'package:core/core.dart';

import 'package:keenpockets/features/contributions/data/dtos/invoice_dto.dart';
import 'package:keenpockets/features/contributions/domain/entities/invoice.dart';

/// DTO → entity conversion for the contribution ledger.
extension InvoiceItemDtoMapper on InvoiceItemDto {
  InvoiceItem toEntity() => InvoiceItem(
    id: id,
    label: label,
    amount: Money(amountKobo),
    type: type == 'donation' ? InvoiceItemType.donation : InvoiceItemType.paid,
  );
}

extension InvoiceDtoMapper on InvoiceDto {
  InvoiceStatus get _status => switch (status) {
    'verified' => InvoiceStatus.verified,
    'declined' => InvoiceStatus.declined,
    _ => InvoiceStatus.pending,
  };

  Invoice toEntity() => Invoice(
    id: id,
    contributorId: contributorId,
    total: Money(totalKobo),
    status: _status,
    items: items.map((i) => i.toEntity()).toList(),
  );
}
