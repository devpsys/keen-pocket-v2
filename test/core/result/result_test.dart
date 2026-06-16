import 'package:core/error/failures.dart';
import 'package:core/result/result.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Result (fpdart Either<Failure, T> alias)', () {
    test('Right exposes value and folds onto the right branch', () {
      const Result<int> result = Right(42);

      expect(result.isRight(), isTrue);
      expect(result.isLeft(), isFalse);
      expect(result.toNullable(), 42);
      expect(result.getLeft().toNullable(), isNull);
      expect(result.fold((_) => 'fail', (v) => 'ok $v'), 'ok 42');
    });

    test('Left exposes failure and folds onto the left branch', () {
      const failure = NetworkFailure();
      const Result<int> result = Left(failure);

      expect(result.isLeft(), isTrue);
      expect(result.toNullable(), isNull);
      expect(result.getLeft().toNullable(), failure);
      expect(
        result.fold((f) => f.runtimeType.toString(), (_) => 'ok'),
        'NetworkFailure',
      );
    });

    test('map transforms a Right and preserves a Left', () {
      expect(const Right<Failure, int>(2).map((v) => v * 10).toNullable(), 20);
      expect(
        const Left<Failure, int>(ServerFailure()).map((v) => v * 10).isLeft(),
        isTrue,
      );
    });

    test('flatMap chains a Right and short-circuits a Left', () {
      final chained = const Right<Failure, int>(
        2,
      ).flatMap((v) => Right<Failure, String>('v=$v'));
      expect(chained.toNullable(), 'v=2');

      final shorted = const Left<Failure, int>(
        CacheFailure(),
      ).flatMap((v) => Right<Failure, String>('v=$v'));
      expect(shorted.isLeft(), isTrue);
    });

    test('equality is value-based', () {
      expect(const Right<Failure, int>(1), const Right<Failure, int>(1));
      expect(
        const Left<Failure, int>(NetworkFailure()),
        const Left<Failure, int>(NetworkFailure()),
      );
    });
  });
}
