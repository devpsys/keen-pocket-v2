import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/features/charity/presentation/cubit/charity_cubit.dart';
import 'package:keenpockets/features/charity/presentation/cubit/charity_state.dart';
import 'package:keenpockets/features/charity/presentation/pages/charity_page.dart';

import '../../helpers/pump_app.dart';

void main() {
  blocTest<CharityCubit, CharityState>(
    'emits [loading, success] with a drive',
    build: CharityCubit.new,
    act: (cubit) => cubit.load('p1'),
    expect: () => [
      isA<CharityState>().having(
        (s) => s.status,
        'status',
        StateStatus.loading,
      ),
      isA<CharityState>()
          .having((s) => s.status, 'status', StateStatus.success)
          .having((s) => s.drive?.progress, 'progress', greaterThan(0)),
    ],
  );

  testWidgets('CharityPage shows the drive and a donate button', (
    tester,
  ) async {
    getIt.registerFactory<CharityCubit>(CharityCubit.new);
    addTearDown(getIt.reset);

    await tester.pumpApp(const CharityPage(pocketId: 'p1'));
    await tester.pumpAndSettle();

    expect(find.text('Ramadan food drive'), findsOneWidget);
    expect(find.text('Donate now'), findsOneWidget);
  });
}
