import 'package:go_router/go_router.dart';

import 'package:keenpockets/features/auth/presentation/pages/login_page.dart';
import 'package:keenpockets/features/dashboard/presentation/pages/dashboard_page.dart';

/// Centralized navigation. Routes are declared here; features expose pages,
/// never their own navigation graph.
abstract final class AppRoutes {
  const AppRoutes._();

  static const String login = '/login';
  static const String dashboard = '/dashboard';
}

/// Builds the application [GoRouter].
GoRouter createRouter() {
  return GoRouter(
    initialLocation: AppRoutes.login,
    routes: [
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) =>
            LoginPage(onAuthenticated: () => context.go(AppRoutes.dashboard)),
      ),
      GoRoute(
        path: AppRoutes.dashboard,
        builder: (context, state) =>
            DashboardPage(onLogout: () => context.go(AppRoutes.login)),
      ),
    ],
  );
}
