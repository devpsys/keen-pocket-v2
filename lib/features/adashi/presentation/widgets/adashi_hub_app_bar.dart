import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/core/widgets/kp_network_image.dart';

/// Phone app bar for the Adashi hub (design `adashi_hub`): a back arrow + the
/// "KeenPocket" wordmark, with a bell and the admin avatar trailing.
class AdashiHubAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AdashiHubAppBar({required this.avatarUrl, super.key});

  final String avatarUrl;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      shape: Border(
        bottom: BorderSide(
          color: context.colorScheme.surfaceContainerHighest,
          width: 4,
        ),
      ),
      titleSpacing: 0,
      title: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.of(context).maybePop(),
            icon: Icon(
              Icons.arrow_back_rounded,
              color: context.colorScheme.primary,
            ),
          ),
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
            color: context.colorScheme.onSurfaceVariant,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: KpSpacing.m),
          child: Container(
            width: KpSpacing.xl,
            height: KpSpacing.xl,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: context.colorScheme.primary, width: 2),
            ),
            child: KpNetworkAvatar(url: avatarUrl, radius: 14),
          ),
        ),
      ],
    );
  }
}
