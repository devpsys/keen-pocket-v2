import 'outbox_entry.dart';

/// Processes one kind of queued mutation. Features register a handler with the
/// [SyncService] for the [type] they enqueue.
abstract interface class OutboxHandler {
  /// The [OutboxEntry.type] this handler is responsible for.
  String get type;

  /// Attempts to apply [entry] to the backend. Returns `true` on success
  /// (entry will be removed), `false`/throws to retry later.
  Future<bool> process(OutboxEntry entry);
}
