import 'package:core/core.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/contributions/domain/entities/invoice.dart';
import 'package:keenpockets/features/contributions/domain/repositories/contribution_repository.dart';
import 'package:keenpockets/features/contributions/domain/value_objects/contribution_context.dart';

/// Parameters for [SubmitContribution].
class SubmitContributionParams {
  const SubmitContributionParams({required this.context, required this.amount});

  final ContributionContext context;
  final Money amount;
}

/// Validates and submits a contribution. The amount must be positive
/// (a business rule, enforced here regardless of UI).
@injectable
class SubmitContribution implements UseCase<Invoice, SubmitContributionParams> {
  const SubmitContribution(this._repository);

  final ContributionRepository _repository;

  @override
  Future<Result<Invoice>> call(SubmitContributionParams params) {
    if (params.amount.kobo <= 0) {
      return Future.value(
        const Left(ValidationFailure(fieldErrors: {'amount': 'invalid'})),
      );
    }
    return _repository.submitContribution(
      context: params.context,
      amount: params.amount,
    );
  }
}
