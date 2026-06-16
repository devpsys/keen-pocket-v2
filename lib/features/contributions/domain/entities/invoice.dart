import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice.freezed.dart';

/// Verification state of a contribution invoice.
enum InvoiceStatus { pending, verified, declined }

/// A line item within an invoice (a payment or a donation).
enum InvoiceItemType { paid, donation }

/// A single line on an [Invoice].
@freezed
abstract class InvoiceItem with _$InvoiceItem {
  const factory InvoiceItem({
    required String id,
    required String label,
    required Money amount,
    @Default(InvoiceItemType.paid) InvoiceItemType type,
  }) = _InvoiceItem;
}

/// A contribution invoice in the shared ledger. Identical in shape for Pocket
/// and Adashi (the reason this capability is extracted).
@freezed
abstract class Invoice with _$Invoice {
  const factory Invoice({
    required String id,
    required String contributorId,
    required Money total,
    @Default(InvoiceStatus.pending) InvoiceStatus status,
    @Default(<InvoiceItem>[]) List<InvoiceItem> items,
  }) = _Invoice;

  const Invoice._();

  bool get isPending => status == InvoiceStatus.pending;
  bool get isVerified => status == InvoiceStatus.verified;
}
