import 'package:core/core.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/pockets/domain/entities/pocket.dart';
import 'package:keenpockets/features/pockets/domain/repositories/pocket_repository.dart';

/// Dev-only stub returning placeholder pockets so the UI renders without a
/// backend or connectivity. Registered for the `dev` environment only;
/// `prod`/`staging` use `PocketRepositoryImpl`.
@LazySingleton(as: PocketRepository, env: ['dev'])
class FakePocketRepository implements PocketRepository {
  const FakePocketRepository();

  static final List<Pocket> _pockets = [
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
      name: 'Lagos Rent Savers',
      organiserId: 'u2',
      handPrice: Money.naira(25000),
      totalHands: 12,
      filledHands: 8,
      memberCount: 10,
      memberIds: const {'dev-user-1'},
    ),
    Pocket(
      id: 'p3',
      name: 'Education Fund',
      organiserId: 'dev-user-1',
      handPrice: Money.naira(10000),
      totalHands: 12,
      filledHands: 12,
      memberCount: 5,
    ),
  ];

  @override
  Future<Result<List<Pocket>>> getMyPockets() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return Right(_pockets);
  }

  @override
  Future<Result<Pocket>> getPocket(String id) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return Right(
      _pockets.firstWhere((p) => p.id == id, orElse: () => _pockets.first),
    );
  }
}
