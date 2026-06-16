import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/features/contributions/domain/entities/invoice.dart';
import 'package:keenpockets/features/contributions/domain/value_objects/contribution_context.dart';
import 'package:keenpockets/features/contributions/presentation/cubit/contribute_cubit.dart';
import 'package:keenpockets/features/contributions/presentation/cubit/contribute_state.dart';
import 'package:keenpockets/features/contributions/presentation/cubit/invoice_history_cubit.dart';
import 'package:keenpockets/features/contributions/presentation/cubit/invoice_history_state.dart';
import 'package:keenpockets/features/contributions/presentation/pages/contribute_page.dart';
import 'package:keenpockets/features/contributions/presentation/pages/invoice_history_page.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/pump_app.dart';

class _MockInvoiceHistoryCubit extends MockCubit<InvoiceHistoryState>
    implements InvoiceHistoryCubit {}

class _MockContributeCubit extends MockCubit<ContributeState>
    implements ContributeCubit {}

void main() {
  final context = ContributionContext.pocket('p1');
  const invoice = Invoice(id: 'i1', contributorId: 'u1', total: Money(500000));

  setUpAll(() {
    registerFallbackValue(ContributionContext.pocket('x'));
    registerFallbackValue(Money.zero);
  });

  tearDown(() => getIt.reset());

  group('InvoiceHistoryPage', () {
    late _MockInvoiceHistoryCubit cubit;

    setUp(() {
      cubit = _MockInvoiceHistoryCubit();
      when(() => cubit.load(any())).thenAnswer((_) async {});
      if (getIt.isRegistered<InvoiceHistoryCubit>()) {
        getIt.unregister<InvoiceHistoryCubit>();
      }
      getIt.registerFactory<InvoiceHistoryCubit>(() => cubit);
    });

    testWidgets('renders the invoice list on success', (tester) async {
      whenListen(
        cubit,
        const Stream<InvoiceHistoryState>.empty(),
        initialState: const InvoiceHistoryState(
          status: StateStatus.success,
          invoices: [invoice],
        ),
      );

      await tester.pumpApp(InvoiceHistoryPage(context: context));

      expect(find.text('₦5,000.00'), findsOneWidget);
    });

    testWidgets('renders the empty state', (tester) async {
      whenListen(
        cubit,
        const Stream<InvoiceHistoryState>.empty(),
        initialState: const InvoiceHistoryState(status: StateStatus.empty),
      );

      await tester.pumpApp(InvoiceHistoryPage(context: context));

      expect(find.text('No contributions yet'), findsOneWidget);
    });

    testWidgets('renders the failure state with retry', (tester) async {
      whenListen(
        cubit,
        const Stream<InvoiceHistoryState>.empty(),
        initialState: const InvoiceHistoryState(
          status: StateStatus.failure,
          failure: ServerFailure(),
        ),
      );

      await tester.pumpApp(InvoiceHistoryPage(context: context));

      expect(find.text('Retry'), findsOneWidget);
    });
  });

  group('ContributePage', () {
    late _MockContributeCubit cubit;

    setUp(() {
      cubit = _MockContributeCubit();
      when(
        () => cubit.submit(
          context: any(named: 'context'),
          amount: any(named: 'amount'),
        ),
      ).thenAnswer((_) async {});
      if (getIt.isRegistered<ContributeCubit>()) {
        getIt.unregister<ContributeCubit>();
      }
      getIt.registerFactory<ContributeCubit>(() => cubit);
    });

    testWidgets('submits the entered amount', (tester) async {
      whenListen(
        cubit,
        const Stream<ContributeState>.empty(),
        initialState: const ContributeState(),
      );

      await tester.pumpApp(ContributePage(context: context));

      await tester.enterText(find.byType(TextField), '5000');
      await tester.tap(find.byType(FilledButton));
      await tester.pump();

      verify(
        () => cubit.submit(
          context: any(named: 'context'),
          amount: any(named: 'amount'),
        ),
      ).called(1);
    });

    testWidgets('shows a snackbar on a non-field failure', (tester) async {
      whenListen(
        cubit,
        Stream.fromIterable(const [
          ContributeState(
            status: StateStatus.failure,
            failure: ServerFailure(),
          ),
        ]),
        initialState: const ContributeState(),
      );

      await tester.pumpApp(ContributePage(context: context));
      await tester.pump();

      expect(find.byType(SnackBar), findsOneWidget);
    });
  });
}
