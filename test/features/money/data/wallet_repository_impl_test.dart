import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/network/connectivity_checker.dart';
import 'package:keenpockets/features/money/data/datasources/wallet_remote_datasource.dart';
import 'package:keenpockets/features/money/data/dtos/wallet_dto.dart';
import 'package:keenpockets/features/money/data/repositories/wallet_repository_impl.dart';
import 'package:keenpockets/features/money/domain/entities/wallet.dart';
import 'package:mocktail/mocktail.dart';

class _MockRemote extends Mock implements WalletRemoteDataSource {}

class _MockConnectivity extends Mock implements ConnectivityChecker {}

const _dto = WalletDto(
  balance: 1250000,
  transactions: [
    WalletTransactionDto(
      id: 't1',
      label: 'Top up',
      amount: 500000,
      isCredit: true,
      kind: 'top_up',
      createdAt: 'Today',
      balanceAfter: 1250000,
      status: 'success',
    ),
  ],
);

void main() {
  late _MockRemote remote;
  late _MockConnectivity connectivity;
  late WalletRepositoryImpl repository;

  setUp(() {
    remote = _MockRemote();
    connectivity = _MockConnectivity();
    repository = WalletRepositoryImpl(remote, connectivity);
  });

  test('returns NetworkFailure when offline (no remote call)', () async {
    when(() => connectivity.isConnected).thenAnswer((_) async => false);

    final result = await repository.getWallet();

    expect(result.getLeft().toNullable(), isA<NetworkFailure>());
    verifyNever(() => remote.getWallet());
  });

  test('maps kobo → Money and the txn kind/status on success', () async {
    when(() => connectivity.isConnected).thenAnswer((_) async => true);
    when(() => remote.getWallet()).thenAnswer((_) async => _dto);

    final result = await repository.getWallet();
    final wallet = result.toNullable();

    expect(wallet?.balance, Money.naira(12500));
    expect(wallet?.transactions.first.kind, WalletTxnKind.topUp);
    expect(wallet?.transactions.first.status, WalletTxnStatus.success);
    expect(wallet?.transactions.first.amount, Money.naira(5000));
  });

  test('maps ServerException to ServerFailure', () async {
    when(() => connectivity.isConnected).thenAnswer((_) async => true);
    when(
      () => remote.getWallet(),
    ).thenThrow(const ServerException('boom', statusCode: 500));

    final result = await repository.getWallet();

    expect(result.getLeft().toNullable(), isA<ServerFailure>());
  });
}
