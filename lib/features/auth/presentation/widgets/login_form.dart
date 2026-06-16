import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:keenpockets/features/auth/presentation/bloc/auth_event.dart';
import 'package:keenpockets/features/auth/presentation/bloc/auth_state.dart';

/// The credential entry form. Reads validation errors from [AuthState] and
/// dispatches [AuthEvent]s — it contains no business logic itself.
class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
              label: context.l10n.emailLabel,
              hint: context.l10n.emailHint,
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
            const Gap.l(),
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
