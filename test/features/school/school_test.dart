import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/feature_flags/feature.dart';
import 'package:keenpockets/core/feature_flags/feature_flag_service.dart';
import 'package:keenpockets/features/school/presentation/cubit/school_cubit.dart';
import 'package:keenpockets/features/school/presentation/cubit/school_state.dart';
import 'package:keenpockets/features/school/presentation/pages/school_page.dart';

import '../../helpers/pump_app.dart';

void main() {
  blocTest<SchoolCubit, SchoolState>(
    'emits [loading, success] with a school summary',
    build: SchoolCubit.new,
    act: (cubit) => cubit.load(),
    expect: () => [
      isA<SchoolState>().having((s) => s.status, 'status', StateStatus.loading),
      isA<SchoolState>()
          .having((s) => s.status, 'status', StateStatus.success)
          .having((s) => s.school?.studentCount, 'students', greaterThan(0)),
    ],
  );

  group('SchoolPage flag gating (backend-gap, built dark)', () {
    tearDown(() => getIt.reset());

    testWidgets('shows coming-soon when SCHOOL flag is OFF', (tester) async {
      getIt
        ..registerSingleton<FeatureFlagService>(FeatureFlagService())
        ..registerFactory<SchoolCubit>(SchoolCubit.new);

      await tester.pumpApp(const SchoolPage());
      await tester.pumpAndSettle();

      expect(find.text('Coming soon'), findsOneWidget);
    });

    testWidgets('shows the school when the flag is ON', (tester) async {
      getIt
        ..registerSingleton<FeatureFlagService>(
          FeatureFlagService()..hydrate({Feature.school: true}),
        )
        ..registerFactory<SchoolCubit>(SchoolCubit.new);

      await tester.pumpApp(const SchoolPage());
      await tester.pumpAndSettle();

      expect(find.text('Bright Future Academy'), findsOneWidget);
    });
  });
}
