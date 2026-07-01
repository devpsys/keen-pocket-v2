import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/features/discovery/domain/entities/discover_item.dart';
import 'package:keenpockets/features/discovery/domain/usecases/discover_groups.dart';
import 'package:keenpockets/features/discovery/presentation/cubit/discovery_cubit.dart';
import 'package:keenpockets/features/discovery/presentation/cubit/discovery_state.dart';
import 'package:keenpockets/features/discovery/presentation/pages/discovery_page.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/pump_app.dart';

class _MockDiscoverGroups extends Mock implements DiscoverGroups {}

const _all = [
  DiscoverItem(
    id: 'p10',
    name: 'Ketu Foodies',
    type: DiscoverItemType.pocket,
    emoji: '🛒',
    adminName: 'Adeola',
    badge: DiscoverBadge.kycVerified,
    contribution: Money(500000),
    contributionUnit: 'mo',
    metricValue: '18/20',
    metricIsStartDate: false,
    rating: 4.8,
    memberCount: 18,
  ),
  DiscoverItem(
    id: 'a10',
    name: 'Esusu Masters',
    type: DiscoverItemType.adashi,
    emoji: '🔄',
    adminName: 'Bankole',
    badge: DiscoverBadge.adashi,
    contribution: Money(1000000),
    contributionUnit: 'cycle',
    metricValue: 'June 1st',
    metricIsStartDate: true,
    rating: 4.2,
    memberCount: 8,
  ),
];

void main() {
  late _MockDiscoverGroups discover;

  setUpAll(() => registerFallbackValue(''));

  setUp(() {
    discover = _MockDiscoverGroups();
    // Filter the fixture by the query argument, like the real repository.
    when(() => discover(any())).thenAnswer((inv) async {
      final q = (inv.positionalArguments.first as String).trim().toLowerCase();
      final results = q.isEmpty
          ? _all
          : _all.where((i) => i.name.toLowerCase().contains(q)).toList();
      return Right(results);
    });
  });

  DiscoveryCubit build() => DiscoveryCubit(discover);

  group('DiscoveryCubit', () {
    blocTest<DiscoveryCubit, DiscoveryState>(
      'load shows all results',
      build: build,
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
      build: build,
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
    getIt.registerFactory<DiscoveryCubit>(build);
    addTearDown(getIt.reset);

    await tester.pumpApp(const DiscoveryPage());
    await tester.pumpAndSettle();

    expect(find.text('Popular Pockets'), findsOneWidget);
    expect(find.text('Ketu Foodies'), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
  });
}
