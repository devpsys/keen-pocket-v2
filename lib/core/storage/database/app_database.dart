import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:injectable/injectable.dart';

part 'app_database.g.dart';

/// The offline mutation queue (outbox). Relational caches (pockets, invoices,
/// adashi cycles) will be added as additional tables as those features adopt
/// offline-first reads.
class OutboxRows extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get type => text()();
  TextColumn get payload => text()(); // JSON
  TextColumn get idempotencyKey => text().unique()();
  IntColumn get attempts => integer().withDefault(const Constant(0))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

/// App-wide drift database. Registered as a lazy singleton.
@lazySingleton
@DriftDatabase(tables: [OutboxRows])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_open());

  /// Testing constructor that accepts an in-memory/custom executor.
  AppDatabase.forTesting(super.executor);

  @override
  int get schemaVersion => 1;

  static QueryExecutor _open() => driftDatabase(name: 'keenpockets');
}
