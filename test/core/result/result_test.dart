import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/error/failures.dart';
import 'package:keenpockets/core/result/result.dart';

void main() {
  group('Result', () {
    test('success exposes value and folds onSuccess', () {
      const result = Result<int>.success(42);

      expect(result.isSuccess, isTrue);
      expect(result.isFailure, isFalse);
      expect(result.valueOrNull, 42);
      expect(result.failureOrNull, isNull);
      expect(
        result.fold(onFailure: (_) => 'fail', onSuccess: (v) => 'ok $v'),
        'ok 42',
      );
    });

    test('failure exposes failure and folds onFailure', () {
      const failure = NetworkFailure();
      const result = Result<int>.failure(failure);

      expect(result.isFailure, isTrue);
      expect(result.valueOrNull, isNull);
      expect(result.failureOrNull, failure);
      expect(
        result.fold(
          onFailure: (f) => f.runtimeType.toString(),
          onSuccess: (_) => 'ok',
        ),
        'NetworkFailure',
      );
    });

    test('map transforms success and preserves failure', () {
      expect(const Result<int>.success(2).map((v) => v * 10).valueOrNull, 20);
      expect(
        const Result<int>.failure(ServerFailure()).map((v) => v * 10).isFailure,
        isTrue,
      );
    });

    test('flatMap chains success and short-circuits on failure', () {
      final chained = const Result<int>.success(
        2,
      ).flatMap((v) => Result<String>.success('v=$v'));
      expect(chained.valueOrNull, 'v=2');

      final shorted = const Result<int>.failure(
        CacheFailure(),
      ).flatMap((v) => Result<String>.success('v=$v'));
      expect(shorted.isFailure, isTrue);
    });

    test('equality is value-based', () {
      expect(const Result<int>.success(1), const Result<int>.success(1));
      expect(
        const Result<int>.failure(NetworkFailure()),
        const Result<int>.failure(NetworkFailure()),
      );
    });
  });
}
