import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/features/trust/presentation/cubit/trust_cubit.dart';
import 'package:keenpockets/features/trust/presentation/cubit/trust_state.dart';
import 'package:keenpockets/features/trust/presentation/pages/trust_page.dart';

import '../../helpers/pump_app.dart';

void main() {
  blocTest<TrustCubit, TrustState>(
    'emits [loading, success] with reputation + ratings',
    build: TrustCubit.new,
    act: (cubit) => cubit.load(),
    expect: () => [
      isA<TrustState>().having((s) => s.status, 'status', StateStatus.loading),
      isA<TrustState>()
          .having((s) => s.status, 'status', StateStatus.success)
          .having((s) => s.trust?.ratings, 'ratings', isNotEmpty),
    ],
  );

  testWidgets('TrustPage shows the score and ratings', (tester) async {
    getIt.registerFactory<TrustCubit>(TrustCubit.new);
    addTearDown(getIt.reset);

    await tester.pumpApp(const TrustPage());
    await tester.pumpAndSettle();

    expect(find.text('86'), findsOneWidget);
    expect(find.text('Funke'), findsOneWidget);
  });
}
