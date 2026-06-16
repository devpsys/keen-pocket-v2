import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/features/contributions/domain/entities/invoice.dart';
import 'package:keenpockets/features/contributions/domain/usecases/get_invoices.dart';
import 'package:keenpockets/features/contributions/domain/usecases/submit_contribution.dart';
import 'package:keenpockets/features/contributions/domain/usecases/verify_contribution.dart';
import 'package:keenpockets/features/contributions/domain/value_objects/contribution_context.dart';
import 'package:keenpockets/features/contributions/presentation/cubit/contribute_cubit.dart';
import 'package:keenpockets/features/contributions/presentation/cubit/contribute_state.dart';
import 'package:keenpockets/features/contributions/presentation/cubit/invoice_history_cubit.dart';
import 'package:keenpockets/features/contributions/presentation/cubit/invoice_history_state.dart';
import 'package:mocktail/mocktail.dart';

class _MockGetInvoices extends Mock implements GetInvoices {}

class _MockVerify extends Mock implements VerifyContribution {}

class _MockSubmit extends Mock implements SubmitContribution {}

void main() {
  final context = ContributionContext.pocket('p1');
  const invoice = Invoice(id: 'i1', contributorId: 'u1', total: Money(500000));

  setUpAll(() {
    registerFallbackValue(ContributionContext.pocket('x'));
    registerFallbackValue(
      SubmitContributionParams(
        context: ContributionContext.pocket('x'),
        amount: Money.zero,
      ),
    );
  });

  group('InvoiceHistoryCubit', () {
    late _MockGetInvoices getInvoices;
    late _MockVerify verify;

    setUp(() {
      getInvoices = _MockGetInvoices();
      verify = _MockVerify();
    });

    blocTest<InvoiceHistoryCubit, InvoiceHistoryState>(
      'emits [loading, success] with invoices',
      setUp: () => when(
        () => getInvoices(any()),
      ).thenAnswer((_) async => const Right([invoice])),
      build: () => InvoiceHistoryCubit(getInvoices, verify),
      act: (cubit) => cubit.load(context),
      expect: () => [
        isA<InvoiceHistoryState>().having(
          (s) => s.status,
          'status',
          StateStatus.loading,
        ),
        isA<InvoiceHistoryState>()
            .having((s) => s.status, 'status', StateStatus.success)
            .having((s) => s.invoices, 'invoices', [invoice]),
      ],
    );

    blocTest<InvoiceHistoryCubit, InvoiceHistoryState>(
      'emits [loading, empty] when there are none',
      setUp: () => when(
        () => getInvoices(any()),
      ).thenAnswer((_) async => const Right([])),
      build: () => InvoiceHistoryCubit(getInvoices, verify),
      act: (cubit) => cubit.load(context),
      expect: () => [
        isA<InvoiceHistoryState>().having(
          (s) => s.status,
          'status',
          StateStatus.loading,
        ),
        isA<InvoiceHistoryState>().having(
          (s) => s.status,
          'status',
          StateStatus.empty,
        ),
      ],
    );
  });

  group('ContributeCubit', () {
    late _MockSubmit submit;

    setUp(() => submit = _MockSubmit());

    blocTest<ContributeCubit, ContributeState>(
      'emits [loading, success] on submit',
      setUp: () => when(
        () => submit(any()),
      ).thenAnswer((_) async => const Right(invoice)),
      build: () => ContributeCubit(submit),
      act: (cubit) => cubit.submit(context: context, amount: Money.naira(5000)),
      expect: () => [
        isA<ContributeState>().having(
          (s) => s.status,
          'status',
          StateStatus.loading,
        ),
        isA<ContributeState>().having(
          (s) => s.status,
          'status',
          StateStatus.success,
        ),
      ],
    );

    blocTest<ContributeCubit, ContributeState>(
      'surfaces field errors from a ValidationFailure',
      setUp: () => when(() => submit(any())).thenAnswer(
        (_) async =>
            const Left(ValidationFailure(fieldErrors: {'amount': 'invalid'})),
      ),
      build: () => ContributeCubit(submit),
      act: (cubit) => cubit.submit(context: context, amount: Money.zero),
      expect: () => [
        isA<ContributeState>().having(
          (s) => s.status,
          'status',
          StateStatus.loading,
        ),
        isA<ContributeState>()
            .having((s) => s.status, 'status', StateStatus.failure)
            .having((s) => s.fieldErrors['amount'], 'amount error', 'invalid'),
      ],
    );
  });
}
