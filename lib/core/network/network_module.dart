import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/app_config.dart';
import '../storage/token_storage.dart';
import 'connectivity_checker.dart';
import 'interceptors/auth_interceptor.dart';
import 'interceptors/connectivity_interceptor.dart';
import 'interceptors/logging_interceptor.dart';
import 'interceptors/retry_interceptor.dart';

/// Registers third-party singletons and the ONE centralized [Dio] instance.
///
/// This is the only file permitted to construct `Dio` (enforced by the
/// `no_new_dio_instance` lint). Every data source receives this instance by
/// injection.
@module
abstract class NetworkModule {
  @lazySingleton
  Connectivity get connectivity => Connectivity();

  @lazySingleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage();

  @preResolve
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();

  @lazySingleton
  Dio dio(
    AppConfig config,
    TokenStorage tokenStorage,
    ConnectivityChecker connectivity,
  ) {
    final dio = Dio(
      BaseOptions(
        baseUrl: config.baseUrl,
        connectTimeout: config.connectTimeout,
        receiveTimeout: config.receiveTimeout,
        sendTimeout: config.sendTimeout,
        contentType: 'application/json',
        responseType: ResponseType.json,
      ),
    );

    dio.interceptors.addAll([
      ConnectivityInterceptor(connectivity), // fail fast when offline
      AuthInterceptor(tokenStorage), // refresher wired by the auth feature
      RetryInterceptor(dio, maxRetries: config.maxRetries),
      if (config.enableLogging) const LoggingInterceptor(),
    ]);

    return dio;
  }
}
