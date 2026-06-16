import 'dart:developer' as developer;

import 'package:dio/dio.dart';

/// Lightweight request/response/error logger using `dart:developer` (so it is
/// stripped from release logs and avoids `print`). Only added to Dio when
/// logging is enabled in [AppConfig].
class LoggingInterceptor extends Interceptor {
  const LoggingInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    developer.log('→ ${options.method} ${options.uri}', name: 'network');
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    developer.log(
      '← ${response.statusCode} ${response.requestOptions.uri}',
      name: 'network',
    );
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    developer.log(
      '✗ ${err.response?.statusCode ?? '-'} ${err.requestOptions.uri} :: ${err.type.name}',
      name: 'network',
      error: err,
    );
    handler.next(err);
  }
}
