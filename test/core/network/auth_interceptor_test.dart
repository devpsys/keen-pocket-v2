import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/network/interceptors/auth_interceptor.dart';
import 'package:keenpockets/core/storage/token_refresher.dart';
import 'package:keenpockets/core/storage/token_storage.dart';
import 'package:mocktail/mocktail.dart';

class _MockTokenStorage extends Mock implements TokenStorage {}

class _MockRefresher extends Mock implements TokenRefresher {}

class _MockDio extends Mock implements Dio {}

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

  group('401 refresh-and-retry', () {
    late _MockRefresher refresher;
    late _MockDio retryClient;
    late AuthInterceptor refreshing;

    setUpAll(() {
      registerFallbackValue(RequestOptions(path: '/'));
      registerFallbackValue(
        DioException(requestOptions: RequestOptions(path: '/')),
      );
      registerFallbackValue(
        Response<dynamic>(requestOptions: RequestOptions(path: '/')),
      );
    });

    setUp(() {
      refresher = _MockRefresher();
      retryClient = _MockDio();
      refreshing = AuthInterceptor(
        storage,
        refresher: refresher,
        retryClient: retryClient,
      );
    });

    test('refreshes, retries once and resolves on success', () async {
      when(() => refresher.refresh()).thenAnswer((_) async => true);
      when(() => storage.readAccessToken()).thenAnswer((_) async => 'new');
      final options = RequestOptions(path: '/x');
      when(() => retryClient.fetch<dynamic>(any())).thenAnswer(
        (_) async =>
            Response<dynamic>(requestOptions: options, statusCode: 200),
      );
      final handler = _MockErrorHandler();
      final error = DioException(
        requestOptions: options,
        response: Response<dynamic>(requestOptions: options, statusCode: 401),
      );

      await refreshing.onError(error, handler);

      verify(() => refresher.refresh()).called(1);
      verify(() => retryClient.fetch<dynamic>(any())).called(1);
      verify(() => handler.resolve(any())).called(1);
      verifyNever(() => storage.clear());
    });

    test('clears the session when refresh fails', () async {
      when(() => refresher.refresh()).thenAnswer((_) async => false);
      when(() => storage.clear()).thenAnswer((_) async {});
      final options = RequestOptions(path: '/x');
      final handler = _MockErrorHandler();
      final error = DioException(
        requestOptions: options,
        response: Response<dynamic>(requestOptions: options, statusCode: 401),
      );

      await refreshing.onError(error, handler);

      verify(() => storage.clear()).called(1);
      verify(() => handler.next(any())).called(1);
      verifyNever(() => retryClient.fetch<dynamic>(any()));
    });
  });
}
