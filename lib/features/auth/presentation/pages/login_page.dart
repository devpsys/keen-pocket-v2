import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/error/failure_localizer.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:keenpockets/features/auth/presentation/bloc/auth_state.dart';
import 'package:keenpockets/features/auth/presentation/widgets/login_form.dart';

/// Login screen. Provides its [AuthBloc] from DI and reacts to state changes
/// (navigation on success, snackbar on non-field failures).
class LoginPage extends StatelessWidget {
  const LoginPage({this.onAuthenticated, super.key});

  /// Invoked when login succeeds (wired to navigation by the router).
  final VoidCallback? onAuthenticated;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (_) => getIt<AuthBloc>(),
      child: _LoginView(onAuthenticated: onAuthenticated),
    );
  }
}

class _LoginView extends StatelessWidget {
  const _LoginView({this.onAuthenticated});

  final VoidCallback? onAuthenticated;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.login)),
      body: BlocConsumer<AuthBloc, AuthState>(
        listenWhen: (prev, curr) => prev.status != curr.status,
        listener: (context, state) {
          if (state.status.isSuccess) {
            onAuthenticated?.call();
          } else if (state.status.isFailure &&
              state.fieldErrors.isEmpty &&
              state.failure != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.failure!.localizedMessage(context))),
            );
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(KpSpacing.l),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    context.l10n.welcome,
                    style: context.textTheme.headlineMedium,
                  ),
                  const Gap.xl(),
                  const LoginForm(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
