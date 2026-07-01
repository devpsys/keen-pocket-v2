import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/network/connectivity_checker.dart';
import 'package:keenpockets/features/charity/data/datasources/charity_remote_datasource.dart';
import 'package:keenpockets/features/charity/data/dtos/charity_drive_dto.dart';
import 'package:keenpockets/features/charity/data/repositories/charity_repository_impl.dart';
import 'package:keenpockets/features/charity/domain/entities/charity_drive.dart';
import 'package:keenpockets/features/charity/domain/repositories/charity_repository.dart';
import 'package:keenpockets/features/charity/domain/usecases/get_charity_drive.dart';
import 'package:mocktail/mocktail.dart';

class _MockRemote extends Mock implements CharityRemoteDataSource {}

class _MockConnectivity extends Mock implements ConnectivityChecker {}

class _MockCharityRepository extends Mock implements CharityRepository {}

const _dto = CharityDriveDto(
  title: 'Support the Relief Fund',
  goal: 20000000,
  raised: 12000000,
  donorCount: 24,
);

void main() {
  group('CharityRepositoryImpl', () {
    late _MockRemote remote;
    late _MockConnectivity connectivity;
    late CharityRepositoryImpl repository;

    setUp(() {
      remote = _MockRemote();
      connectivity = _MockConnectivity();
      repository = CharityRepositoryImpl(remote, connectivity);
    });

    test('returns NetworkFailure when offline', () async {
      when(() => connectivity.isConnected).thenAnswer((_) async => false);

      final result = await repository.getDrive('p1');

      expect(result.getLeft().toNullable(), isA<NetworkFailure>());
      verifyNever(() => remote.getDrive(any()));
    });

    test('maps kobo → Money on success', () async {
      when(() => connectivity.isConnected).thenAnswer((_) async => true);
      when(() => remote.getDrive('p1')).thenAnswer((_) async => _dto);

      final drive = (await repository.getDrive('p1')).toNullable();

      expect(drive?.title, 'Support the Relief Fund');
      expect(drive?.goal, Money.naira(200000));
      expect(drive?.donorCount, 24);
    });

    test('maps ServerException to ServerFailure', () async {
      when(() => connectivity.isConnected).thenAnswer((_) async => true);
      when(
        () => remote.getDrive('p1'),
      ).thenThrow(const ServerException('boom', statusCode: 500));

      final result = await repository.getDrive('p1');

      expect(result.getLeft().toNullable(), isA<ServerFailure>());
    });
  });

  group('GetCharityDrive', () {
    test('delegates to the repository with the pocket id', () async {
      final repository = _MockCharityRepository();
      when(
        () => repository.getDrive('p1'),
      ).thenAnswer((_) async => const Right(_dto2));

      final result = await GetCharityDrive(repository)('p1');

      expect(result.isRight(), isTrue);
      verify(() => repository.getDrive('p1')).called(1);
    });
  });
}

const _dto2 = CharityDrive(
  title: 'x',
  goal: Money(1),
  raised: Money(0),
  donorCount: 0,
);
