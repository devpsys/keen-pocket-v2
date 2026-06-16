import 'package:keenpockets/bootstrap.dart';
import 'package:keenpockets/core/config/app_config.dart';

/// Dev flavor entry point: `flutter run -t lib/main_dev.dart --flavor dev`.
Future<void> main() => bootstrap(AppConfig.dev());
