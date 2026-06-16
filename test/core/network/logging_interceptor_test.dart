import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/network/interceptors/logging_interceptor.dart';
import 'package:mocktail/mocktail.dart';

class _MockRequestHandler extends Mock implements RequestInterceptorHandler {}

class _MockResponseHandler extends Mock implements ResponseInterceptorHandler {}

class _MockErrorHandler extends Mock implements ErrorInterceptorHandler {}

void main() {
  const interceptor = LoggingInterceptor();
  final options = RequestOptions(path: '/x');

  test('onRequest forwards the request', () {
    final handler = _MockRequestHandler();
    interceptor.onRequest(options, handler);
    verify(() => handler.next(options)).called(1);
  });

  test('onResponse forwards the response', () {
    final response = Response<dynamic>(
      requestOptions: options,
      statusCode: 200,
    );
    final handler = _MockResponseHandler();
    interceptor.onResponse(response, handler);
    verify(() => handler.next(response)).called(1);
  });

  test('onError forwards the error', () {
    final err = DioException(
      requestOptions: options,
      type: DioExceptionType.badResponse,
      response: Response<dynamic>(requestOptions: options, statusCode: 500),
    );
    final handler = _MockErrorHandler();
    interceptor.onError(err, handler);
    verify(() => handler.next(err)).called(1);
  });
}
