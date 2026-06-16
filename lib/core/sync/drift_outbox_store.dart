import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../storage/database/app_database.dart';
import 'outbox_entry.dart';
import 'outbox_store.dart';

/// drift-backed [OutboxStore]. App-runtime only; tests use an in-memory fake.
@LazySingleton(as: OutboxStore)
class DriftOutboxStore implements OutboxStore {
  const DriftOutboxStore(this._db);

  final AppDatabase _db;

  @override
  Future<void> enqueue({
    required String type,
    required Map<String, dynamic> payload,
    required String idempotencyKey,
  }) async {
    await _db
        .into(_db.outboxRows)
        .insert(
          OutboxRowsCompanion.insert(
            type: type,
            payload: jsonEncode(payload),
            idempotencyKey: idempotencyKey,
          ),
          mode: InsertMode.insertOrIgnore, // de-dupe by idempotencyKey
        );
  }

  @override
  Future<List<OutboxEntry>> pending({
    int maxAttempts = 5,
    int limit = 50,
  }) async {
    final query = _db.select(_db.outboxRows)
      ..where((t) => t.attempts.isSmallerThanValue(maxAttempts))
      ..orderBy([(t) => OrderingTerm.asc(t.id)])
      ..limit(limit);
    final rows = await query.get();
    return rows.map(_toEntry).toList();
  }

  @override
  Future<void> markProcessed(int id) async {
    await (_db.delete(_db.outboxRows)..where((t) => t.id.equals(id))).go();
  }

  @override
  Future<void> markFailed(int id) async {
    await _db.customUpdate(
      'UPDATE outbox_rows SET attempts = attempts + 1 WHERE id = ?',
      variables: [Variable.withInt(id)],
      updates: {_db.outboxRows},
    );
  }

  OutboxEntry _toEntry(OutboxRow row) => OutboxEntry(
    id: row.id,
    type: row.type,
    payload: jsonDecode(row.payload) as Map<String, dynamic>,
    idempotencyKey: row.idempotencyKey,
    attempts: row.attempts,
  );
}
