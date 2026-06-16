import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../config/app_config.dart';
import 'injection.config.dart';

/// The single application service locator.
///
/// Use [getIt] only inside composition roots (DI registration, `main`, route
/// builders). Application code must receive its dependencies by constructor
/// injection — pulling from `getIt` inside a Bloc/use case/widget is an
/// anti-pattern this project forbids.
final GetIt getIt = GetIt.instance;

/// Wires up every dependency. Call once at startup before `runApp`.
///
/// [config] is registered first so the network module's `Dio` factory can read
/// flavor-specific values.
@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies(AppConfig config) async {
  getIt.registerSingleton<AppConfig>(config);
  await getIt.init();
}
