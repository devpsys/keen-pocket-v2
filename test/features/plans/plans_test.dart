import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/feature_flags/feature.dart';
import 'package:keenpockets/core/feature_flags/feature_flag_service.dart';
import 'package:keenpockets/features/plans/presentation/cubit/plans_cubit.dart';
import 'package:keenpockets/features/plans/presentation/cubit/plans_state.dart';
import 'package:keenpockets/features/plans/presentation/pages/plans_page.dart';

import '../../helpers/pump_app.dart';

void main() {
  blocTest<PlansCubit, PlansState>(
    'emits [loading, success] with plans',
    build: PlansCubit.new,
    act: (cubit) => cubit.load(),
    expect: () => [
      isA<PlansState>().having((s) => s.status, 'status', StateStatus.loading),
      isA<PlansState>()
          .having((s) => s.status, 'status', StateStatus.success)
          .having((s) => s.plans, 'plans', isNotEmpty),
    ],
  );

  group('PlansPage flag gating (backend-gap, built dark)', () {
    tearDown(() => getIt.reset());

    testWidgets('shows coming-soon when PLANS flag is OFF', (tester) async {
      getIt
        ..registerSingleton<FeatureFlagService>(FeatureFlagService())
        ..registerFactory<PlansCubit>(PlansCubit.new);

      await tester.pumpApp(const PlansPage());
      await tester.pumpAndSettle();

      expect(find.text('Coming soon'), findsOneWidget);
    });

    testWidgets('shows plans when the flag is ON', (tester) async {
      getIt
        ..registerSingleton<FeatureFlagService>(
          FeatureFlagService()..hydrate({Feature.plans: true}),
        )
        ..registerFactory<PlansCubit>(PlansCubit.new);

      await tester.pumpApp(const PlansPage());
      await tester.pumpAndSettle();

      expect(find.text('Monthly Groceries'), findsOneWidget);
    });
  });
}
