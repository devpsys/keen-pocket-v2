import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/contributions/domain/usecases/get_invoices.dart';
import 'package:keenpockets/features/contributions/domain/usecases/verify_contribution.dart';
import 'package:keenpockets/features/contributions/domain/value_objects/contribution_context.dart';
import 'package:keenpockets/features/contributions/presentation/cubit/invoice_history_state.dart';

/// Loads and (for organisers) verifies invoices for a contribution context.
@injectable
class InvoiceHistoryCubit extends Cubit<InvoiceHistoryState> {
  InvoiceHistoryCubit(this._getInvoices, this._verify)
    : super(const InvoiceHistoryState());

  final GetInvoices _getInvoices;
  final VerifyContribution _verify;

  late ContributionContext _context;

  Future<void> load(ContributionContext context) async {
    _context = context;
    emit(state.copyWith(status: StateStatus.loading, failure: null));
    final result = await _getInvoices(context);
    emit(
      result.fold(
        (failure) =>
            state.copyWith(status: StateStatus.failure, failure: failure),
        (invoices) => state.copyWith(
          status: invoices.isEmpty ? StateStatus.empty : StateStatus.success,
          invoices: invoices,
          failure: null,
        ),
      ),
    );
  }

  /// Organiser action; reloads the list on success.
  Future<void> verify(String invoiceId) async {
    final result = await _verify(invoiceId);
    await result.fold(
      (failure) async =>
          emit(state.copyWith(status: StateStatus.failure, failure: failure)),
      (_) => load(_context),
    );
  }
}
