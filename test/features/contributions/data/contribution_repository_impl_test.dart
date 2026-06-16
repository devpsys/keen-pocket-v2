import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/network/connectivity_checker.dart';
import 'package:keenpockets/features/contributions/data/datasources/contribution_remote_datasource.dart';
import 'package:keenpockets/features/contributions/data/dtos/invoice_dto.dart';
import 'package:keenpockets/features/contributions/data/repositories/contribution_repository_impl.dart';
import 'package:keenpockets/features/contributions/domain/entities/invoice.dart';
import 'package:keenpockets/features/contributions/domain/value_objects/contribution_context.dart';
import 'package:mocktail/mocktail.dart';

class _MockRemote extends Mock implements ContributionRemoteDataSource {}

class _MockConnectivity extends Mock implements ConnectivityChecker {}

void main() {
  late _MockRemote remote;
  late _MockConnectivity connectivity;
  late ContributionRepositoryImpl repository;

  final context = ContributionContext.pocket('p1');
  const dto = InvoiceDto(
    id: 'i1',
    contributorId: 'u1',
    totalKobo: 500000,
    status: 'verified',
    items: [InvoiceItemDto(id: 'it1', label: 'Hand', amountKobo: 500000)],
  );

  setUpAll(() {
    registerFallbackValue(ContributionContext.pocket('x'));
  });

  setUp(() {
    remote = _MockRemote();
    connectivity = _MockConnectivity();
    repository = ContributionRepositoryImpl(remote, connectivity);
  });

  test('getInvoices returns NetworkFailure when offline', () async {
    when(() => connectivity.isConnected).thenAnswer((_) async => false);

    final result = await repository.getInvoices(context);

    expect(result.getLeft().toNullable(), isA<NetworkFailure>());
    verifyNever(() => remote.getInvoices(any()));
  });

  test('getInvoices maps DTOs (incl. status + money + items)', () async {
    when(() => connectivity.isConnected).thenAnswer((_) async => true);
    when(() => remote.getInvoices(any())).thenAnswer((_) async => [dto]);

    final result = await repository.getInvoices(context);

    final invoices = result.toNullable()!;
    expect(invoices, hasLength(1));
    expect(invoices.first.status, InvoiceStatus.verified);
    expect(invoices.first.total.kobo, 500000);
    expect(invoices.first.items.first.amount.kobo, 500000);
  });

  test('verifyInvoice maps ServerException to ServerFailure', () async {
    when(() => connectivity.isConnected).thenAnswer((_) async => true);
    when(
      () => remote.verifyInvoice('i1'),
    ).thenThrow(const ServerException('boom', statusCode: 500));

    final result = await repository.verifyInvoice('i1');

    expect(result.getLeft().toNullable(), isA<ServerFailure>());
  });
}
