import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/network/connectivity_checker.dart';
import 'package:keenpockets/features/trust/data/datasources/trust_remote_datasource.dart';
import 'package:keenpockets/features/trust/data/dtos/trust_profile_dto.dart';
import 'package:keenpockets/features/trust/data/repositories/trust_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

class _MockRemote extends Mock implements TrustRemoteDataSource {}

class _MockConnectivity extends Mock implements ConnectivityChecker {}

const _dto = TrustProfileDto(
  score: 82,
  band: 'Keen Pioneer',
  kycVerified: true,
  ratings: [RatingDto(author: 'Sarah J.', stars: 5, comment: 'Great')],
);

void main() {
  late _MockRemote remote;
  late _MockConnectivity connectivity;
  late TrustRepositoryImpl repository;

  setUp(() {
    remote = _MockRemote();
    connectivity = _MockConnectivity();
    repository = TrustRepositoryImpl(remote, connectivity);
  });

  test('returns NetworkFailure when offline (no remote call)', () async {
    when(() => connectivity.isConnected).thenAnswer((_) async => false);

    final result = await repository.getMyTrust();

    expect(result.getLeft().toNullable(), isA<NetworkFailure>());
    verifyNever(() => remote.getMyTrust());
  });

  test('returns the mapped profile on success', () async {
    when(() => connectivity.isConnected).thenAnswer((_) async => true);
    when(() => remote.getMyTrust()).thenAnswer((_) async => _dto);

    final result = await repository.getMyTrust();

    expect(result.toNullable()?.score, 82);
    expect(result.toNullable()?.ratings.first.author, 'Sarah J.');
  });

  test('maps UnauthorizedException to AuthFailure', () async {
    when(() => connectivity.isConnected).thenAnswer((_) async => true);
    when(
      () => remote.getMyTrust(),
    ).thenThrow(const UnauthorizedException('nope'));

    final result = await repository.getMyTrust();

    expect(result.getLeft().toNullable(), isA<AuthFailure>());
  });
}
