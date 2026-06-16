import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/network/interceptors/auth_interceptor.dart';
import 'package:keenpockets/core/storage/token_storage.dart';
import 'package:mocktail/mocktail.dart';

class _MockTokenStorage extends Mock implements TokenStorage {}

class _MockRequestHandler extends Mock implements RequestInterceptorHandler {}

class _MockErrorHandler extends Mock implements ErrorInterceptorHandler {}

void main() {
  late _MockTokenStorage storage;
  late AuthInterceptor interceptor;

  setUp(() {
    storage = _MockTokenStorage();
    interceptor = AuthInterceptor(storage);
  });

  test('attaches bearer token when present', () async {
    when(() => storage.readAccessToken()).thenAnswer((_) async => 'tok');
    final options = RequestOptions(path: '/x');
    final handler = _MockRequestHandler();

    await interceptor.onRequest(options, handler);

    expect(options.headers['Authorization'], 'Bearer tok');
    verify(() => handler.next(options)).called(1);
  });

  test('does not attach header when no token', () async {
    when(() => storage.readAccessToken()).thenAnswer((_) async => null);
    final options = RequestOptions(path: '/x');

    await interceptor.onRequest(options, _MockRequestHandler());

    expect(options.headers.containsKey('Authorization'), isFalse);
  });

  test('clears tokens on 401', () async {
    when(() => storage.clear()).thenAnswer((_) async {});
    final options = RequestOptions(path: '/x');
    final error = DioException(
      requestOptions: options,
      response: Response<dynamic>(requestOptions: options, statusCode: 401),
    );

    await interceptor.onError(error, _MockErrorHandler());

    verify(() => storage.clear()).called(1);
  });

  test('does not clear tokens on non-401', () async {
    final options = RequestOptions(path: '/x');
    final error = DioException(
      requestOptions: options,
      response: Response<dynamic>(requestOptions: options, statusCode: 500),
    );

    await interceptor.onError(error, _MockErrorHandler());

    verifyNever(() => storage.clear());
  });
}
