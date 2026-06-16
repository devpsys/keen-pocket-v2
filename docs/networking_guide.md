# Networking Guide

All HTTP goes through **one** centrally configured `Dio`, created only in
`core/network/network_module.dart`. `Dio()` anywhere else is rejected by
`no_new_dio_instance`; importing `dio`/`http` outside data/network layers is
rejected by `no_direct_http_in_ui`.

## Components (`lib/core/network/`)
- `network_module.dart` — the single `Dio` (base URL, timeouts, interceptors),
  registered as a lazy singleton. Reads `AppConfig`.
- `interceptors/auth_interceptor.dart` — attaches the bearer token; clears it on 401.
- `interceptors/logging_interceptor.dart` — debug-only request/response logging.
- `interceptors/retry_interceptor.dart` — exponential backoff for idempotent
  requests on transient errors.
- `dio_error_mapper.dart` — `DioException → AppException`.
- `connectivity_checker.dart` — `is the device online?` abstraction.

## Make a request (inside a data source)
```dart
@LazySingleton(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  const ProfileRemoteDataSourceImpl(this._dio);   // injected — never `Dio()`
  final Dio _dio;

  @override
  Future<ProfileModel> fetch() async {
    try {
      final r = await _dio.get<Map<String, dynamic>>('/me');
      return ProfileModel.fromJson(r.data!);
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);                 // normalize to AppException
    }
  }
}
```

## Error mapping chain
```
DioException → DioErrorMapper → AppException (data) → Failure (repository) → Result
```
| HTTP / cause | AppException | Failure |
|--------------|--------------|---------|
| timeout / connection | `NetworkException` | `NetworkFailure` |
| 401 / 403 | `UnauthorizedException` | `UnauthorizedFailure` |
| 422 | `ValidationException` | `ValidationFailure` |
| other 4xx/5xx | `ServerException` | `ServerFailure` |

## Environments
`AppConfig` (`core/config/app_config.dart`) holds `baseUrl`, timeouts, retries
per flavor. `main.dart` calls `bootstrap(AppConfig.dev())`; add
`main_staging.dart` / `main_prod.dart` for other flavors.

## ✅ / ❌
```dart
// ✅ inject Dio
ProfileRemoteDataSourceImpl(this._dio);

// ❌ rejected
final dio = Dio();                       // no_new_dio_instance
import 'package:dio/dio.dart';           // in a widget → no_direct_http_in_ui
```
