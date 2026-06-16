import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/contributions/domain/usecases/submit_contribution.dart';
import 'package:keenpockets/features/contributions/domain/value_objects/contribution_context.dart';
import 'package:keenpockets/features/contributions/presentation/cubit/contribute_state.dart';

/// Submits a contribution for a context.
@injectable
class ContributeCubit extends Cubit<ContributeState> {
  ContributeCubit(this._submit) : super(const ContributeState());

  final SubmitContribution _submit;

  Future<void> submit({
    required ContributionContext context,
    required Money amount,
  }) async {
    emit(
      state.copyWith(
        status: StateStatus.loading,
        failure: null,
        fieldErrors: const <String, String>{},
      ),
    );
    final result = await _submit(
      SubmitContributionParams(context: context, amount: amount),
    );
    emit(
      result.fold(
        (failure) => state.copyWith(
          status: StateStatus.failure,
          failure: failure,
          fieldErrors: failure is ValidationFailure
              ? failure.fieldErrors
              : const <String, String>{},
        ),
        (_) => state.copyWith(status: StateStatus.success, failure: null),
      ),
    );
  }
}
