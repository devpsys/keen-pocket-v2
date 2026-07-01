import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/network/connectivity_checker.dart';
import 'package:keenpockets/features/plans/data/datasources/plans_remote_datasource.dart';
import 'package:keenpockets/features/plans/data/dtos/plan_dto.dart';
import 'package:keenpockets/features/plans/data/repositories/plans_repository_impl.dart';
import 'package:keenpockets/features/plans/domain/entities/plan.dart';
import 'package:keenpockets/features/plans/domain/repositories/plans_repository.dart';
import 'package:keenpockets/features/plans/domain/usecases/get_plans.dart';
import 'package:mocktail/mocktail.dart';

class _MockRemote extends Mock implements PlansRemoteDataSource {}

class _MockConnectivity extends Mock implements ConnectivityChecker {}

class _MockPlansRepository extends Mock implements PlansRepository {}

const _dto = PlanDto(
  id: 'pl1',
  name: 'Family Groceries',
  periodLabel: 'June 2026',
  cadence: 'weekly',
  bought: 8,
  pending: 5,
  deferred: 2,
  spent: 520000,
  budget: 800000,
);

void main() {
  group('PlansRepositoryImpl', () {
    late _MockRemote remote;
    late _MockConnectivity connectivity;
    late PlansRepositoryImpl repository;

    setUp(() {
      remote = _MockRemote();
      connectivity = _MockConnectivity();
      repository = PlansRepositoryImpl(remote, connectivity);
    });

    test('returns NetworkFailure when offline', () async {
      when(() => connectivity.isConnected).thenAnswer((_) async => false);

      final result = await repository.getPlans();

      expect(result.getLeft().toNullable(), isA<NetworkFailure>());
      verifyNever(() => remote.getPlans());
    });

    test('maps kobo → Money and cadence token on success', () async {
      when(() => connectivity.isConnected).thenAnswer((_) async => true);
      when(() => remote.getPlans()).thenAnswer((_) async => [_dto]);

      final plan = (await repository.getPlans()).toNullable()?.single;

      expect(plan?.name, 'Family Groceries');
      expect(plan?.cadence, PlanCadence.weekly);
      expect(plan?.spent, Money.naira(5200));
      expect(plan?.budget, Money.naira(8000));
    });

    test('maps ServerException to ServerFailure', () async {
      when(() => connectivity.isConnected).thenAnswer((_) async => true);
      when(
        () => remote.getPlans(),
      ).thenThrow(const ServerException('boom', statusCode: 500));

      final result = await repository.getPlans();

      expect(result.getLeft().toNullable(), isA<ServerFailure>());
    });
  });

  test('GetPlans delegates to the repository', () async {
    final repository = _MockPlansRepository();
    when(
      () => repository.getPlans(),
    ).thenAnswer((_) async => const Right(<Plan>[]));

    final result = await GetPlans(repository)(const NoParams());

    expect(result.isRight(), isTrue);
    verify(() => repository.getPlans()).called(1);
  });
}
