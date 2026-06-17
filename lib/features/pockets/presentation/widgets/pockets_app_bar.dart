import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/core/session/session_manager.dart';

/// App bar for the Pockets tab: a simple title on phones, and a search field
/// with notifications + profile chip on tablets (my_pockets_tablet).
class PocketsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PocketsAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    if (!context.isExpanded) {
      return AppBar(
        title: Text(context.l10n.pocketsMyTitle),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(KpIcons.notificationsOutlined),
          ),
        ],
      );
    }
    // Tablet: search field + notifications/history + profile chip.
    final user = getIt<SessionManager>().currentUser;
    return AppBar(
      titleSpacing: KpSpacing.l,
      title: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 360),
        child: TextField(
          style: context.textTheme.bodyMedium,
          decoration: InputDecoration(
            isDense: true,
            hintText: context.l10n.pocketsSearchHint,
            prefixIcon: const Icon(KpIcons.search, size: KpSpacing.l),
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(KpIcons.notifications, color: context.colorScheme.primary),
        ),
        Padding(
          padding: const EdgeInsets.only(right: KpSpacing.m),
          child: Chip(
            avatar: Icon(KpIcons.account, color: context.colorScheme.primary),
            label: Text(
              user?.name ?? context.l10n.profileTitle,
              style: context.textTheme.labelLarge,
            ),
          ),
        ),
      ],
    );
  }
}
