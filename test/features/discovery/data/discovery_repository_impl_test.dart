import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/network/connectivity_checker.dart';
import 'package:keenpockets/features/discovery/data/datasources/discovery_remote_datasource.dart';
import 'package:keenpockets/features/discovery/data/dtos/discover_item_dto.dart';
import 'package:keenpockets/features/discovery/data/repositories/discovery_repository_impl.dart';
import 'package:keenpockets/features/discovery/domain/entities/discover_item.dart';
import 'package:mocktail/mocktail.dart';

class _MockRemote extends Mock implements DiscoveryRemoteDataSource {}

class _MockConnectivity extends Mock implements ConnectivityChecker {}

const _dto = DiscoverItemDto(
  id: 'a10',
  name: 'Esusu Masters',
  type: 'adashi',
  emoji: '🔄',
  adminName: 'Bankole',
  badge: 'official',
  contribution: 1000000,
  contributionUnit: 'cycle',
  metricValue: 'June 1st',
  metricIsStartDate: true,
  rating: 4.2,
  memberCount: 8,
);

void main() {
  late _MockRemote remote;
  late _MockConnectivity connectivity;
  late DiscoveryRepositoryImpl repository;

  setUp(() {
    remote = _MockRemote();
    connectivity = _MockConnectivity();
    repository = DiscoveryRepositoryImpl(remote, connectivity);
  });

  test('returns NetworkFailure when offline', () async {
    when(() => connectivity.isConnected).thenAnswer((_) async => false);

    final result = await repository.discover('');

    expect(result.getLeft().toNullable(), isA<NetworkFailure>());
    verifyNever(() => remote.discover(any()));
  });

  test('maps kobo → Money and type/badge tokens on success', () async {
    when(() => connectivity.isConnected).thenAnswer((_) async => true);
    when(() => remote.discover('esusu')).thenAnswer((_) async => [_dto]);

    final item = (await repository.discover('esusu')).toNullable()?.single;

    expect(item?.name, 'Esusu Masters');
    expect(item?.type, DiscoverItemType.adashi);
    expect(item?.badge, DiscoverBadge.official);
    expect(item?.contribution, Money.naira(10000));
  });

  test('maps ServerException to ServerFailure', () async {
    when(() => connectivity.isConnected).thenAnswer((_) async => true);
    when(
      () => remote.discover(''),
    ).thenThrow(const ServerException('boom', statusCode: 500));

    final result = await repository.discover('');

    expect(result.getLeft().toNullable(), isA<ServerFailure>());
  });
}
