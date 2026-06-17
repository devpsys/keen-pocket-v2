import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/core/session/session_manager.dart';

/// App bar for the Pockets tab. On phones it mirrors the design's top bar
/// (avatar + "KeenPocket" wordmark + bell, with a 4px bottom border); on tablets
/// it shows a search field with notifications + profile chip.
class PocketsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PocketsAppBar({super.key});

  static const double _avatarSize = 40;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  /// 4px bottom rule matching the design's `border-b-4 surface-container-highest`.
  ShapeBorder _border(BuildContext context) => Border(
    bottom: BorderSide(
      color: context.colorScheme.surfaceContainerHighest,
      width: 4,
    ),
  );

  @override
  Widget build(BuildContext context) {
    if (!context.isExpanded) {
      return AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        shape: _border(context),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: _avatarSize,
              height: _avatarSize,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.colorScheme.secondaryContainer,
                border: Border.all(
                  color: context.colorScheme.primary,
                  width: 2,
                ),
              ),
              child: Icon(
                KpIcons.profile,
                color: context.colorScheme.onSecondaryContainer,
                size: KpSpacing.l,
              ),
            ),
            const Gap.s(horizontal: true),
            Text(
              context.l10n.brandWordmark,
              style: context.textTheme.titleLarge?.copyWith(
                color: context.colorScheme.primary,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              KpIcons.notificationsOutlined,
              color: context.colorScheme.primary,
            ),
          ),
        ],
      );
    }
    // Tablet: search field + notifications/history + profile chip.
    final user = getIt<SessionManager>().currentUser;
    return AppBar(
      scrolledUnderElevation: 0,
      shape: _border(context),
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
