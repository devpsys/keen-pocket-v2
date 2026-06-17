import 'package:design_system/design_system.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:keenpockets/features/auth/presentation/bloc/auth_event.dart';
import 'package:keenpockets/features/auth/presentation/bloc/auth_state.dart';

/// The credential entry form. Reads validation errors from [AuthState] and
/// dispatches [AuthEvent]s — it contains no business logic itself.
class LoginForm extends StatefulWidget {
  const LoginForm({this.onForgotPassword, super.key});

  final VoidCallback? onForgotPassword;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _remember = false;

  // Prefilled in debug builds so the dev fake auth can be exercised quickly;
  // empty in release.
  final _emailController = TextEditingController(
    text: kDebugMode ? 'ada@keenpockets.dev' : null,
  );
  final _passwordController = TextEditingController(
    text: kDebugMode ? 'password123' : null,
  );

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    context.read<AuthBloc>().add(
      AuthEvent.loginRequested(
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );
  }

  String? _fieldError(
    BuildContext context,
    Map<String, String> errors,
    String field,
  ) {
    final code = errors[field];
    return switch (code) {
      'required' when field == 'email' => context.l10n.validationEmailRequired,
      'invalid' => context.l10n.validationEmailInvalid,
      'required' => context.l10n.validationPasswordRequired,
      'too_short' => context.l10n.validationPasswordTooShort,
      _ => null,
    };
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        final isLoading = state.status.isLoading;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            KpTextField(
              label: context.l10n.loginIdentifierLabel,
              hint: context.l10n.loginIdentifierHint,
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              errorText: _fieldError(context, state.fieldErrors, 'email'),
            ),
            const Gap.m(),
            KpTextField(
              label: context.l10n.passwordLabel,
              hint: context.l10n.passwordHint,
              controller: _passwordController,
              obscureText: true,
              textInputAction: TextInputAction.done,
              errorText: _fieldError(context, state.fieldErrors, 'password'),
            ),
            const Gap.xs(),
            Row(
              children: [
                Checkbox(
                  value: _remember,
                  onChanged: (v) => setState(() => _remember = v ?? false),
                ),
                Flexible(
                  child: Text(
                    context.l10n.loginRememberMe,
                    style: context.textTheme.bodyMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: widget.onForgotPassword ?? () {},
                  child: Text(
                    context.l10n.loginForgotPassword,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const Gap.s(),
            KpButton(
              label: context.l10n.login,
              onPressed: _submit,
              isLoading: isLoading,
            ),
          ],
        );
      },
    );
  }
}
