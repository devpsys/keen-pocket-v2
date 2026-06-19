import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/core/widgets/kp_network_image.dart';
import 'package:keenpockets/features/adashi/presentation/cubit/adashi_samples.dart';

/// Phone app bar for the Adashi tab (design `adashi_circles`): a profile avatar,
/// the "KeenPocket" wordmark, and a notifications bell, under a 4px bottom rule.
class AdashiAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AdashiAppBar({super.key});

  static const double _avatarSize = 40;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 0,
      shape: Border(
        bottom: BorderSide(
          color: context.colorScheme.surfaceContainerHighest,
          width: 4,
        ),
      ),
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: _avatarSize,
            height: _avatarSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: context.colorScheme.primary, width: 2),
            ),
            child: const KpNetworkAvatar(
              url: AdashiSamples.appBarAvatar,
              radius: 18,
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
}
