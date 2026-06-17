import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/auth/presentation/widgets/auth_chrome.dart';

/// OTP verification (design phase B — `otp_verification`). Gated by
/// `OTP_ENABLED`; the live default reset flow uses email. Presentation-only.
class OtpVerificationPage extends StatelessWidget {
  const OtpVerificationPage({
    required this.destination,
    this.onVerified,
    this.onBack,
    super.key,
  });

  /// Masked destination the code was sent to, e.g. "+1 (555) ••• ••89".
  final String destination;

  final VoidCallback? onVerified;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AuthAppBar(onBack: onBack),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(KpSpacing.l),
          children: [
            Container(
              padding: const EdgeInsets.all(KpSpacing.m),
              decoration: BoxDecoration(
                color: context.colorScheme.errorContainer,
                borderRadius: KpRadii.allL,
                border: Border(
                  bottom: BorderSide(
                    color: context.colorScheme.error,
                    width: 4,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.warning_amber_rounded,
                    color: context.colorScheme.error,
                  ),
                  const Gap.s(horizontal: true),
                  Expanded(
                    child: Text(
                      context.l10n.otpMaintenance,
                      style: context.textTheme.bodySmall?.copyWith(
                        color: context.colorScheme.error,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Gap.xl(),
            Center(
              child: CircleAvatar(
                radius: KpSpacing.xl,
                backgroundColor: context.colorScheme.primary,
                child: Icon(
                  Icons.lock_rounded,
                  color: context.colorScheme.onPrimary,
                ),
              ),
            ),
            const Gap.l(),
            Text(
              context.l10n.otpTitle,
              style: context.textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const Gap.xs(),
            Text(
              context.l10n.otpSubtitle,
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            const Gap.xxs(),
            Text(
              destination,
              style: context.textTheme.titleMedium?.copyWith(
                color: context.colorScheme.primary,
              ),
              textAlign: TextAlign.center,
            ),
            const Gap.l(),
            const _CodeBoxes(),
            const Gap.m(),
            Center(
              child: TextButton(
                onPressed: () {},
                child: Text(context.l10n.otpResend),
              ),
            ),
            const Gap.s(),
            KpButton(
              label: context.l10n.otpVerify,
              caps: true,
              onPressed: onVerified ?? () {},
            ),
            const Gap.s(),
            Center(
              child: TextButton(
                onPressed: () {},
                child: Text(context.l10n.otpTryAnother),
              ),
            ),
            const Gap.l(),
            const AuthFooter(),
          ],
        ),
      ),
    );
  }
}

class _CodeBoxes extends StatelessWidget {
  const _CodeBoxes();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (var i = 0; i < 6; i++)
          const Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: KpSpacing.xxs),
              child: TextField(
                textAlign: TextAlign.center,
                maxLength: 1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(counterText: ''),
              ),
            ),
          ),
      ],
    );
  }
}
