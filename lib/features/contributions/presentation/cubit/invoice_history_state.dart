import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:keenpockets/features/contributions/domain/entities/invoice.dart';

part 'invoice_history_state.freezed.dart';

/// State for the invoice-history list (universal [StateStatus] surface).
@freezed
abstract class InvoiceHistoryState with _$InvoiceHistoryState {
  const factory InvoiceHistoryState({
    @Default(StateStatus.initial) StateStatus status,
    @Default(<Invoice>[]) List<Invoice> invoices,
    Failure? failure,
  }) = _InvoiceHistoryState;
}
