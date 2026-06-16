import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/config/app_config.dart';

void main() {
  group('AppConfig', () {
    test('dev/staging/prod factories set environment and base url', () {
      expect(AppConfig.dev().environment, AppEnvironment.dev);
      expect(AppConfig.staging().environment, AppEnvironment.staging);
      expect(AppConfig.prod().environment, AppEnvironment.prod);
      expect(AppConfig.dev().baseUrl, contains('dev'));
      expect(AppConfig.staging().baseUrl, contains('staging'));
    });

    test('isProd is true only for prod', () {
      expect(AppConfig.prod().isProd, isTrue);
      expect(AppConfig.dev().isProd, isFalse);
    });

    test('logging is disabled in prod', () {
      expect(AppConfig.prod().enableLogging, isFalse);
    });

    test('exposes default timeouts and retries', () {
      final c = AppConfig.dev();
      expect(c.connectTimeout, const Duration(seconds: 20));
      expect(c.receiveTimeout, const Duration(seconds: 20));
      expect(c.sendTimeout, const Duration(seconds: 20));
      expect(c.maxRetries, 2);
    });
  });
}
