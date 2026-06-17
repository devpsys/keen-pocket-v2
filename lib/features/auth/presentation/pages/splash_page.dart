import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/auth/presentation/widgets/auth_chrome.dart';

/// First-run splash (design phase B — `keenpocket_splash`). Pre-auth entry:
/// routes to onboarding or straight to login. Navigation is injected by the
/// router so this page stays decoupled from route constants.
class SplashPage extends StatelessWidget {
  const SplashPage({this.onGetStarted, this.onLogin, super.key});

  final VoidCallback? onGetStarted;
  final VoidCallback? onLogin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(KpSpacing.l),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Spacer(),
                      Image.asset(
                        'assets/images/kandfriends.png',
                        package: 'design_system',
                        height: 180,
                        fit: BoxFit.contain,
                      ),
                      const Gap.xl(),
                      Text(
                        context.l10n.brandWordmark,
                        style: context.textTheme.displayLarge?.copyWith(
                          color: context.colorScheme.primary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Gap.s(),
                      Text(
                        context.l10n.splashTagline,
                        style: context.textTheme.bodyLarge?.copyWith(
                          color: context.colorScheme.onSurfaceVariant,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Spacer(),
                      KpButton(
                        label: context.l10n.splashGetStarted,
                        onPressed: onGetStarted ?? () {},
                      ),
                      const Gap.s(),
                      TextButton(
                        onPressed: onLogin ?? () {},
                        child: Text(context.l10n.splashHaveAccount),
                      ),
                      const Gap.l(),
                      const AuthFooter(splashStyle: true),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
