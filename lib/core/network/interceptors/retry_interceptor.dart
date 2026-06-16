import 'dart:async';

import 'package:dio/dio.dart';

/// Retries transient failures (timeouts / connection errors) for idempotent
/// requests, with exponential backoff. Non-idempotent methods (POST/PATCH) are
/// not retried automatically to avoid duplicate side effects.
class RetryInterceptor extends Interceptor {
  RetryInterceptor(
    this._dio, {
    this.maxRetries = 2,
    this.baseDelay = const Duration(milliseconds: 300),
  });

  final Dio _dio;
  final int maxRetries;
  final Duration baseDelay;

  static const _retryCountKey = 'retry_count';
  static const _idempotentMethods = {'GET', 'HEAD', 'OPTIONS', 'DELETE', 'PUT'};

  bool _isRetriable(DioException err) {
    const retriableTypes = {
      DioExceptionType.connectionTimeout,
      DioExceptionType.sendTimeout,
      DioExceptionType.receiveTimeout,
      DioExceptionType.connectionError,
    };
    final method = err.requestOptions.method.toUpperCase();
    return retriableTypes.contains(err.type) &&
        _idempotentMethods.contains(method);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final options = err.requestOptions;
    final attempt = (options.extra[_retryCountKey] as int?) ?? 0;

    if (!_isRetriable(err) || attempt >= maxRetries) {
      handler.next(err);
      return;
    }

    final nextAttempt = attempt + 1;
    await Future<void>.delayed(baseDelay * (1 << attempt)); // 1x, 2x, 4x…
    options.extra[_retryCountKey] = nextAttempt;

    try {
      final response = await _dio.fetch<dynamic>(options);
      handler.resolve(response);
    } on DioException catch (e) {
      handler.next(e);
    }
  }
}
