import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:keenpockets/app/home_shell.dart';
import 'package:keenpockets/app/router/go_router_refresh_stream.dart';
import 'package:keenpockets/core/session/session_manager.dart';
import 'package:keenpockets/features/adashi/adashi.dart';
import 'package:keenpockets/features/administration/administration.dart';
import 'package:keenpockets/features/auth/auth.dart';
import 'package:keenpockets/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:keenpockets/features/auth/presentation/bloc/auth_event.dart';
import 'package:keenpockets/features/friends/friends.dart';
import 'package:keenpockets/features/gamification/gamification.dart';
import 'package:keenpockets/features/legal/legal.dart';
import 'package:keenpockets/features/money/money.dart';
import 'package:keenpockets/features/notifications/notifications.dart';
import 'package:keenpockets/features/pockets/pockets.dart';
import 'package:keenpockets/features/school/school.dart';
import 'package:keenpockets/features/trust/trust.dart';

/// Centralized navigation. Routes are declared here; features expose pages.
abstract final class AppRoutes {
  const AppRoutes._();

  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String register = '/register';
  static const String otp = '/otp';
  static const String home = '/home';
  static const String pocketPattern = '/pocket/:id';
  static String pocket(String id) => '/pocket/$id';
  static const String adashiPattern = '/adashi/:id';
  static String adashi(String id) => '/adashi/$id';
  static const String wallet = '/wallet';
  static const String payouts = '/payouts';
  static const String notifications = '/notifications';
  static const String achievements = '/achievements';
  static const String leaderboard = '/leaderboard';
  static const String trust = '/trust';
  static const String friends = '/friends';
  static const String legal = '/legal';
  static const String school = '/school';
  static const String createSchool = '/school/create';
  static const String schoolChildren = '/school/children';
  static const String admin = '/admin';
  static const String organiser = '/organiser';
}

/// Pre-auth routes a signed-out user may visit (splash → onboarding →
/// login/register/otp). Everything else requires a session.
const _publicRoutes = <String>{
  AppRoutes.splash,
  AppRoutes.onboarding,
  AppRoutes.login,
  AppRoutes.register,
  AppRoutes.otp,
};

GoRouter createRouter(SessionManager session) {
  return GoRouter(
    initialLocation: AppRoutes.splash,
    refreshListenable: GoRouterRefreshStream(session.changes),
    redirect: (context, state) {
      final loggedIn = session.status == AuthStatus.authenticated;
      final atPublic = _publicRoutes.contains(state.matchedLocation);

      if (!loggedIn) return atPublic ? null : AppRoutes.splash;
      if (atPublic) return AppRoutes.home;
      return null;
    },
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => SplashPage(
          onGetStarted: () => context.go(AppRoutes.onboarding),
          onLogin: () => context.go(AppRoutes.login),
        ),
      ),
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (context, state) => OnboardingPage(
          onDone: () => context.go(AppRoutes.login),
          onSkip: () => context.go(AppRoutes.login),
        ),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) =>
            LoginPage(onCreateAccount: () => context.go(AppRoutes.register)),
      ),
      GoRoute(
        path: AppRoutes.register,
        builder: (context, state) => RegisterPage(
          onLogin: () => context.go(AppRoutes.login),
          onSubmitted: () => context.go(AppRoutes.login),
        ),
      ),
      GoRoute(
        path: AppRoutes.otp,
        builder: (context, state) => OtpVerificationPage(
          destination: '+1 (555) ••• ••89',
          onVerified: () => context.go(AppRoutes.login),
          onBack: () => context.go(AppRoutes.login),
        ),
      ),
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => HomeShell(
          initialIndex: int.tryParse(state.uri.queryParameters['tab'] ?? ''),
          onOpenPocket: (id) => context.push(AppRoutes.pocket(id)),
          onOpenAdashi: (id) => context.push(AppRoutes.adashi(id)),
          onOpenWallet: () => context.push(AppRoutes.wallet),
          onOpenNotifications: () => context.push(AppRoutes.notifications),
          onOpenAchievements: () => context.push(AppRoutes.achievements),
          onOpenTrust: () => context.push(AppRoutes.trust),
          onOpenFriends: () => context.push(AppRoutes.friends),
          onOpenSchool: () => context.push(AppRoutes.school),
          onOpenAdmin: () => context.push(AppRoutes.admin),
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
        path: AppRoutes.payouts,
        builder: (context, state) => const PayoutsHubPage(),
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
        path: AppRoutes.leaderboard,
        builder: (context, state) => const LeaderboardPage(),
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
      GoRoute(
        path: AppRoutes.school,
        builder: (context, state) => const SchoolPage(),
      ),
      GoRoute(
        path: AppRoutes.createSchool,
        builder: (context, state) => const CreateSchoolPage(),
      ),
      GoRoute(
        path: AppRoutes.schoolChildren,
        builder: (context, state) => const MyChildrenPage(),
      ),
      GoRoute(
        path: AppRoutes.admin,
        builder: (context, state) => const AdminPage(),
      ),
      GoRoute(
        path: AppRoutes.organiser,
        builder: (context, state) => const OrganiserDashboardPage(),
      ),
    ],
  );
}
