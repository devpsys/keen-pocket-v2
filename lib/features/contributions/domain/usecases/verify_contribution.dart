import 'package:core/core.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/contributions/domain/entities/invoice.dart';
import 'package:keenpockets/features/contributions/domain/repositories/contribution_repository.dart';

/// Organiser action: verify a pending invoice. Authorization (organiser-only)
/// is enforced by the caller via the pocket/adashi role.
@injectable
class VerifyContribution implements UseCase<Invoice, String> {
  const VerifyContribution(this._repository);

  final ContributionRepository _repository;

  @override
  Future<Result<Invoice>> call(String invoiceId) =>
      _repository.verifyInvoice(invoiceId);
}
