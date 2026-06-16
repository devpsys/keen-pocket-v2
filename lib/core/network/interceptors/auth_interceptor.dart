// Optional named params (refresher/retryClient) map to private fields, so an
// initializing formal isn't possible here.
// ignore_for_file: prefer_initializing_formals
import 'package:dio/dio.dart';

import '../../storage/token_refresher.dart';
import '../../storage/token_storage.dart';

/// Attaches the bearer token to every request and handles 401 responses.
///
/// On 401: if a [TokenRefresher] is wired and this request hasn't already been
/// retried, it refreshes the token and retries the original request once via
/// [_retryClient]; if refresh fails (or no refresher is wired), it clears the
/// session so the router can route back to login.
class AuthInterceptor extends QueuedInterceptor {
  AuthInterceptor(
    this._tokenStorage, {
    TokenRefresher? refresher,
    Dio? retryClient,
  }) : _refresher = refresher,
       _retryClient = retryClient;

  final TokenStorage _tokenStorage;
  final TokenRefresher? _refresher;
  final Dio? _retryClient;

  static const _retriedFlag = 'kp.auth_retried';

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _tokenStorage.readAccessToken();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final options = err.requestOptions;
    final alreadyRetried = options.extra[_retriedFlag] == true;

    if (err.response?.statusCode == 401 &&
        _refresher != null &&
        _retryClient != null &&
        !alreadyRetried) {
      final refreshed = await _refresher.refresh();
      if (refreshed) {
        final token = await _tokenStorage.readAccessToken();
        options.extra[_retriedFlag] = true;
        if (token != null) options.headers['Authorization'] = 'Bearer $token';
        try {
          final response = await _retryClient.fetch<dynamic>(options);
          handler.resolve(response);
          return;
        } on DioException catch (e) {
          handler.next(e);
          return;
        }
      }
    }

    if (err.response?.statusCode == 401) {
      // No refresher, retry exhausted, or refresh failed: drop the session.
      await _tokenStorage.clear();
    }
    handler.next(err);
  }
}
