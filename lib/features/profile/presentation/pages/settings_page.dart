import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/app/app_nav.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/core/widgets/kp_network_image.dart';
import 'package:keenpockets/features/profile/presentation/widgets/settings_fixtures.dart';
import 'package:keenpockets/features/profile/presentation/widgets/settings_locked_field.dart';
import 'package:keenpockets/features/profile/presentation/widgets/settings_section.dart';
import 'package:keenpockets/features/profile/presentation/widgets/settings_toggle_row.dart';

/// Account & app settings hub (design `settings`): profile photo, account info,
/// notification preferences, password, bank accounts, app settings and a set of
/// navigational "More" entries. Presentation-only — all state is local UI.
class SettingsPage extends StatefulWidget {
  const SettingsPage({
    this.onLogout,
    this.onOpenWallet,
    this.onOpenNotifications,
    this.onOpenFriends,
    this.onOpenSchool,
    this.onOpenAdmin,
    this.onOpenLegal,
    super.key,
  });

  final VoidCallback? onLogout;
  final VoidCallback? onOpenWallet;
  final VoidCallback? onOpenNotifications;
  final VoidCallback? onOpenFriends;
  final VoidCallback? onOpenSchool;
  final VoidCallback? onOpenAdmin;
  final VoidCallback? onOpenLegal;

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _push = true;
  bool _sms = false;
  bool _whatsapp = true;
  bool _darkMode = false;

  final _name = TextEditingController(text: kSettingsName);
  final _currentPassword = TextEditingController();
  final _newPassword = TextEditingController();
  final _confirmPassword = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _currentPassword.dispose();
    _newPassword.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppTabletShell(
      onLogout: widget.onLogout,
      body: Scaffold(
        appBar: AppBar(
          title: Text(
            context.l10n.settingsTitle,
            style: context.textTheme.titleLarge?.copyWith(
              color: context.colorScheme.primary,
            ),
          ),
          scrolledUnderElevation: 0,
        ),
        body: ListView(
          padding: const EdgeInsets.all(KpSpacing.m),
          children: [
            SettingsSection(
              title: context.l10n.settingsProfilePhoto,
              child: const _ProfilePhotoBlock(),
            ),
            const Gap.m(),
            SettingsSection(
              title: context.l10n.settingsAccountInfo,
              child: _AccountInfoBlock(nameController: _name),
            ),
            const Gap.m(),
            SettingsSection(
              title: context.l10n.settingsNotifPrefs,
              child: Column(
                children: [
                  SettingsToggleRow(
                    icon: KpIcons.notifications,
                    title: context.l10n.settingsPushNotif,
                    subtitle: context.l10n.settingsPushNotifSub,
                    value: _push,
                    onChanged: (v) => setState(() => _push = v),
                  ),
                  const Gap.s(),
                  SettingsToggleRow(
                    icon: Icons.sms_rounded,
                    title: context.l10n.settingsSmsNotif,
                    subtitle: context.l10n.settingsSmsNotifSub,
                    value: _sms,
                    onChanged: (v) => setState(() => _sms = v),
                  ),
                  const Gap.s(),
                  SettingsToggleRow(
                    icon: Icons.chat_rounded,
                    title: context.l10n.settingsWhatsappNotif,
                    subtitle: context.l10n.settingsWhatsappNotifSub,
                    value: _whatsapp,
                    onChanged: (v) => setState(() => _whatsapp = v),
                  ),
                ],
              ),
            ),
            const Gap.m(),
            SettingsSection(
              title: context.l10n.settingsChangePassword,
              child: Column(
                children: [
                  KpTextField(
                    label: context.l10n.settingsCurrentPassword,
                    controller: _currentPassword,
                    obscureText: true,
                  ),
                  const Gap.m(),
                  KpTextField(
                    label: context.l10n.settingsNewPassword,
                    controller: _newPassword,
                    obscureText: true,
                  ),
                  const Gap.m(),
                  KpTextField(
                    label: context.l10n.settingsConfirmPassword,
                    controller: _confirmPassword,
                    obscureText: true,
                  ),
                  const Gap.m(),
                  KpButton(
                    label: context.l10n.settingsUpdatePassword,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const Gap.m(),
            _BankAccountsSection(onManage: widget.onOpenWallet),
            const Gap.m(),
            SettingsSection(
              title: context.l10n.settingsAppSettings,
              child: SettingsToggleRow(
                icon: Icons.dark_mode_rounded,
                title: context.l10n.settingsDarkMode,
                subtitle: context.l10n.settingsAppSettings,
                value: _darkMode,
                onChanged: (v) => setState(() => _darkMode = v),
              ),
            ),
            const Gap.m(),
            _MoreSection(
              onOpenNotifications: widget.onOpenNotifications,
              onOpenFriends: widget.onOpenFriends,
              onOpenSchool: widget.onOpenSchool,
              onOpenAdmin: widget.onOpenAdmin,
              onOpenLegal: widget.onOpenLegal,
            ),
            const Gap.l(),
            KpButton(
              label: context.l10n.logout,
              variant: KpButtonVariant.error,
              onPressed: widget.onLogout,
            ),
            const Gap.m(),
            Center(
              child: Text(
                context.l10n.settingsVersion(kSettingsAppVersion),
                style: context.textTheme.labelSmall?.copyWith(
                  color: context.colorScheme.outline,
                ),
              ),
            ),
            const Gap.l(),
          ],
        ),
      ),
    );
  }
}

/// Centered avatar with an edit badge, a blurb, and the upload CTA.
class _ProfilePhotoBlock extends StatelessWidget {
  const _ProfilePhotoBlock();

  static const double _avatarRadius = 48;
  static const double _badgeRadius = 16;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    return Column(
      children: [
        Stack(
          children: [
            const KpNetworkAvatar(
              url: kSettingsAvatarUrl,
              radius: _avatarRadius,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: CircleAvatar(
                radius: _badgeRadius,
                backgroundColor: scheme.primary,
                child: Icon(
                  Icons.edit_rounded,
                  size: KpSpacing.m,
                  color: scheme.onPrimary,
                ),
              ),
            ),
          ],
        ),
        const Gap.m(),
        Text(
          context.l10n.settingsPhotoBlurb,
          textAlign: TextAlign.center,
          style: context.textTheme.bodyMedium?.copyWith(
            color: scheme.onSurfaceVariant,
          ),
        ),
        const Gap.m(),
        KpButton(label: context.l10n.settingsUploadPhoto, onPressed: () {}),
      ],
    );
  }
}

/// Editable name field, locked email/phone rows, and a support notice.
class _AccountInfoBlock extends StatelessWidget {
  const _AccountInfoBlock({required this.nameController});

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        KpTextField(
          label: context.l10n.settingsName,
          controller: nameController,
        ),
        const Gap.m(),
        SettingsLockedField(
          label: context.l10n.settingsEmail,
          value: kSettingsEmail,
        ),
        const Gap.m(),
        SettingsLockedField(
          label: context.l10n.settingsPhone,
          value: kSettingsPhone,
        ),
        const Gap.m(),
        const _ContactSupportNotice(),
      ],
    );
  }
}

/// Error-tinted notice telling the user to contact support for locked fields.
class _ContactSupportNotice extends StatelessWidget {
  const _ContactSupportNotice();

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    return Container(
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: BoxDecoration(
        color: scheme.errorContainer,
        borderRadius: KpRadii.allM,
        border: Border.all(color: scheme.error, width: 2),
      ),
      child: Row(
        children: [
          Icon(KpIcons.info, color: scheme.error),
          const Gap.s(horizontal: true),
          Expanded(
            child: Text(
              context.l10n.settingsContactSupport,
              style: context.textTheme.bodyMedium?.copyWith(
                color: scheme.onErrorContainer,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Bank-accounts section: header with a ghost "Manage" button and the selected
/// primary account tile.
class _BankAccountsSection extends StatelessWidget {
  const _BankAccountsSection({required this.onManage});

  final VoidCallback? onManage;

  static const double _bankIconTile = 48;
  static const double _manageWidth = 120;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    return KpCard(
      padding: const EdgeInsets.all(KpSpacing.l),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  context.l10n.settingsBankAccounts,
                  style: context.textTheme.titleMedium,
                ),
              ),
              SizedBox(
                width: _manageWidth,
                child: KpButton(
                  label: context.l10n.settingsManage,
                  variant: KpButtonVariant.ghost,
                  onPressed: onManage,
                ),
              ),
            ],
          ),
          const Gap.m(),
          Container(
            padding: const EdgeInsets.all(KpSpacing.m),
            decoration: BoxDecoration(
              color: scheme.primaryContainer,
              borderRadius: KpRadii.allL,
              border: Border.all(color: scheme.primary, width: 2),
            ),
            child: Row(
              children: [
                Container(
                  width: _bankIconTile,
                  height: _bankIconTile,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: scheme.surface,
                    borderRadius: KpRadii.allM,
                  ),
                  child: Icon(
                    Icons.account_balance_rounded,
                    color: scheme.primary,
                  ),
                ),
                const Gap.s(horizontal: true),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        kSettingsBankName,
                        style: context.textTheme.bodyLarge?.copyWith(
                          color: scheme.onPrimaryContainer,
                        ),
                      ),
                      Text(
                        context.l10n.settingsPrimaryAccount,
                        style: context.textTheme.bodySmall?.copyWith(
                          color: scheme.onPrimaryContainer,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.check_circle_rounded, color: scheme.primary),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Navigational "More" list — each entry pushes a related screen.
class _MoreSection extends StatelessWidget {
  const _MoreSection({
    required this.onOpenNotifications,
    required this.onOpenFriends,
    required this.onOpenSchool,
    required this.onOpenAdmin,
    required this.onOpenLegal,
  });

  final VoidCallback? onOpenNotifications;
  final VoidCallback? onOpenFriends;
  final VoidCallback? onOpenSchool;
  final VoidCallback? onOpenAdmin;
  final VoidCallback? onOpenLegal;

  @override
  Widget build(BuildContext context) {
    return SettingsSection(
      title: context.l10n.settingsMore,
      child: Column(
        children: [
          _MoreTile(
            icon: KpIcons.notificationsOutlined,
            title: context.l10n.profileNotifications,
            onTap: onOpenNotifications,
          ),
          _MoreTile(
            icon: KpIcons.group,
            title: context.l10n.profileFriends,
            onTap: onOpenFriends,
          ),
          _MoreTile(
            icon: Icons.school_rounded,
            title: context.l10n.profileSchool,
            onTap: onOpenSchool,
          ),
          _MoreTile(
            icon: Icons.admin_panel_settings_rounded,
            title: context.l10n.profileAdmin,
            onTap: onOpenAdmin,
          ),
          _MoreTile(
            icon: Icons.gavel_rounded,
            title: context.l10n.profileLegal,
            onTap: onOpenLegal,
          ),
        ],
      ),
    );
  }
}

class _MoreTile extends StatelessWidget {
  const _MoreTile({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: context.colorScheme.onSurfaceVariant),
      title: Text(title, style: context.textTheme.bodyLarge),
      trailing: const Icon(KpIcons.chevronRight),
      onTap: onTap,
    );
  }
}
