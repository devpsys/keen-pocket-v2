import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/features/money/domain/entities/wallet.dart';
import 'package:keenpockets/features/money/domain/repositories/wallet_repository.dart';
import 'package:keenpockets/features/money/domain/usecases/get_wallet.dart';
import 'package:mocktail/mocktail.dart';

class _MockWalletRepository extends Mock implements WalletRepository {}

final _wallet = Wallet(balance: Money.naira(12500), transactions: const []);

void main() {
  late _MockWalletRepository repository;
  late GetWallet useCase;

  setUp(() {
    repository = _MockWalletRepository();
    useCase = GetWallet(repository);
  });

  test('delegates to the repository and returns the wallet', () async {
    when(() => repository.getWallet()).thenAnswer((_) async => Right(_wallet));

    final result = await useCase(const NoParams());

    expect(result.toNullable(), _wallet);
    verify(() => repository.getWallet()).called(1);
  });

  test('propagates failures', () async {
    when(
      () => repository.getWallet(),
    ).thenAnswer((_) async => const Left(NetworkFailure()));

    final result = await useCase(const NoParams());

    expect(result.getLeft().toNullable(), isA<NetworkFailure>());
  });
}
