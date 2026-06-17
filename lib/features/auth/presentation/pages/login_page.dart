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
                const Gap.l(),
                // Two-column hero + form on large tablets/desktop; a centered
                // single column on phones and small tablets.
                if (context.isExpanded)
                  _WideBody(
                    onCreateAccount: onCreateAccount,
                    onForgotPassword: onForgotPassword,
                  )
                else
                  AuthCenter(
                    maxWidth: 480,
                    child: _PhoneBody(
                      onCreateAccount: onCreateAccount,
                      onForgotPassword: onForgotPassword,
                    ),
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

/// Hero: brand art + welcome copy (centered on phone, left column on tablet).
class _Hero extends StatelessWidget {
  const _Hero({this.center = false, this.artHeight = 96});

  final bool center;
  final double artHeight;

  @override
  Widget build(BuildContext context) {
    final align = center ? CrossAxisAlignment.center : CrossAxisAlignment.start;
    final textAlign = center ? TextAlign.center : TextAlign.start;
    return Column(
      crossAxisAlignment: align,
      children: [
        Align(
          alignment: center ? Alignment.center : Alignment.centerLeft,
          child: Image.asset(
            'assets/images/kandfriends.png',
            package: 'design_system',
            height: artHeight,
            fit: BoxFit.contain,
          ),
        ),
        const Gap.m(),
        Text(
          context.l10n.loginWelcomeBack,
          style: context.textTheme.headlineLarge,
          textAlign: textAlign,
        ),
        const Gap.xs(),
        Text(
          context.l10n.loginSubtitle,
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
          ),
          textAlign: textAlign,
        ),
      ],
    );
  }
}

class _FormCard extends StatelessWidget {
  const _FormCard({this.onForgotPassword, this.showTitle = false});

  final VoidCallback? onForgotPassword;
  final bool showTitle;

  @override
  Widget build(BuildContext context) {
    return KpCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (showTitle) ...[
            Text(context.l10n.login, style: context.textTheme.headlineMedium),
            const Gap.m(),
          ],
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
    );
  }
}

class _CreateRow extends StatelessWidget {
  const _CreateRow({this.onCreateAccount});

  final VoidCallback? onCreateAccount;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
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
    );
  }
}

class _PhoneBody extends StatelessWidget {
  const _PhoneBody({this.onCreateAccount, this.onForgotPassword});

  final VoidCallback? onCreateAccount;
  final VoidCallback? onForgotPassword;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const _Hero(center: true),
        const Gap.l(),
        _FormCard(onForgotPassword: onForgotPassword),
        const Gap.m(),
        _CreateRow(onCreateAccount: onCreateAccount),
      ],
    );
  }
}

class _WideBody extends StatelessWidget {
  const _WideBody({this.onCreateAccount, this.onForgotPassword});

  final VoidCallback? onCreateAccount;
  final VoidCallback? onForgotPassword;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 900),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(child: _Hero(artHeight: 160)),
            const Gap.xl(horizontal: true),
            Expanded(
              child: Column(
                children: [
                  _FormCard(
                    onForgotPassword: onForgotPassword,
                    showTitle: true,
                  ),
                  const Gap.m(),
                  _CreateRow(onCreateAccount: onCreateAccount),
                ],
              ),
            ),
          ],
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
