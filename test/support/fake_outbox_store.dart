import 'package:keenpockets/core/sync/outbox_entry.dart';
import 'package:keenpockets/core/sync/outbox_store.dart';

/// In-memory [OutboxStore] for tests — no drift / sqlite required.
class FakeOutboxStore implements OutboxStore {
  final List<OutboxEntry> entries = [];
  int _nextId = 1;

  @override
  Future<void> enqueue({
    required String type,
    required Map<String, dynamic> payload,
    required String idempotencyKey,
  }) async {
    // De-dupe by idempotencyKey, mirroring the drift insertOrIgnore behavior.
    if (entries.any((e) => e.idempotencyKey == idempotencyKey)) return;
    entries.add(
      OutboxEntry(
        id: _nextId++,
        type: type,
        payload: payload,
        idempotencyKey: idempotencyKey,
      ),
    );
  }

  @override
  Future<List<OutboxEntry>> pending({
    int maxAttempts = 5,
    int limit = 50,
  }) async =>
      entries.where((e) => e.attempts < maxAttempts).take(limit).toList();

  @override
  Future<void> markProcessed(int id) async =>
      entries.removeWhere((e) => e.id == id);

  @override
  Future<void> markFailed(int id) async {
    final i = entries.indexWhere((e) => e.id == id);
    if (i == -1) return;
    final e = entries[i];
    entries[i] = OutboxEntry(
      id: e.id,
      type: e.type,
      payload: e.payload,
      idempotencyKey: e.idempotencyKey,
      attempts: e.attempts + 1,
    );
  }
}
