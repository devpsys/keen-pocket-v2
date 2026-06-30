import 'package:keenpockets/features/administration/presentation/view_models/admin_view.dart';

/// PRESENTATION-ONLY sample super-admin console (design `super_admin_console`).
/// Swap for real data when the admin APIs exist.

/// Mr. K shown in the user-management feedback fragment.
const kAdminMascotUrl =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuD9sGD3RP-5ueHCwyOuiR-UP5oPaiBKUV1DkKsFfbz8_uwAVSyB32JY6MhKrAFumy1Sbqgoiy83f0C8WarTB8TVJdNAvk9OjRXXjUwwdWNGV3l5zGst5Qa3Ott_v7O3XmIU8j12SQL8eWHnsXeIzvhQFGRnqEOcRrgLWXkID3nAssg_Gf9p14PufXxiEC5Y37c15EGRhexVhyffzQGn-XZxzPLj6WVvd_hs_h4hH6cwg55D5dlC6II5zEBDcxYiaPtePeZvq6VqwHg';

const _avatar1 =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuAdwgQ_eJ6Mjq_pQDkLsdTCMXOP83CdeFmsVivNppj_LWlxB-I18fjzj6XEFWCsKAg_c1zoLfK-VmjVeVn7WBR7O7RHS-q_5tFrPb0vTT17Lq-hIZ6E0m5cy8yxhZm-pbwctxOZCz4R_roqPu1UGLIoWqWkqa4D7N6gfUgn6rc_3OatgYwPJMYlnOdLo5a8OsQLt2Ng3kLWoszzpo5Km3Q931leLVNfOFAWTVjcpBdtqBrN7zaIRmuHs7QizAW0zjOGSw8aSipCkwc';
const _avatar2 =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuBQlaWJ89b8d9nEeCKQeNU7fNBQ609KtGnHmHNCjrro0g7tTyyXnjO5_w8kGIRZjiCZUZpuhZVqWXJE_hX7X3wbEBl7tMf215ao_uhkO734zyod31caBerRl5kDC9TT4O0Twupj0rHAi02zRMprjZt5I8wc5pKRA2rB-9QxSAssnU1XTRK1BDzkANIObZLBkMaiI_iCKBjmTixL1amMZJQYvC23l7sjqMl_mnikcL5lYbpSC5E52wpsavYTmO1Yzx3e1bne8JuNGYk';
const _avatar3 =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuBu1hRA1kHvSWEu_omkHvA-I0Pvv2S_2tMCbGRQAAFj0fuztqU4rK5AAfnHerp_gXo4yr1NcdNFq7ORf7KLVj3zhnlvv7lNX-4gl0MxLFrdPf9tuTsN5sy-EcFHLtpioXxwCexqnhIl6a-OmRPi5KiQNaeb2L-cokjXI4ZgPxT4KvISniNpapanTpUkp92jjwVF4xnasC2jmOB7SKAj8UdhWF8HWtARx3WiZfff97ksuzyEQa3Nb0Goonxu2dQujveBIPFz5AhY82Y';

const kAdmin = AdminView(
  users: [
    AdminUserView(
      name: 'Alex Rivera',
      role: AdminUserRole.standardUser,
      email: 'alex.r@email.com',
      phone: '+1 (555) 012-3456',
      avatarUrl: _avatar1,
      tone: AdminAvatarTone.blue,
      canCreateSchool: false,
    ),
    AdminUserView(
      name: 'Sarah Johnson',
      role: AdminUserRole.educator,
      email: 's.johnson@school.org',
      phone: '+1 (555) 987-6543',
      avatarUrl: _avatar2,
      tone: AdminAvatarTone.gold,
      canCreateSchool: true,
    ),
    AdminUserView(
      name: 'Marcus Chen',
      role: AdminUserRole.standardUser,
      email: 'm.chen@keen.net',
      phone: '+44 7700 900077',
      avatarUrl: _avatar3,
      tone: AdminAvatarTone.teal,
      canCreateSchool: false,
    ),
  ],
  mascotNote:
      'Mr. K says: Found 142 users matching your current criteria. Remember to '
      'double-check educator IDs before granting school creation rights!',
  schools: [
    AdminSchoolView(name: 'Peak Academy', owner: 'Sarah Johnson', isOpen: true),
    AdminSchoolView(name: 'River Tech', owner: 'David Miller', isOpen: false),
    AdminSchoolView(name: "St. Jude's", owner: 'Elena Rodriguez', isOpen: true),
  ],
  coinsEnabled: true,
  pocketCost: 150,
  adashiCost: 450,
  schoolCost: 2500,
  dailyUsers: '1.2k',
  schoolsCount: 48,
);
