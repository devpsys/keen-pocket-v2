/// A durable, queued mutation waiting to be synced to the backend.
///
/// Mutations that must survive offline (e.g. submitting a contribution) are
/// written to the outbox and drained by the [SyncService] on reconnect, keyed
/// by [type] and de-duplicated by [idempotencyKey].
class OutboxEntry {
  const OutboxEntry({
    required this.id,
    required this.type,
    required this.payload,
    required this.idempotencyKey,
    this.attempts = 0,
  });

  /// Local autoincrement id (drift row id).
  final int id;

  /// Handler discriminator, e.g. `contribution.submit`.
  final String type;

  /// JSON-serializable mutation payload.
  final Map<String, dynamic> payload;

  /// Stable key so a retried/duplicated mutation is applied once server-side.
  final String idempotencyKey;

  /// How many sync attempts have already failed.
  final int attempts;
}
