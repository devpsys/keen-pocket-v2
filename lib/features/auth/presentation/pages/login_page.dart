import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keenpockets/core/error/failure_localizer.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:keenpockets/features/auth/presentation/bloc/auth_state.dart';
import 'package:keenpockets/features/auth/presentation/widgets/login_form.dart';

/// Login screen. Reads the app-wide [AuthBloc]; on success the router's
/// session guard redirects to the home shell. Shows a snackbar for non-field
/// failures.
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.login)),
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
                Text(
                  context.l10n.welcome,
                  style: context.textTheme.headlineMedium,
                ),
                const Gap.xl(),
                const LoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
