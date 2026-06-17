import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/session/session_manager.dart';
import 'package:keenpockets/core/session/session_user.dart';
import 'package:keenpockets/features/pockets/domain/entities/pocket.dart';
import 'package:keenpockets/features/pockets/presentation/cubit/pockets_cubit.dart';
import 'package:keenpockets/features/pockets/presentation/cubit/pockets_state.dart';
import 'package:keenpockets/features/pockets/presentation/pages/pockets_page.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/pump_app.dart';

class _MockPocketsCubit extends MockCubit<PocketsState>
    implements PocketsCubit {}

class _MockSessionManager extends Mock implements SessionManager {}

final _pockets = [
  Pocket(
    id: 'p1',
    name: 'December Turkey Fund',
    organiserId: 'dev-user-1',
    handPrice: Money.naira(5000),
    totalHands: 12,
    filledHands: 8,
    memberCount: 8,
    memberIds: const {'dev-user-1'},
  ),
  Pocket(
    id: 'p2',
    name: 'Lekki Rent Savers',
    organiserId: 'u2',
    handPrice: Money.naira(120000),
    totalHands: 12,
    filledHands: 4,
    memberCount: 12,
    memberIds: const {'dev-user-1'},
  ),
];

void main() {
  testWidgets('PocketsPage groups pockets into sections on tablet', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(1400, 1000);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final cubit = _MockPocketsCubit();
    when(() => cubit.load()).thenAnswer((_) async {});
    whenListen(
      cubit,
      const Stream<PocketsState>.empty(),
      initialState: PocketsState(
        status: StateStatus.success,
        pockets: _pockets,
      ),
    );
    final session = _MockSessionManager();
    when(
      () => session.currentUser,
    ).thenReturn(const SessionUser(id: 'dev-user-1', name: 'Amaka'));

    getIt
      ..registerFactory<PocketsCubit>(() => cubit)
      ..registerSingleton<SessionManager>(session);
    addTearDown(getIt.reset);

    await tester.pumpApp(const PocketsPage());
    await tester.pumpAndSettle();

    expect(find.text('Pockets I Organise'), findsOneWidget);
    expect(find.text("Pockets I'm In"), findsOneWidget);
    // p1 (organised by the user) and p2 (member) both render.
    expect(find.text('December Turkey Fund'), findsOneWidget);
    expect(find.text('Lekki Rent Savers'), findsOneWidget);
    expect(find.text('Start New Group'), findsOneWidget);
  });
}
