import 'outbox_entry.dart';

/// Persistence for the offline mutation queue. Implemented over drift
/// ([DriftOutboxStore]); faked in tests so the sync logic never needs sqlite.
abstract interface class OutboxStore {
  /// Appends a mutation to the queue.
  Future<void> enqueue({
    required String type,
    required Map<String, dynamic> payload,
    required String idempotencyKey,
  });

  /// Pending entries that haven't exceeded [maxAttempts], oldest first.
  Future<List<OutboxEntry>> pending({int maxAttempts = 5, int limit = 50});

  /// Removes an entry that was synced successfully (or dead-lettered).
  Future<void> markProcessed(int id);

  /// Records a failed attempt (increments the attempt counter).
  Future<void> markFailed(int id);
}
