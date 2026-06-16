import 'package:core/core.dart';

import 'package:keenpockets/features/contributions/domain/entities/invoice.dart';
import 'package:keenpockets/features/contributions/domain/value_objects/contribution_context.dart';

/// Domain contract for the shared contribution ledger.
abstract interface class ContributionRepository {
  /// Invoice history for a host (pocket slot or adashi cycle).
  Future<Result<List<Invoice>>> getInvoices(ContributionContext context);

  /// Submits a new contribution for [context] and returns the created invoice.
  Future<Result<Invoice>> submitContribution({
    required ContributionContext context,
    required Money amount,
  });

  /// Organiser action: verifies a pending invoice and returns the updated one.
  Future<Result<Invoice>> verifyInvoice(String invoiceId);
}
