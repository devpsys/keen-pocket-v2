import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/feature_flags/feature.dart';
import 'package:keenpockets/core/feature_flags/feature_flag_service.dart';
import 'package:keenpockets/features/plans/domain/entities/plan.dart';
import 'package:keenpockets/features/plans/domain/usecases/get_plans.dart';
import 'package:keenpockets/features/plans/presentation/cubit/plans_cubit.dart';
import 'package:keenpockets/features/plans/presentation/cubit/plans_state.dart';
import 'package:keenpockets/features/plans/presentation/pages/plans_page.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/pump_app.dart';

class _MockGetPlans extends Mock implements GetPlans {}

const _plans = [
  Plan(
    id: 'pl1',
    name: 'Family Groceries',
    periodLabel: 'June 2026',
    cadence: PlanCadence.monthly,
    bought: 8,
    pending: 5,
    deferred: 2,
    spent: Money(520000),
    budget: Money(800000),
  ),
];

void main() {
  late _MockGetPlans getPlans;

  setUpAll(() => registerFallbackValue(const NoParams()));

  setUp(() {
    getPlans = _MockGetPlans();
    when(() => getPlans(any())).thenAnswer((_) async => const Right(_plans));
  });

  PlansCubit build() => PlansCubit(getPlans);

  blocTest<PlansCubit, PlansState>(
    'emits [loading, success] with plans',
    build: build,
    act: (cubit) => cubit.load(),
    expect: () => [
      isA<PlansState>().having((s) => s.status, 'status', StateStatus.loading),
      isA<PlansState>()
          .having((s) => s.status, 'status', StateStatus.success)
          .having((s) => s.plans, 'plans', isNotEmpty),
    ],
  );

  blocTest<PlansCubit, PlansState>(
    'emits failure when the use case fails',
    setUp: () => when(
      () => getPlans(any()),
    ).thenAnswer((_) async => const Left(NetworkFailure())),
    build: build,
    act: (cubit) => cubit.load(),
    expect: () => [
      isA<PlansState>().having((s) => s.status, 'status', StateStatus.loading),
      isA<PlansState>().having((s) => s.status, 'status', StateStatus.failure),
    ],
  );

  group('PlansPage flag gating (backend-gap, built dark)', () {
    tearDown(() => getIt.reset());

    testWidgets('shows coming-soon when PLANS flag is OFF', (tester) async {
      getIt
        ..registerSingleton<FeatureFlagService>(FeatureFlagService())
        ..registerFactory<PlansCubit>(build);

      await tester.pumpApp(const PlansPage());
      await tester.pumpAndSettle();

      expect(find.text('Coming soon'), findsOneWidget);
    });

    testWidgets('shows plans when the flag is ON', (tester) async {
      getIt
        ..registerSingleton<FeatureFlagService>(
          FeatureFlagService()..hydrate({Feature.plans: true}),
        )
        ..registerFactory<PlansCubit>(build);

      await tester.pumpApp(const PlansPage());
      await tester.pumpAndSettle();

      expect(find.text('Family Groceries'), findsOneWidget);
    });
  });
}
