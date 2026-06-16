import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/error/failure_localizer.dart';
import 'package:keenpockets/core/error/failures.dart';
import 'package:keenpockets/shared/widgets/app_error_view.dart';
import 'package:keenpockets/shared/widgets/app_loading_view.dart';

import '../../helpers/pump_app.dart';

void main() {
  testWidgets('AppLoadingView shows a spinner', (tester) async {
    await tester.pumpApp(const Scaffold(body: AppLoadingView()));
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('AppErrorView shows message and retry triggers callback', (
    tester,
  ) async {
    var retried = false;
    await tester.pumpApp(
      Scaffold(
        body: AppErrorView(message: 'Boom', onRetry: () => retried = true),
      ),
    );
    expect(find.text('Boom'), findsOneWidget);
    await tester.tap(find.text('Retry'));
    expect(retried, isTrue);
  });

  testWidgets('AppErrorView hides retry when no callback', (tester) async {
    await tester.pumpApp(const Scaffold(body: AppErrorView(message: 'Boom')));
    expect(find.text('Retry'), findsNothing);
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
        UnauthorizedFailure(),
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
