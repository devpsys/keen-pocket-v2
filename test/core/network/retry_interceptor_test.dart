import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/network/interceptors/retry_interceptor.dart';
import 'package:mocktail/mocktail.dart';

class _MockDio extends Mock implements Dio {}

class _MockErrorHandler extends Mock implements ErrorInterceptorHandler {}

void main() {
  late _MockDio dio;
  late RetryInterceptor interceptor;

  DioException error({
    String method = 'GET',
    DioExceptionType type = DioExceptionType.connectionError,
    Map<String, dynamic>? extra,
  }) => DioException(
    requestOptions: RequestOptions(path: '/x', method: method, extra: extra),
    type: type,
  );

  setUpAll(() {
    registerFallbackValue(RequestOptions(path: '/x'));
    registerFallbackValue(
      Response<dynamic>(requestOptions: RequestOptions(path: '/x')),
    );
    registerFallbackValue(
      DioException(requestOptions: RequestOptions(path: '/x')),
    );
  });

  setUp(() {
    dio = _MockDio();
    // Zero delay keeps tests fast and deterministic.
    interceptor = RetryInterceptor(dio, baseDelay: Duration.zero);
  });

  test('retries a transient GET and resolves on success', () async {
    when(() => dio.fetch<dynamic>(any())).thenAnswer(
      (_) async => Response<dynamic>(
        requestOptions: RequestOptions(path: '/x'),
        statusCode: 200,
      ),
    );
    final handler = _MockErrorHandler();

    await interceptor.onError(error(), handler);

    verify(() => dio.fetch<dynamic>(any())).called(1);
    verify(() => handler.resolve(any())).called(1);
    verifyNever(() => handler.next(any()));
  });

  test('does not retry non-idempotent methods (POST)', () async {
    final handler = _MockErrorHandler();

    await interceptor.onError(error(method: 'POST'), handler);

    verifyNever(() => dio.fetch<dynamic>(any()));
    verify(() => handler.next(any())).called(1);
  });

  test('does not retry non-transient errors (badResponse)', () async {
    final handler = _MockErrorHandler();

    await interceptor.onError(
      error(type: DioExceptionType.badResponse),
      handler,
    );

    verifyNever(() => dio.fetch<dynamic>(any()));
    verify(() => handler.next(any())).called(1);
  });

  test('stops once max retries is reached', () async {
    final handler = _MockErrorHandler();

    await interceptor.onError(
      error(extra: {'retry_count': 2}), // already at maxRetries (2)
      handler,
    );

    verifyNever(() => dio.fetch<dynamic>(any()));
    verify(() => handler.next(any())).called(1);
  });

  test('forwards the error when the retried request also fails', () async {
    when(() => dio.fetch<dynamic>(any())).thenThrow(
      DioException(
        requestOptions: RequestOptions(path: '/x'),
        type: DioExceptionType.connectionError,
      ),
    );
    final handler = _MockErrorHandler();

    await interceptor.onError(error(), handler);

    verify(() => dio.fetch<dynamic>(any())).called(1);
    verify(() => handler.next(any())).called(1);
    verifyNever(() => handler.resolve(any()));
  });
}
