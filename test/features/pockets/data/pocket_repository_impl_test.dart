import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/network/connectivity_checker.dart';
import 'package:keenpockets/features/pockets/data/datasources/pocket_remote_datasource.dart';
import 'package:keenpockets/features/pockets/data/dtos/pocket_dto.dart';
import 'package:keenpockets/features/pockets/data/repositories/pocket_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

class _MockRemote extends Mock implements PocketRemoteDataSource {}

class _MockConnectivity extends Mock implements ConnectivityChecker {}

void main() {
  late _MockRemote remote;
  late _MockConnectivity connectivity;
  late PocketRepositoryImpl repository;

  const dto = PocketDto(
    id: 'p1',
    name: 'Rent',
    organiserId: 'u1',
    handPriceKobo: 500000,
    totalHands: 10,
    filledHands: 4,
    memberCount: 4,
    memberIds: ['u2', 'u3'],
  );

  setUp(() {
    remote = _MockRemote();
    connectivity = _MockConnectivity();
    repository = PocketRepositoryImpl(remote, connectivity);
  });

  group('getMyPockets', () {
    test('returns NetworkFailure when offline', () async {
      when(() => connectivity.isConnected).thenAnswer((_) async => false);

      final result = await repository.getMyPockets();

      expect(result.getLeft().toNullable(), isA<NetworkFailure>());
      verifyNever(() => remote.getMyPockets());
    });

    test('maps DTOs to entities on success', () async {
      when(() => connectivity.isConnected).thenAnswer((_) async => true);
      when(() => remote.getMyPockets()).thenAnswer((_) async => [dto]);

      final result = await repository.getMyPockets();

      final pockets = result.toNullable()!;
      expect(pockets, hasLength(1));
      expect(pockets.first.name, 'Rent');
      expect(pockets.first.handPrice.kobo, 500000);
      expect(pockets.first.memberIds, {'u2', 'u3'});
    });

    test('maps ServerException to ServerFailure', () async {
      when(() => connectivity.isConnected).thenAnswer((_) async => true);
      when(
        () => remote.getMyPockets(),
      ).thenThrow(const ServerException('boom', statusCode: 500));

      final result = await repository.getMyPockets();

      expect(result.getLeft().toNullable(), isA<ServerFailure>());
    });
  });

  group('getPocket', () {
    test('returns the mapped entity', () async {
      when(() => connectivity.isConnected).thenAnswer((_) async => true);
      when(() => remote.getPocket('p1')).thenAnswer((_) async => dto);

      final result = await repository.getPocket('p1');

      expect(result.toNullable()?.id, 'p1');
    });
  });
}
