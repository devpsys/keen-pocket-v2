import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/features/profile/domain/entities/profile.dart';
import 'package:keenpockets/features/profile/domain/repositories/profile_repository.dart';
import 'package:keenpockets/features/profile/domain/usecases/get_profile.dart';
import 'package:mocktail/mocktail.dart';

class _MockProfileRepository extends Mock implements ProfileRepository {}

const _profile = Profile(
  name: 'Ada',
  phone: '+234 801',
  level: 12,
  trustScore: 92,
  tier: 'Keen Pioneer',
  tierBlurb: 'Top 5%',
  kycVerified: true,
  paymentReliability: 98,
  pocketsJoined: 12,
  adashisCompleted: 5,
  avgRating: 4.9,
);

void main() {
  late _MockProfileRepository repository;
  late GetProfile useCase;

  setUp(() {
    repository = _MockProfileRepository();
    useCase = GetProfile(repository);
  });

  test('delegates to the repository and returns the profile', () async {
    when(
      () => repository.getProfile(),
    ).thenAnswer((_) async => const Right(_profile));

    final result = await useCase(const NoParams());

    expect(result.toNullable(), _profile);
    verify(() => repository.getProfile()).called(1);
  });

  test('propagates failures from the repository', () async {
    when(
      () => repository.getProfile(),
    ).thenAnswer((_) async => const Left(NetworkFailure()));

    final result = await useCase(const NoParams());

    expect(result.getLeft().toNullable(), isA<NetworkFailure>());
  });
}
