import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keenpockets/core/error/failure_localizer.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:keenpockets/features/auth/presentation/bloc/auth_state.dart';
import 'package:keenpockets/features/auth/presentation/widgets/auth_chrome.dart';
import 'package:keenpockets/features/auth/presentation/widgets/login_form.dart';

/// Login screen (design phase B — `login_updated_mascot`). Reads the app-wide
/// [AuthBloc]; on success the router's session guard redirects to the home
/// shell. Shows a snackbar for non-field failures.
class LoginPage extends StatelessWidget {
  const LoginPage({this.onCreateAccount, this.onForgotPassword, super.key});

  final VoidCallback? onCreateAccount;
  final VoidCallback? onForgotPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listenWhen: (prev, curr) => prev.status != curr.status,
        listener: (context, state) {
          if (state.status.isFailure &&
              state.fieldErrors.isEmpty &&
              state.failure != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.failure!.localizedMessage(context))),
            );
          }
        },
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(KpSpacing.l),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AuthTopBar(
                  trailing: IconButton(
                    tooltip: context.l10n.authHelp,
                    icon: const Icon(Icons.help_outline_rounded),
                    onPressed: () {},
                  ),
                ),
                const Gap.s(),
                Center(
                  child: Image.asset(
                    'assets/images/kandfriends.png',
                    package: 'design_system',
                    height: 96,
                    fit: BoxFit.contain,
                  ),
                ),
                const Gap.m(),
                Text(
                  context.l10n.loginWelcomeBack,
                  style: context.textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const Gap.xs(),
                Text(
                  context.l10n.loginSubtitle,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Gap.l(),
                KpCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      LoginForm(onForgotPassword: onForgotPassword),
                      const Gap.s(),
                      const _OrDivider(),
                      const Gap.s(),
                      Row(
                        children: [
                          Expanded(
                            child: KpButton(
                              label: context.l10n.loginGoogle,
                              icon: Icons.g_mobiledata_rounded,
                              variant: KpButtonVariant.ghost,
                              onPressed: () {},
                            ),
                          ),
                          const Gap.s(horizontal: true),
                          Expanded(
                            child: KpButton(
                              label: context.l10n.loginFacebook,
                              icon: Icons.facebook_rounded,
                              variant: KpButtonVariant.ghost,
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Gap.m(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      context.l10n.loginNoAccount,
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    TextButton(
                      onPressed: onCreateAccount ?? () {},
                      child: Text(context.l10n.loginCreateAccount),
                    ),
                  ],
                ),
                const Gap.l(),
                const AuthFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _OrDivider extends StatelessWidget {
  const _OrDivider();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: KpSpacing.s),
          child: Text(
            context.l10n.loginOr,
            style: context.textTheme.labelSmall?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
        const Expanded(child: Divider()),
      ],
    );
  }
}
