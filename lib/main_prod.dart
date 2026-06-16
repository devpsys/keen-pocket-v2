import 'package:keenpockets/bootstrap.dart';
import 'package:keenpockets/core/config/app_config.dart';

/// Production flavor entry point:
/// `flutter run -t lib/main_prod.dart --flavor prod`.
Future<void> main() => bootstrap(AppConfig.prod());
