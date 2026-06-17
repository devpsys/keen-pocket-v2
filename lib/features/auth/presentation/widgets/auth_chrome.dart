import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';

/// The "KeenPocket" wordmark used across the auth screens.
class AuthWordmark extends StatelessWidget {
  const AuthWordmark({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      context.l10n.brandWordmark,
      style: context.textTheme.titleLarge?.copyWith(
        color: context.colorScheme.primary,
      ),
    );
  }
}

/// Top bar for the pre-auth screens that don't use an [AppBar] (splash,
/// onboarding, login): the wordmark on the left and an optional [trailing].
class AuthTopBar extends StatelessWidget {
  const AuthTopBar({this.trailing, super.key});

  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [const AuthWordmark(), ?trailing],
    );
  }
}

/// Centered wordmark [AppBar] with a back action (register, OTP).
class AuthAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AuthAppBar({this.onBack, super.key});

  final VoidCallback? onBack;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: onBack == null
          ? null
          : IconButton(
              icon: const Icon(Icons.arrow_back_rounded),
              onPressed: onBack,
            ),
      title: const AuthWordmark(),
    );
  }
}

/// The auth footer: a brand tagline plus Privacy / Terms links. On the splash
/// screen ([splashStyle]) it adds the standalone wordmark line above and renders
/// the tagline muted.
class AuthFooter extends StatelessWidget {
  const AuthFooter({this.splashStyle = false, super.key});

  final bool splashStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (splashStyle) ...[
          Text(
            context.l10n.brandWordmark,
            style: context.textTheme.labelLarge?.copyWith(
              color: context.colorScheme.primary,
            ),
          ),
          const Gap.xxs(),
          Text(
            context.l10n.authFooter,
            style: context.textTheme.bodySmall?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
        ] else
          Text(
            context.l10n.authFooter,
            style: context.textTheme.labelLarge?.copyWith(
              color: context.colorScheme.primary,
            ),
          ),
        const Gap.xs(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.l10n.legalPrivacy,
              style: context.textTheme.bodySmall?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
            const Gap.m(horizontal: true),
            Text(
              context.l10n.legalTerms,
              style: context.textTheme.bodySmall?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
