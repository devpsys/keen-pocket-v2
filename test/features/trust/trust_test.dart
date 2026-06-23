import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/session/session_manager.dart';
import 'package:keenpockets/core/session/session_user.dart';
import 'package:keenpockets/features/trust/presentation/cubit/trust_cubit.dart';
import 'package:keenpockets/features/trust/presentation/cubit/trust_state.dart';
import 'package:keenpockets/features/trust/presentation/pages/trust_page.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/pump_app.dart';

class _MockSessionManager extends Mock implements SessionManager {}

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

    expect(find.text('82'), findsOneWidget);
    expect(find.text('Sarah J.'), findsOneWidget);
  });

  testWidgets('TrustPage opens the vouch requests inbox', (tester) async {
    getIt.registerFactory<TrustCubit>(TrustCubit.new);
    addTearDown(getIt.reset);

    await tester.pumpApp(const TrustPage());
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.how_to_reg_rounded));
    await tester.pumpAndSettle();

    expect(find.text('Vouch Requests'), findsOneWidget);
  });

  testWidgets('TrustPage renders the reputation hub on tablet', (tester) async {
    tester.view.physicalSize = const Size(1500, 2600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final session = _MockSessionManager();
    when(() => session.currentUser).thenReturn(
      const SessionUser(id: 'u1', name: 'Yusuf G.', kycVerified: true),
    );
    getIt
      ..registerFactory<TrustCubit>(TrustCubit.new)
      ..registerSingleton<SessionManager>(session);
    addTearDown(getIt.reset);

    await tester.pumpApp(const TrustPage());
    await tester.pumpAndSettle();

    expect(find.text('Reputation Hub'), findsOneWidget);
    expect(find.text('Excellent Standing'), findsOneWidget);
    expect(find.text('942'), findsOneWidget);
    expect(find.text('Reliability Stats'), findsOneWidget);
    expect(find.text('Jessica D.'), findsOneWidget);
  });
}
