import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/network/connectivity_checker.dart';
import 'package:keenpockets/core/network/interceptors/connectivity_interceptor.dart';
import 'package:mocktail/mocktail.dart';

class _MockChecker extends Mock implements ConnectivityChecker {}

class _MockHandler extends Mock implements RequestInterceptorHandler {}

void main() {
  late _MockChecker checker;
  late ConnectivityInterceptor interceptor;

  setUpAll(() {
    registerFallbackValue(RequestOptions(path: '/'));
    registerFallbackValue(
      DioException(requestOptions: RequestOptions(path: '/')),
    );
  });

  setUp(() {
    checker = _MockChecker();
    interceptor = ConnectivityInterceptor(checker);
  });

  test('rejects the request when offline', () async {
    when(() => checker.isConnected).thenAnswer((_) async => false);
    final handler = _MockHandler();

    await interceptor.onRequest(RequestOptions(path: '/x'), handler);

    verify(() => handler.reject(any())).called(1);
    verifyNever(() => handler.next(any()));
  });

  test('forwards the request when online', () async {
    when(() => checker.isConnected).thenAnswer((_) async => true);
    final handler = _MockHandler();
    final options = RequestOptions(path: '/x');

    await interceptor.onRequest(options, handler);

    verify(() => handler.next(options)).called(1);
    verifyNever(() => handler.reject(any()));
  });
}
