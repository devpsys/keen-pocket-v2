import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/sync/outbox_entry.dart';
import 'package:keenpockets/features/contributions/data/datasources/contribution_remote_datasource.dart';
import 'package:keenpockets/features/contributions/data/dtos/invoice_dto.dart';
import 'package:keenpockets/features/contributions/data/sync/contribution_outbox_handler.dart';
import 'package:keenpockets/features/contributions/domain/value_objects/contribution_context.dart';
import 'package:mocktail/mocktail.dart';

class _MockRemote extends Mock implements ContributionRemoteDataSource {}

void main() {
  late _MockRemote remote;
  late ContributionOutboxHandler handler;

  const dto = InvoiceDto(id: 'i1', contributorId: 'u1', totalKobo: 500000);

  const entry = OutboxEntry(
    id: 1,
    type: kContributionSubmitType,
    idempotencyKey: 'k1',
    payload: {
      'host': 'pocket',
      'hostId': 'p1',
      'reference': null,
      'amountKobo': 500000,
    },
  );

  setUpAll(() => registerFallbackValue(ContributionContext.pocket('x')));
  setUp(() {
    remote = _MockRemote();
    handler = ContributionOutboxHandler(remote);
  });

  test('replays the submission and returns true on success', () async {
    when(
      () => remote.submitContribution(
        context: any(named: 'context'),
        amountKobo: any(named: 'amountKobo'),
      ),
    ).thenAnswer((_) async => dto);

    final ok = await handler.process(entry);

    expect(ok, isTrue);
    verify(
      () => remote.submitContribution(
        context: any(named: 'context'),
        amountKobo: 500000,
      ),
    ).called(1);
  });

  test('returns false (retry) when the backend errors', () async {
    when(
      () => remote.submitContribution(
        context: any(named: 'context'),
        amountKobo: any(named: 'amountKobo'),
      ),
    ).thenThrow(const ServerException('boom', statusCode: 500));

    expect(await handler.process(entry), isFalse);
  });
}
