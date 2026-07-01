import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/network/connectivity_checker.dart';
import 'package:keenpockets/features/money/data/datasources/payouts_remote_datasource.dart';
import 'package:keenpockets/features/money/data/dtos/payouts_dto.dart';
import 'package:keenpockets/features/money/data/repositories/payouts_repository_impl.dart';
import 'package:keenpockets/features/money/domain/entities/payout.dart';
import 'package:mocktail/mocktail.dart';

class _MockRemote extends Mock implements PayoutsRemoteDataSource {}

class _MockConnectivity extends Mock implements ConnectivityChecker {}

const _dto = PayoutsHubDto(
  totalCollected: 145040000,
  bankAccounts: [
    BankAccountDto(
      id: 'c1',
      label: 'Emergency Fund',
      subtitle: 'Primary Savings',
      bankName: 'Zenith Bank',
      maskedNuban: '**** 5521',
    ),
  ],
  collections: [
    PayoutCollectionDto(
      id: 'c1',
      name: 'Emergency Fund',
      bankName: 'Zenith Bank',
      amount: 25040000,
      percent: 0.65,
    ),
  ],
  payouts: [
    PayoutDto(
      id: 'p1',
      reference: 'KP-9921-X',
      amount: 4500000,
      status: 'pending',
    ),
  ],
);

void main() {
  late _MockRemote remote;
  late _MockConnectivity connectivity;
  late PayoutsRepositoryImpl repository;

  setUp(() {
    remote = _MockRemote();
    connectivity = _MockConnectivity();
    repository = PayoutsRepositoryImpl(remote, connectivity);
  });

  test('returns NetworkFailure when offline (no remote call)', () async {
    when(() => connectivity.isConnected).thenAnswer((_) async => false);

    final result = await repository.getPayoutsHub();

    expect(result.getLeft().toNullable(), isA<NetworkFailure>());
    verifyNever(() => remote.getPayoutsHub());
  });

  test('maps kobo → Money and payout status on success', () async {
    when(() => connectivity.isConnected).thenAnswer((_) async => true);
    when(() => remote.getPayoutsHub()).thenAnswer((_) async => _dto);

    final hub = (await repository.getPayoutsHub()).toNullable();

    expect(hub?.totalCollected, Money.naira(1450400));
    expect(hub?.bankAccounts.single.label, 'Emergency Fund');
    expect(hub?.collections.single.amount, Money.naira(250400));
    expect(hub?.payouts.single.status, PayoutStatus.pending);
    expect(hub?.payouts.single.amount, Money.naira(45000));
  });

  test('maps UnauthorizedException to AuthFailure', () async {
    when(() => connectivity.isConnected).thenAnswer((_) async => true);
    when(
      () => remote.getPayoutsHub(),
    ).thenThrow(const UnauthorizedException('nope'));

    final result = await repository.getPayoutsHub();

    expect(result.getLeft().toNullable(), isA<AuthFailure>());
  });
}
