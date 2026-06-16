import 'package:flutter/foundation.dart';

/// The signed-in user as the whole app sees it: identity + global capabilities
/// + flag-relevant status. Hydrated by `auth`/`session` after login; read by
/// many features. Per-resource roles (organiser/admin) are NOT here — those are
/// derived on domain entities (see `core/permissions`).
@immutable
class SessionUser {
  const SessionUser({
    required this.id,
    required this.name,
    this.avatarUrl,
    this.keensBalance = 0,
    this.kycVerified = false,
    this.isSuperAdmin = false,
    this.canCreateSchool = false,
  });

  final String id;
  final String name;
  final String? avatarUrl;
  final int keensBalance;
  final bool kycVerified;
  final bool isSuperAdmin;
  final bool canCreateSchool;

  SessionUser copyWith({
    String? name,
    String? avatarUrl,
    int? keensBalance,
    bool? kycVerified,
    bool? isSuperAdmin,
    bool? canCreateSchool,
  }) {
    return SessionUser(
      id: id,
      name: name ?? this.name,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      keensBalance: keensBalance ?? this.keensBalance,
      kycVerified: kycVerified ?? this.kycVerified,
      isSuperAdmin: isSuperAdmin ?? this.isSuperAdmin,
      canCreateSchool: canCreateSchool ?? this.canCreateSchool,
    );
  }

  @override
  bool operator ==(Object other) =>
      other is SessionUser &&
      other.id == id &&
      other.name == name &&
      other.avatarUrl == avatarUrl &&
      other.keensBalance == keensBalance &&
      other.kycVerified == kycVerified &&
      other.isSuperAdmin == isSuperAdmin &&
      other.canCreateSchool == canCreateSchool;

  @override
  int get hashCode => Object.hash(
    id,
    name,
    avatarUrl,
    keensBalance,
    kycVerified,
    isSuperAdmin,
    canCreateSchool,
  );
}
