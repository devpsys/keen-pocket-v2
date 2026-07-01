import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/network/connectivity_checker.dart';
import 'package:keenpockets/features/profile/data/datasources/profile_remote_datasource.dart';
import 'package:keenpockets/features/profile/data/dtos/profile_dto.dart';
import 'package:keenpockets/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

class _MockRemote extends Mock implements ProfileRemoteDataSource {}

class _MockConnectivity extends Mock implements ConnectivityChecker {}

const _dto = ProfileDto(
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
  late _MockRemote remote;
  late _MockConnectivity connectivity;
  late ProfileRepositoryImpl repository;

  setUp(() {
    remote = _MockRemote();
    connectivity = _MockConnectivity();
    repository = ProfileRepositoryImpl(remote, connectivity);
  });

  test('returns NetworkFailure when offline (no remote call)', () async {
    when(() => connectivity.isConnected).thenAnswer((_) async => false);

    final result = await repository.getProfile();

    expect(result.getLeft().toNullable(), isA<NetworkFailure>());
    verifyNever(() => remote.getProfile());
  });

  test('returns the mapped profile on success', () async {
    when(() => connectivity.isConnected).thenAnswer((_) async => true);
    when(() => remote.getProfile()).thenAnswer((_) async => _dto);

    final result = await repository.getProfile();

    expect(result.toNullable()?.name, 'Ada');
    expect(result.toNullable()?.trustScore, 92);
  });

  test('maps UnauthorizedException to AuthFailure', () async {
    when(() => connectivity.isConnected).thenAnswer((_) async => true);
    when(
      () => remote.getProfile(),
    ).thenThrow(const UnauthorizedException('nope'));

    final result = await repository.getProfile();

    expect(result.getLeft().toNullable(), isA<AuthFailure>());
  });

  test('maps ServerException to ServerFailure', () async {
    when(() => connectivity.isConnected).thenAnswer((_) async => true);
    when(
      () => remote.getProfile(),
    ).thenThrow(const ServerException('boom', statusCode: 500));

    final result = await repository.getProfile();

    expect(result.getLeft().toNullable(), isA<ServerFailure>());
  });
}
