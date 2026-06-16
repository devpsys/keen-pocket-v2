import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/features/pockets/domain/entities/pocket.dart';
import 'package:keenpockets/features/pockets/domain/usecases/get_my_pockets.dart';
import 'package:keenpockets/features/pockets/domain/value_objects/money.dart';
import 'package:keenpockets/features/pockets/presentation/cubit/pockets_cubit.dart';
import 'package:keenpockets/features/pockets/presentation/cubit/pockets_state.dart';
import 'package:mocktail/mocktail.dart';

class _MockGetMyPockets extends Mock implements GetMyPockets {}

void main() {
  late _MockGetMyPockets getMyPockets;

  const pocket = Pocket(
    id: 'p1',
    name: 'Rent',
    organiserId: 'u1',
    handPrice: Money(500000),
    totalHands: 10,
    filledHands: 4,
    memberCount: 4,
  );

  setUpAll(() => registerFallbackValue(const NoParams()));
  setUp(() => getMyPockets = _MockGetMyPockets());

  blocTest<PocketsCubit, PocketsState>(
    'emits [loading, success] with pockets',
    setUp: () => when(
      () => getMyPockets(any()),
    ).thenAnswer((_) async => const Right([pocket])),
    build: () => PocketsCubit(getMyPockets),
    act: (cubit) => cubit.load(),
    expect: () => [
      isA<PocketsState>().having(
        (s) => s.status,
        'status',
        StateStatus.loading,
      ),
      isA<PocketsState>()
          .having((s) => s.status, 'status', StateStatus.success)
          .having((s) => s.pockets, 'pockets', [pocket]),
    ],
  );

  blocTest<PocketsCubit, PocketsState>(
    'emits [loading, empty] when there are no pockets',
    setUp: () => when(
      () => getMyPockets(any()),
    ).thenAnswer((_) async => const Right([])),
    build: () => PocketsCubit(getMyPockets),
    act: (cubit) => cubit.load(),
    expect: () => [
      isA<PocketsState>().having(
        (s) => s.status,
        'status',
        StateStatus.loading,
      ),
      isA<PocketsState>().having((s) => s.status, 'status', StateStatus.empty),
    ],
  );

  blocTest<PocketsCubit, PocketsState>(
    'emits [loading, failure] on error',
    setUp: () => when(
      () => getMyPockets(any()),
    ).thenAnswer((_) async => const Left(ServerFailure())),
    build: () => PocketsCubit(getMyPockets),
    act: (cubit) => cubit.load(),
    expect: () => [
      isA<PocketsState>().having(
        (s) => s.status,
        'status',
        StateStatus.loading,
      ),
      isA<PocketsState>()
          .having((s) => s.status, 'status', StateStatus.failure)
          .having((s) => s.failure, 'failure', isA<ServerFailure>()),
    ],
  );
}
