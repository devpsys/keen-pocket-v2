import 'package:dio/dio.dart';

import '../connectivity_checker.dart';

/// Fails fast when the device is offline so requests don't hang until timeout.
/// Placed first in the chain. The resulting [DioException] is mapped to a
/// `NetworkException` by `DioErrorMapper`.
class ConnectivityInterceptor extends Interceptor {
  const ConnectivityInterceptor(this._connectivity);

  final ConnectivityChecker _connectivity;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (!await _connectivity.isConnected) {
      handler.reject(
        DioException(
          requestOptions: options,
          type: DioExceptionType.connectionError,
          error: 'No internet connection',
        ),
      );
      return;
    }
    handler.next(options);
  }
}
