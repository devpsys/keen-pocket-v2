import '../session/session_user.dart';

/// Global, role-derived authorization answers based on the [SessionUser]'s
/// capabilities.
///
/// **Per-resource** authorization (organiser vs member of a specific Pocket /
/// admin of an Adashi) is a *domain* concern: implement `roleOf(userId)` and
/// `can…` predicates on the entities themselves (`Pocket`, `Adashi`) and expose
/// them through this policy as features are built. Widgets render a
/// permission-restricted state from policy results — never hard-coded role
/// checks.
class AccessPolicy {
  const AccessPolicy(this._user);

  final SessionUser? _user;

  bool get isAuthenticated => _user != null;
  bool get isSuperAdmin => _user?.isSuperAdmin ?? false;
  bool get canCreateSchool => _user?.canCreateSchool ?? false;
  bool get isKycVerified => _user?.kycVerified ?? false;
}
