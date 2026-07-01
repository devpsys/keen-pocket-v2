import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/features/trust/domain/entities/trust_profile.dart';
import 'package:keenpockets/features/trust/domain/repositories/trust_repository.dart';
import 'package:keenpockets/features/trust/domain/usecases/get_trust_profile.dart';
import 'package:mocktail/mocktail.dart';

class _MockTrustRepository extends Mock implements TrustRepository {}

const _trust = TrustProfile(
  score: 82,
  band: 'Keen Pioneer',
  kycVerified: true,
  ratings: [Rating(author: 'Sarah J.', stars: 5, comment: 'Great')],
);

void main() {
  late _MockTrustRepository repository;
  late GetTrustProfile useCase;

  setUp(() {
    repository = _MockTrustRepository();
    useCase = GetTrustProfile(repository);
  });

  test('delegates to the repository and returns the profile', () async {
    when(
      () => repository.getMyTrust(),
    ).thenAnswer((_) async => const Right(_trust));

    final result = await useCase(const NoParams());

    expect(result.toNullable(), _trust);
    verify(() => repository.getMyTrust()).called(1);
  });

  test('propagates failures', () async {
    when(
      () => repository.getMyTrust(),
    ).thenAnswer((_) async => const Left(NetworkFailure()));

    final result = await useCase(const NoParams());

    expect(result.getLeft().toNullable(), isA<NetworkFailure>());
  });
}
