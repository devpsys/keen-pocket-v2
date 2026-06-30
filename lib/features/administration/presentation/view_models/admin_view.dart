/// Avatar background tint for a console user row (design `super_admin_console`).
enum AdminAvatarTone { blue, gold, teal }

/// Roles shown in the user-management table.
enum AdminUserRole { standardUser, educator }

/// A user row in the admin user-management table (design `super_admin_console`).
class AdminUserView {
  const AdminUserView({
    required this.name,
    required this.role,
    required this.email,
    required this.phone,
    required this.avatarUrl,
    required this.tone,
    required this.canCreateSchool,
  });

  final String name;
  final AdminUserRole role;
  final String email;
  final String phone;
  final String avatarUrl;
  final AdminAvatarTone tone;
  final bool canCreateSchool;
}

/// A school entry in the admin schools list (design `super_admin_console`).
class AdminSchoolView {
  const AdminSchoolView({
    required this.name,
    required this.owner,
    required this.isOpen,
  });

  final String name;
  final String owner;
  final bool isOpen;
}

/// UI-shaped super-admin console (presentation-only placeholder for now).
class AdminView {
  const AdminView({
    required this.users,
    required this.mascotNote,
    required this.schools,
    required this.coinsEnabled,
    required this.pocketCost,
    required this.adashiCost,
    required this.schoolCost,
    required this.dailyUsers,
    required this.schoolsCount,
  });

  final List<AdminUserView> users;
  final String mascotNote; // Mr. K feedback fragment
  final List<AdminSchoolView> schools;

  // Keens economy.
  final bool coinsEnabled;
  final int pocketCost;
  final int adashiCost;
  final int schoolCost;

  // Quick stats.
  final String dailyUsers; // e.g. "1.2k"
  final int schoolsCount;
}
