import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:keenpockets/app/home_shell.dart';
import 'package:keenpockets/app/router/go_router_refresh_stream.dart';
import 'package:keenpockets/core/session/session_manager.dart';
import 'package:keenpockets/features/adashi/adashi.dart';
import 'package:keenpockets/features/auth/auth.dart';
import 'package:keenpockets/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:keenpockets/features/auth/presentation/bloc/auth_event.dart';
import 'package:keenpockets/features/friends/friends.dart';
import 'package:keenpockets/features/gamification/gamification.dart';
import 'package:keenpockets/features/legal/legal.dart';
import 'package:keenpockets/features/money/money.dart';
import 'package:keenpockets/features/notifications/notifications.dart';
import 'package:keenpockets/features/pockets/pockets.dart';
import 'package:keenpockets/features/trust/trust.dart';

/// Centralized navigation. Routes are declared here; features expose pages.
abstract final class AppRoutes {
  const AppRoutes._();

  static const String login = '/login';
  static const String home = '/home';
  static const String pocketPattern = '/pocket/:id';
  static String pocket(String id) => '/pocket/$id';
  static const String adashiPattern = '/adashi/:id';
  static String adashi(String id) => '/adashi/$id';
  static const String wallet = '/wallet';
  static const String notifications = '/notifications';
  static const String achievements = '/achievements';
  static const String trust = '/trust';
  static const String friends = '/friends';
  static const String legal = '/legal';
}

/// Builds the application [GoRouter] with a session-driven auth guard:
/// unauthenticated users are redirected to /login; authenticated users away
/// from it. The guard re-runs whenever [SessionManager] emits.
GoRouter createRouter(SessionManager session) {
  return GoRouter(
    initialLocation: AppRoutes.home,
    refreshListenable: GoRouterRefreshStream(session.changes),
    redirect: (context, state) {
      final loggedIn = session.status == AuthStatus.authenticated;
      final loggingIn = state.matchedLocation == AppRoutes.login;

      if (!loggedIn) return loggingIn ? null : AppRoutes.login;
      if (loggingIn) return AppRoutes.home;
      return null;
    },
    routes: [
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => HomeShell(
          onOpenPocket: (id) => context.push(AppRoutes.pocket(id)),
          onOpenAdashi: (id) => context.push(AppRoutes.adashi(id)),
          onOpenWallet: () => context.push(AppRoutes.wallet),
          onOpenNotifications: () => context.push(AppRoutes.notifications),
          onOpenAchievements: () => context.push(AppRoutes.achievements),
          onOpenTrust: () => context.push(AppRoutes.trust),
          onOpenFriends: () => context.push(AppRoutes.friends),
          onOpenLegal: () => context.push(AppRoutes.legal),
          onLogout: () =>
              context.read<AuthBloc>().add(const AuthEvent.logoutRequested()),
        ),
      ),
      GoRoute(
        path: AppRoutes.pocketPattern,
        builder: (context, state) =>
            PocketDetailPage(pocketId: state.pathParameters['id']!),
      ),
      GoRoute(
        path: AppRoutes.adashiPattern,
        builder: (context, state) =>
            AdashiDetailPage(adashiId: state.pathParameters['id']!),
      ),
      GoRoute(
        path: AppRoutes.wallet,
        builder: (context, state) => const WalletPage(),
      ),
      GoRoute(
        path: AppRoutes.notifications,
        builder: (context, state) => const NotificationsPage(),
      ),
      GoRoute(
        path: AppRoutes.achievements,
        builder: (context, state) => const AchievementsPage(),
      ),
      GoRoute(
        path: AppRoutes.trust,
        builder: (context, state) => const TrustPage(),
      ),
      GoRoute(
        path: AppRoutes.friends,
        builder: (context, state) => const FriendsPage(),
      ),
      GoRoute(
        path: AppRoutes.legal,
        builder: (context, state) => const LegalPage(),
      ),
    ],
  );
}
