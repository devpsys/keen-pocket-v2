import 'dart:async';
import 'dart:developer' as developer;

import 'package:injectable/injectable.dart';

import '../network/connectivity_checker.dart';
import 'outbox_handler.dart';
import 'outbox_store.dart';

/// Drains the offline outbox: dispatches each queued mutation to the handler
/// registered for its type, removing successes and counting failures for retry.
/// Auto-flushes whenever connectivity is restored.
@lazySingleton
class SyncService {
  SyncService(this._store, this._connectivity);

  final OutboxStore _store;
  final ConnectivityChecker _connectivity;
  final Map<String, OutboxHandler> _handlers = {};

  StreamSubscription<bool>? _subscription;
  bool _flushing = false;

  /// Features register their handler(s) at startup (see `bootstrap`).
  void registerHandler(OutboxHandler handler) =>
      _handlers[handler.type] = handler;

  /// Begins auto-flushing on reconnect.
  void start() {
    _subscription ??= _connectivity.onStatusChanged.listen((online) {
      if (online) unawaited(flush());
    });
  }

  /// Drains all pending entries (no-op when offline or already flushing).
  Future<void> flush() async {
    if (_flushing) return;
    if (!await _connectivity.isConnected) return;
    _flushing = true;
    try {
      final entries = await _store.pending();
      for (final entry in entries) {
        final handler = _handlers[entry.type];
        if (handler == null) continue; // unknown type: leave for a later build
        try {
          final ok = await handler.process(entry);
          if (ok) {
            await _store.markProcessed(entry.id);
          } else {
            await _store.markFailed(entry.id);
          }
        } catch (e, st) {
          developer.log(
            'Outbox sync failed for ${entry.type}',
            name: 'sync',
            error: e,
            stackTrace: st,
          );
          await _store.markFailed(entry.id);
        }
      }
    } finally {
      _flushing = false;
    }
  }

  @disposeMethod
  void dispose() => _subscription?.cancel();
}
