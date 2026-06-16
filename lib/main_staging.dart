import 'package:keenpockets/bootstrap.dart';
import 'package:keenpockets/core/config/app_config.dart';

/// Staging flavor entry point:
/// `flutter run -t lib/main_staging.dart --flavor staging`.
Future<void> main() => bootstrap(AppConfig.staging());
