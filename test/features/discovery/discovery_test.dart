import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/features/discovery/presentation/cubit/discovery_cubit.dart';
import 'package:keenpockets/features/discovery/presentation/cubit/discovery_state.dart';
import 'package:keenpockets/features/discovery/presentation/pages/discovery_page.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('DiscoveryCubit', () {
    blocTest<DiscoveryCubit, DiscoveryState>(
      'load shows all results',
      build: DiscoveryCubit.new,
      act: (cubit) => cubit.load(),
      expect: () => [
        isA<DiscoveryState>().having(
          (s) => s.status,
          'status',
          StateStatus.loading,
        ),
        isA<DiscoveryState>()
            .having((s) => s.status, 'status', StateStatus.success)
            .having((s) => s.results.length, 'count', greaterThan(1)),
      ],
    );

    blocTest<DiscoveryCubit, DiscoveryState>(
      'search filters by name (empty when no match)',
      build: DiscoveryCubit.new,
      act: (cubit) => cubit.search('zzz-nope'),
      expect: () => [
        isA<DiscoveryState>().having(
          (s) => s.status,
          'status',
          StateStatus.loading,
        ),
        isA<DiscoveryState>().having(
          (s) => s.status,
          'status',
          StateStatus.empty,
        ),
      ],
    );
  });

  testWidgets('DiscoveryPage renders results and a search field', (
    tester,
  ) async {
    getIt.registerFactory<DiscoveryCubit>(DiscoveryCubit.new);
    addTearDown(getIt.reset);

    await tester.pumpApp(const DiscoveryPage());
    await tester.pumpAndSettle();

    expect(find.text('School Fees Pocket'), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
  });
}
