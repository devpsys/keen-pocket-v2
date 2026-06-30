import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/administration/presentation/view_models/admin_view.dart';
import 'package:keenpockets/features/administration/presentation/widgets/admin_widgets.dart';

/// Tablet super-admin console: an 8/4 bento split — user management + schools on
/// the left, the Keens economy panel + quick stats on the right (design
/// `super_admin_console` lg layout).
class AdminConsoleTabletView extends StatelessWidget {
  const AdminConsoleTabletView({
    required this.admin,
    this.onCreateAdmin,
    super.key,
  });

  final AdminView admin;
  final VoidCallback? onCreateAdmin;

  static const double _maxWidth = 1200;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(KpSpacing.xl),
      children: [
        Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: _maxWidth),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.l10n.adminConsoleTitle,
                            style: context.textTheme.headlineLarge?.copyWith(
                              color: context.colorScheme.primary,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const Gap.xxs(),
                          Text(
                            context.l10n.adminConsoleSubtitle,
                            style: context.textTheme.bodyLarge?.copyWith(
                              color: context.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap.l(horizontal: true),
                    SizedBox(
                      width: _createWidth,
                      child: AdminCandyButton(
                        label: context.l10n.adminCreateAdmin,
                        icon: Icons.add_circle_rounded,
                        face: KpColors.brand800,
                        fg: context.colorScheme.onPrimary,
                        depth: KpColors.brand900,
                        onPressed: onCreateAdmin ?? () {},
                      ),
                    ),
                  ],
                ),
                const Gap.xl(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 8,
                      child: Column(
                        children: [
                          AdminUserManagementCard(admin: admin),
                          const Gap.l(),
                          AdminSchoolsCard(schools: admin.schools),
                        ],
                      ),
                    ),
                    const Gap.l(horizontal: true),
                    Expanded(
                      flex: 4,
                      child: Column(
                        children: [
                          AdminKeensEconomyCard(admin: admin),
                          const Gap.l(),
                          AdminQuickStats(admin: admin),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  static const double _createWidth = 200;
}
