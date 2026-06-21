import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/session/session_manager.dart';
import 'package:keenpockets/core/session/session_user.dart';
import 'package:keenpockets/features/contributions/domain/value_objects/contribution_context.dart';
import 'package:keenpockets/features/contributions/presentation/cubit/contribute_cubit.dart';
import 'package:keenpockets/features/contributions/presentation/cubit/contribute_state.dart';
import 'package:keenpockets/features/contributions/presentation/pages/allocate_months_page.dart';
import 'package:keenpockets/features/contributions/presentation/pages/contribute_page.dart';
import 'package:keenpockets/features/contributions/presentation/pages/invoice_history_page.dart';
import 'package:keenpockets/features/contributions/presentation/pages/pay_from_wallet_page.dart';
import 'package:keenpockets/features/contributions/presentation/widgets/pay_fixtures.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/pump_app.dart';

class _MockContributeCubit extends MockCubit<ContributeState>
    implements ContributeCubit {}

class _MockSessionManager extends Mock implements SessionManager {}

void main() {
  final context = ContributionContext.pocket('p1');

  setUpAll(() {
    registerFallbackValue(ContributionContext.pocket('x'));
    registerFallbackValue(Money.zero);
  });

  tearDown(() => getIt.reset());

  group('InvoiceHistoryPage', () {
    testWidgets('renders the ledger and payment history', (tester) async {
      await tester.pumpApp(InvoiceHistoryPage(context: context));
      await tester.pumpAndSettle();

      expect(find.text('Invoice Ledger'), findsWidgets);
      expect(find.text('Payment History'), findsOneWidget);
      expect(find.text('#KP-9021'), findsOneWidget);
      // Member view: no organiser approval/urgent panels.
      expect(find.text('Pending Approvals'), findsNothing);
    });

    testWidgets('shows organiser panels when canVerify', (tester) async {
      await tester.pumpApp(
        InvoiceHistoryPage(context: context, canVerify: true),
      );
      await tester.pumpAndSettle();

      expect(find.text('Pending Approvals'), findsOneWidget);
      expect(find.text('Adashi Weekly Saver'), findsOneWidget);

      await tester.scrollUntilVisible(
        find.text('Mark Invoice Paid'),
        200,
        scrollable: find.byType(Scrollable).first,
      );
      expect(find.text('Mark Invoice Paid'), findsOneWidget);
    });

    testWidgets('filters the history to pending', (tester) async {
      await tester.pumpApp(InvoiceHistoryPage(context: context));
      await tester.pumpAndSettle();

      expect(find.text('#KP-9021'), findsOneWidget);

      await tester.tap(find.text('Pending'));
      await tester.pumpAndSettle();

      // Only the unpaid invoice remains.
      expect(find.text('#KP-8944'), findsOneWidget);
      expect(find.text('#KP-9021'), findsNothing);
    });

    testWidgets('tablet renders the payment table and stats', (tester) async {
      tester.view.physicalSize = const Size(1500, 2400);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final session = _MockSessionManager();
      when(() => session.currentUser).thenReturn(
        const SessionUser(id: 'u1', name: 'Yusuf G.', kycVerified: true),
      );
      getIt.registerSingleton<SessionManager>(session);

      await tester.pumpApp(
        InvoiceHistoryPage(context: context, canVerify: true),
      );
      await tester.pumpAndSettle();

      expect(find.text('INV-2023-001'), findsOneWidget);
      expect(find.text('Direct Transfer'), findsOneWidget);

      await tester.scrollUntilVisible(
        find.text('₦1.2M'),
        200,
        scrollable: find.byType(Scrollable).first,
      );
      expect(find.text('₦1.2M'), findsOneWidget);
      expect(find.text('₦62K'), findsOneWidget);
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
      whenListen(
        cubit,
        const Stream<ContributeState>.empty(),
        initialState: const ContributeState(),
      );
      if (getIt.isRegistered<ContributeCubit>()) {
        getIt.unregister<ContributeCubit>();
      }
      getIt.registerFactory<ContributeCubit>(() => cubit);
    });

    testWidgets('advances to the allocate step on Continue', (tester) async {
      await tester.pumpApp(ContributePage(context: context));

      await tester.enterText(find.byType(TextField), '5000');
      await tester.ensureVisible(find.byType(KpButton));
      await tester.tap(find.byType(KpButton));
      await tester.pumpAndSettle();

      expect(find.text('Months Pending'), findsOneWidget);
    });

    testWidgets('formats the amount with thousands separators', (tester) async {
      await tester.pumpApp(ContributePage(context: context));

      await tester.enterText(find.byType(TextField), '1500000');
      await tester.pump();

      expect(find.text('1,500,000'), findsOneWidget);
    });
  });

  group('AllocateMonthsPage', () {
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

    testWidgets('renders the months and submits', (tester) async {
      whenListen(
        cubit,
        const Stream<ContributeState>.empty(),
        initialState: const ContributeState(),
      );

      await tester.pumpApp(AllocateMonthsPage(context: context));
      await tester.pumpAndSettle();

      expect(find.text('Months Pending'), findsOneWidget);
      expect(find.text('January'), findsOneWidget);

      await tester.ensureVisible(find.byType(KpButton));
      await tester.pumpAndSettle();
      await tester.tap(find.byType(KpButton));
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

      await tester.pumpApp(AllocateMonthsPage(context: context));
      await tester.pump();

      expect(find.byType(SnackBar), findsOneWidget);
    });
  });

  group('PayFromWalletPage', () {
    testWidgets('renders the confirm card and pays', (tester) async {
      var paid = false;
      await tester.pumpApp(
        Navigator(
          onGenerateRoute: (_) => MaterialPageRoute<void>(
            builder: (context) => TextButton(
              onPressed: () async {
                final result = await Navigator.of(context).push<bool>(
                  MaterialPageRoute<bool>(
                    builder: (_) => const PayFromWalletPage(),
                  ),
                );
                paid = result ?? false;
              },
              child: const Text('open'),
            ),
          ),
        ),
      );

      await tester.tap(find.text('open'));
      await tester.pumpAndSettle();

      expect(find.text('Confirm Payment'), findsOneWidget);
      expect(find.text('₦7,500.00'), findsOneWidget);

      await tester.ensureVisible(find.byType(KpButton));
      await tester.tap(find.byType(KpButton));
      await tester.pumpAndSettle();

      expect(paid, isTrue);
    });

    testWidgets('renders the insufficient-balance card', (tester) async {
      await tester.pumpApp(
        PayFromWalletPage(
          wallet: PayWalletView(
            walletBalance: Money.naira(1000),
            invoiceAmount: Money.naira(5000),
            monthlySpent: Money.naira(45000),
            monthlyLimit: Money.naira(100000),
          ),
        ),
      );

      expect(find.byType(KpButton), findsOneWidget);
      expect(find.text('₦5,000.00'), findsWidgets);
    });
  });
}
