import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/session/session_manager.dart';
import 'package:keenpockets/core/session/session_user.dart';
import 'package:keenpockets/features/charity/domain/entities/charity_drive.dart';
import 'package:keenpockets/features/charity/domain/usecases/get_charity_drive.dart';
import 'package:keenpockets/features/charity/presentation/cubit/charity_cubit.dart';
import 'package:keenpockets/features/charity/presentation/cubit/charity_state.dart';
import 'package:keenpockets/features/charity/presentation/pages/charity_page.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/pump_app.dart';

class _MockSessionManager extends Mock implements SessionManager {}

class _MockGetCharityDrive extends Mock implements GetCharityDrive {}

const _drive = CharityDrive(
  title: 'Support the Relief Fund',
  goal: Money(20000000),
  raised: Money(12000000),
  donorCount: 24,
);

void main() {
  late _MockGetCharityDrive getDrive;

  setUpAll(() => registerFallbackValue('p1'));

  setUp(() {
    getDrive = _MockGetCharityDrive();
    when(() => getDrive(any())).thenAnswer((_) async => const Right(_drive));
  });

  CharityCubit build() => CharityCubit(getDrive);

  blocTest<CharityCubit, CharityState>(
    'emits [loading, success] with a drive',
    build: build,
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

  blocTest<CharityCubit, CharityState>(
    'emits failure when the use case fails',
    setUp: () => when(
      () => getDrive(any()),
    ).thenAnswer((_) async => const Left(NetworkFailure())),
    build: build,
    act: (cubit) => cubit.load('p1'),
    expect: () => [
      isA<CharityState>().having(
        (s) => s.status,
        'status',
        StateStatus.loading,
      ),
      isA<CharityState>().having(
        (s) => s.status,
        'status',
        StateStatus.failure,
      ),
    ],
  );

  testWidgets('CharityPage shows the drive and a donate button', (
    tester,
  ) async {
    getIt.registerFactory<CharityCubit>(build);
    addTearDown(getIt.reset);

    await tester.pumpApp(const CharityPage(pocketId: 'p1'));
    await tester.pumpAndSettle();

    expect(find.text('Support the Relief Fund'), findsOneWidget);
    expect(find.text('Financial Goal'), findsOneWidget);
    expect(find.text('Donate Now'), findsOneWidget);
  });

  testWidgets('CharityPage tablet shows the contribution panel and heroes', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(1500, 2400);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final session = _MockSessionManager();
    when(() => session.currentUser).thenReturn(
      const SessionUser(id: 'u1', name: 'Yusuf G.', kycVerified: true),
    );
    getIt
      ..registerFactory<CharityCubit>(build)
      ..registerSingleton<SessionManager>(session);
    addTearDown(getIt.reset);

    await tester.pumpApp(const CharityPage(pocketId: 'p1'));
    await tester.pumpAndSettle();

    expect(find.text('Active Relief'), findsOneWidget);
    expect(find.text('Make a Contribution'), findsOneWidget);
    expect(find.text('Recent Heroes'), findsOneWidget);
    expect(find.text('Sarah Johnson'), findsOneWidget);
  });
}
