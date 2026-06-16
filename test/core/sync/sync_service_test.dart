import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/network/connectivity_checker.dart';
import 'package:keenpockets/core/sync/outbox_entry.dart';
import 'package:keenpockets/core/sync/outbox_handler.dart';
import 'package:keenpockets/core/sync/sync_service.dart';
import 'package:mocktail/mocktail.dart';

import '../../support/fake_outbox_store.dart';

class _MockConnectivity extends Mock implements ConnectivityChecker {}

/// Handler whose result is scripted per test.
class _ScriptedHandler implements OutboxHandler {
  _ScriptedHandler(this.result);
  bool Function(OutboxEntry) result;
  final processed = <String>[];

  @override
  String get type => 'contribution.submit';

  @override
  Future<bool> process(OutboxEntry entry) async {
    processed.add(entry.idempotencyKey);
    return result(entry);
  }
}

void main() {
  late FakeOutboxStore store;
  late _MockConnectivity connectivity;

  setUp(() {
    store = FakeOutboxStore();
    connectivity = _MockConnectivity();
    when(
      () => connectivity.onStatusChanged,
    ).thenAnswer((_) => const Stream<bool>.empty());
  });

  Future<void> seed() => store.enqueue(
    type: 'contribution.submit',
    payload: {'amountKobo': 500000},
    idempotencyKey: 'k1',
  );

  test('flush is a no-op when offline', () async {
    when(() => connectivity.isConnected).thenAnswer((_) async => false);
    await seed();
    final handler = _ScriptedHandler((_) => true);
    final service = SyncService(store, connectivity)..registerHandler(handler);

    await service.flush();

    expect(handler.processed, isEmpty);
    expect(store.entries, hasLength(1));
  });

  test('flush processes and removes entries on success', () async {
    when(() => connectivity.isConnected).thenAnswer((_) async => true);
    await seed();
    final handler = _ScriptedHandler((_) => true);
    final service = SyncService(store, connectivity)..registerHandler(handler);

    await service.flush();

    expect(handler.processed, ['k1']);
    expect(store.entries, isEmpty);
  });

  test('failed processing increments attempts and keeps the entry', () async {
    when(() => connectivity.isConnected).thenAnswer((_) async => true);
    await seed();
    final handler = _ScriptedHandler((_) => false);
    final service = SyncService(store, connectivity)..registerHandler(handler);

    await service.flush();

    expect(store.entries, hasLength(1));
    expect(store.entries.first.attempts, 1);
  });

  test('unknown entry types are left untouched', () async {
    when(() => connectivity.isConnected).thenAnswer((_) async => true);
    await store.enqueue(
      type: 'something.else',
      payload: const {},
      idempotencyKey: 'k2',
    );
    final service = SyncService(store, connectivity);

    await service.flush();

    expect(store.entries, hasLength(1));
  });
}
