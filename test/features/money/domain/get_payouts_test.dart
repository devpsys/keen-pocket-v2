import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/features/money/domain/entities/payout.dart';
import 'package:keenpockets/features/money/domain/repositories/payouts_repository.dart';
import 'package:keenpockets/features/money/domain/usecases/get_payouts.dart';
import 'package:mocktail/mocktail.dart';

class _MockPayoutsRepository extends Mock implements PayoutsRepository {}

const _hub = PayoutsHub(
  payouts: [],
  collections: [],
  bankAccounts: [],
  totalCollected: Money.zero,
);

void main() {
  late _MockPayoutsRepository repository;
  late GetPayouts useCase;

  setUp(() {
    repository = _MockPayoutsRepository();
    useCase = GetPayouts(repository);
  });

  test('delegates to the repository and returns the hub', () async {
    when(
      () => repository.getPayoutsHub(),
    ).thenAnswer((_) async => const Right(_hub));

    final result = await useCase(const NoParams());

    expect(result.toNullable(), _hub);
    verify(() => repository.getPayoutsHub()).called(1);
  });

  test('propagates failures', () async {
    when(
      () => repository.getPayoutsHub(),
    ).thenAnswer((_) async => const Left(NetworkFailure()));

    final result = await useCase(const NoParams());

    expect(result.getLeft().toNullable(), isA<NetworkFailure>());
  });
}
