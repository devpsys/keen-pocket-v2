import 'dart:async';
import 'dart:developer' as developer;

import 'package:flutter/widgets.dart';

import 'package:keenpockets/app/app.dart';
import 'package:keenpockets/core/config/app_config.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/sync/sync_service.dart';
import 'package:keenpockets/features/contributions/data/sync/contribution_outbox_handler.dart';

/// Single composition root used by every flavor's `main`.
///
/// Sets up error capture, dependency injection (with the flavor [config]) and
/// runs the app inside a guarded zone so no error goes unlogged.
Future<void> bootstrap(AppConfig config) async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      FlutterError.onError = (details) {
        developer.log(
          'FlutterError',
          name: 'bootstrap',
          error: details.exception,
          stackTrace: details.stack,
        );
      };

      await configureDependencies(config);

      // Register outbox handlers and start syncing queued mutations.
      getIt<SyncService>()
        ..registerHandler(getIt<ContributionOutboxHandler>())
        ..start();

      runApp(const KeenPocketsApp());
    },
    (error, stack) {
      developer.log(
        'Uncaught zone error',
        name: 'bootstrap',
        error: error,
        stackTrace: stack,
      );
    },
  );
}
