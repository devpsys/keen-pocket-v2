import 'package:core/error/failures.dart';
import 'package:core/presentation/state_status.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/error/failure_localizer.dart';

import '../../helpers/pump_app.dart';

void main() {
  testWidgets('KpLoadingView shows a spinner', (tester) async {
    await tester.pumpApp(const Scaffold(body: KpLoadingView()));
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('KpErrorView shows message and retry triggers callback', (
    tester,
  ) async {
    var retried = false;
    await tester.pumpApp(
      Scaffold(
        body: KpErrorView(
          message: 'Boom',
          retryLabel: 'Retry',
          onRetry: () => retried = true,
        ),
      ),
    );
    expect(find.text('Boom'), findsOneWidget);
    await tester.tap(find.text('Retry'));
    expect(retried, isTrue);
  });

  testWidgets('KpErrorView hides retry when no callback', (tester) async {
    await tester.pumpApp(const Scaffold(body: KpErrorView(message: 'Boom')));
    expect(find.text('Retry'), findsNothing);
  });

  testWidgets('KpComingSoonCard renders title and message', (tester) async {
    await tester.pumpApp(
      const Scaffold(
        body: KpComingSoonCard(title: 'Soon', message: 'Wait'),
      ),
    );
    expect(find.text('Soon'), findsOneWidget);
    expect(find.text('Wait'), findsOneWidget);
  });

  group('KpAsyncView', () {
    testWidgets('renders loaded for success', (tester) async {
      await tester.pumpApp(
        Scaffold(
          body: KpAsyncView(
            status: StateStatus.success,
            loaded: (_) => const Text('content'),
          ),
        ),
      );
      expect(find.text('content'), findsOneWidget);
    });

    testWidgets('renders the default spinner for loading', (tester) async {
      await tester.pumpApp(
        Scaffold(
          body: KpAsyncView(
            status: StateStatus.loading,
            loaded: (_) => const Text('content'),
          ),
        ),
      );
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('content'), findsNothing);
    });

    testWidgets('renders the supplied failure widget', (tester) async {
      await tester.pumpApp(
        Scaffold(
          body: KpAsyncView(
            status: StateStatus.failure,
            loaded: (_) => const Text('content'),
            failure: const KpErrorView(message: 'nope'),
          ),
        ),
      );
      expect(find.text('nope'), findsOneWidget);
    });
  });

  group('FailureLocalizer', () {
    testWidgets('maps every failure to a non-empty localized string', (
      tester,
    ) async {
      late BuildContext ctx;
      await tester.pumpApp(
        Builder(
          builder: (context) {
            ctx = context;
            return const SizedBox.shrink();
          },
        ),
      );

      const failures = <Failure>[
        NetworkFailure(),
        ServerFailure(),
        AuthFailure(),
        PermissionFailure(),
        FeatureDisabledFailure(),
        CacheFailure(),
        ValidationFailure(),
        UnexpectedFailure(),
      ];
      for (final f in failures) {
        expect(f.localizedMessage(ctx), isNotEmpty);
      }
    });
  });
}
