import 'package:dio/dio.dart';

import '../../storage/token_storage.dart';

/// Attaches the bearer token to every outgoing request and clears it on 401.
///
/// Token *refresh* is intentionally left as a documented extension point — wire
/// a refresh call here and retry the original request when the backend exposes
/// a refresh endpoint.
class AuthInterceptor extends QueuedInterceptor {
  AuthInterceptor(this._tokenStorage);

  final TokenStorage _tokenStorage;

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
    if (err.response?.statusCode == 401) {
      // Session is no longer valid — drop the stored credentials so the app can
      // route back to login. (Refresh-token flow would go here.)
      await _tokenStorage.clear();
    }
    handler.next(err);
  }
}
