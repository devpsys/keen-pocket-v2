import 'package:core/core.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/contributions/domain/entities/invoice.dart';
import 'package:keenpockets/features/contributions/domain/repositories/contribution_repository.dart';
import 'package:keenpockets/features/contributions/domain/value_objects/contribution_context.dart';

/// Returns the invoice history for a contribution context.
@injectable
class GetInvoices implements UseCase<List<Invoice>, ContributionContext> {
  const GetInvoices(this._repository);

  final ContributionRepository _repository;

  @override
  Future<Result<List<Invoice>>> call(ContributionContext params) =>
      _repository.getInvoices(params);
}
