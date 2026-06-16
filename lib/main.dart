import 'package:keenpockets/app/bootstrap.dart';
import 'package:keenpockets/core/config/app_config.dart';

/// Default (dev) entry point.
///
/// Flavors add `main_staging.dart` / `main_prod.dart` that call [bootstrap]
/// with the matching [AppConfig].
Future<void> main() => bootstrap(AppConfig.dev());
