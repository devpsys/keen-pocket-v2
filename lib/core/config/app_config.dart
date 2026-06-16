import 'package:flutter/foundation.dart';

/// Build environments (flavors).
enum AppEnvironment { dev, staging, prod }

/// Immutable runtime configuration, provided once via DI.
///
/// Replace [baseUrl] per flavor at startup (see `app/bootstrap.dart`). Nothing
/// in the codebase should read environment values except through this object.
@immutable
class AppConfig {
  const AppConfig({
    required this.environment,
    required this.baseUrl,
    this.connectTimeout = const Duration(seconds: 20),
    this.receiveTimeout = const Duration(seconds: 20),
    this.sendTimeout = const Duration(seconds: 20),
    this.maxRetries = 2,
  });

  /// Sensible default used by tests and the default bootstrap.
  factory AppConfig.dev() => const AppConfig(
    environment: AppEnvironment.dev,
    baseUrl: 'https://api.dev.keenpockets.example.com',
  );

  factory AppConfig.staging() => const AppConfig(
    environment: AppEnvironment.staging,
    baseUrl: 'https://api.staging.keenpockets.example.com',
  );

  factory AppConfig.prod() => const AppConfig(
    environment: AppEnvironment.prod,
    baseUrl: 'https://api.keenpockets.example.com',
  );

  final AppEnvironment environment;
  final String baseUrl;
  final Duration connectTimeout;
  final Duration receiveTimeout;
  final Duration sendTimeout;
  final int maxRetries;

  bool get isProd => environment == AppEnvironment.prod;
  bool get enableLogging => !isProd && kDebugMode;
}
