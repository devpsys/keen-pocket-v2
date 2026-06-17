import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/auth/presentation/widgets/auth_chrome.dart';

/// Registration form (design phase B — `register_updated_mascot`).
/// Presentation-only: collects details and calls [onSubmitted] when the terms
/// are accepted; [onLogin] routes back to login.
class RegisterPage extends StatefulWidget {
  const RegisterPage({this.onLogin, this.onSubmitted, super.key});

  final VoidCallback? onLogin;
  final VoidCallback? onSubmitted;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _phone = TextEditingController();
  final _password = TextEditingController();
  final _confirm = TextEditingController();
  bool _agreed = false;

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _phone.dispose();
    _password.dispose();
    _confirm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AuthAppBar(onBack: widget.onLogin),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(KpSpacing.l),
          children: [
            KpCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Center(child: KpMascot(size: 72)),
                  const Gap.s(),
                  Text(
                    context.l10n.registerTitle,
                    style: context.textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  const Gap.xxs(),
                  Text(
                    context.l10n.registerSubtitle,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: context.colorScheme.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Gap.m(),
                  KpTextField(
                    label: context.l10n.registerFullName,
                    controller: _name,
                    textInputAction: TextInputAction.next,
                  ),
                  const Gap.m(),
                  KpTextField(
                    label: context.l10n.emailLabel,
                    controller: _email,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                  ),
                  const Gap.m(),
                  KpTextField(
                    label: context.l10n.registerPhone,
                    controller: _phone,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                  ),
                  const Gap.m(),
                  KpTextField(
                    label: context.l10n.passwordLabel,
                    controller: _password,
                    obscureText: true,
                    textInputAction: TextInputAction.next,
                  ),
                  const Gap.m(),
                  KpTextField(
                    label: context.l10n.registerConfirmPassword,
                    controller: _confirm,
                    obscureText: true,
                    textInputAction: TextInputAction.done,
                  ),
                  const Gap.s(),
                  Row(
                    children: [
                      Checkbox(
                        value: _agreed,
                        onChanged: (v) => setState(() => _agreed = v ?? false),
                      ),
                      Expanded(
                        child: Text(
                          context.l10n.registerAgree,
                          style: context.textTheme.bodySmall,
                        ),
                      ),
                    ],
                  ),
                  const Gap.s(),
                  KpButton(
                    label: context.l10n.registerSubmit,
                    caps: true,
                    onPressed: _agreed ? widget.onSubmitted : null,
                  ),
                ],
              ),
            ),
            const Gap.m(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  context.l10n.registerHaveAccount,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
                TextButton(
                  onPressed: widget.onLogin,
                  child: Text(context.l10n.login),
                ),
              ],
            ),
            const Gap.l(),
            const AuthFooter(),
          ],
        ),
      ),
    );
  }
}
