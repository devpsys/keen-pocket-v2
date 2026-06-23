import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';

/// Identity types a member can verify with.
enum KycIdType { bvn, nin }

/// Verification states (design `kyc_verification`).
enum KycStatus { pending, verified, failed }

/// Mr K welcome card atop the KYC flow (design `kyc_verification`).
class KycWelcomeCard extends StatelessWidget {
  const KycWelcomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainer,
        borderRadius: KpRadii.allXl,
        border: Border(
          bottom: BorderSide(
            color: context.colorScheme.surfaceContainerHighest,
            width: 4,
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 72,
            height: 72,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: KpColors.gold500,
              shape: BoxShape.circle,
            ),
            child: const KpMascot.celebrate(size: 56),
          ),
          const Gap.m(horizontal: true),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.kycTitle,
                  style: context.textTheme.titleLarge,
                ),
                const Gap.xxs(),
                Text(
                  context.l10n.kycWelcomeBody,
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Verification-status banner (design `kyc_verification`).
class KycStatusBanner extends StatelessWidget {
  const KycStatusBanner({required this.status, this.onRetry, super.key});

  final KycStatus status;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    final (bg, border, fg, icon, title, body) = switch (status) {
      KycStatus.pending => (
        KpColors.gold500.withValues(alpha: 0.2),
        KpColors.gold500,
        KpColors.gold600,
        Icons.hourglass_top_rounded,
        context.l10n.kycPendingTitle,
        context.l10n.kycPendingBody,
      ),
      KycStatus.verified => (
        context.colors.successContainer,
        context.colors.success,
        context.colors.success,
        Icons.check_circle_rounded,
        context.l10n.kycVerifiedTitle,
        null,
      ),
      KycStatus.failed => (
        context.colorScheme.errorContainer,
        context.colorScheme.error,
        context.colorScheme.onErrorContainer,
        Icons.error_rounded,
        context.l10n.kycFailedTitle,
        null,
      ),
    };
    return Container(
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: KpRadii.allL,
        border: Border.all(color: border, width: 2),
        boxShadow: [BoxShadow(color: border, offset: const Offset(0, 4))],
      ),
      child: Row(
        children: [
          Icon(icon, color: fg),
          const Gap.s(horizontal: true),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.textTheme.labelLarge?.copyWith(color: fg),
                ),
                if (body != null)
                  Text(
                    body,
                    style: context.textTheme.bodySmall?.copyWith(
                      color: fg.withValues(alpha: 0.8),
                    ),
                  ),
              ],
            ),
          ),
          if (status == KycStatus.failed) ...[
            const Gap.s(horizontal: true),
            KpButton(
              label: context.l10n.kycRetry,
              variant: KpButtonVariant.error,
              dense: true,
              onPressed: onRetry ?? () {},
            ),
          ],
        ],
      ),
    );
  }
}

/// Segmented BVN / NIN control (phone — design `kyc_verification`).
class KycIdSegmented extends StatelessWidget {
  const KycIdSegmented({
    required this.selected,
    required this.onChanged,
    super.key,
  });

  final KycIdType selected;
  final ValueChanged<KycIdType> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.xxs),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainer,
        borderRadius: KpRadii.allL,
      ),
      child: Row(
        children: [
          _segment(context, KycIdType.bvn, 'BVN'),
          const Gap.xxs(horizontal: true),
          _segment(context, KycIdType.nin, 'NIN'),
        ],
      ),
    );
  }

  Widget _segment(BuildContext context, KycIdType type, String label) {
    final active = type == selected;
    return Expanded(
      child: GestureDetector(
        onTap: () => onChanged(type),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: KpSpacing.s),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: active
                ? context.colorScheme.surfaceContainerLowest
                : KpColors.transparent,
            borderRadius: KpRadii.allM,
          ),
          child: Text(
            label,
            style: context.textTheme.labelLarge?.copyWith(
              color: active
                  ? context.colorScheme.primary
                  : context.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ),
    );
  }
}

/// BVN / NIN chooser as two bordered icon cards (tablet — design `_tablet`).
class KycIdTypeCards extends StatelessWidget {
  const KycIdTypeCards({
    required this.selected,
    required this.onChanged,
    super.key,
  });

  final KycIdType selected;
  final ValueChanged<KycIdType> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _card(
            context,
            type: KycIdType.bvn,
            icon: Icons.badge_rounded,
            label: 'BVN',
          ),
        ),
        const Gap.m(horizontal: true),
        Expanded(
          child: _card(
            context,
            type: KycIdType.nin,
            icon: Icons.fingerprint_rounded,
            label: 'NIN',
          ),
        ),
      ],
    );
  }

  Widget _card(
    BuildContext context, {
    required KycIdType type,
    required IconData icon,
    required String label,
  }) {
    final active = type == selected;
    final tint = active
        ? context.colorScheme.primary
        : context.colorScheme.onSurfaceVariant;
    return GestureDetector(
      onTap: () => onChanged(type),
      child: Container(
        padding: const EdgeInsets.all(KpSpacing.l),
        decoration: BoxDecoration(
          color: context.colorScheme.surfaceContainerLowest,
          borderRadius: KpRadii.allL,
          border: Border.all(
            color: active
                ? context.colorScheme.primary
                : context.colorScheme.outlineVariant,
            width: 2,
          ),
        ),
        child: Column(
          children: [
            Icon(icon, size: KpSpacing.xl, color: tint),
            const Gap.s(),
            Text(
              label,
              style: context.textTheme.labelLarge?.copyWith(color: tint),
            ),
          ],
        ),
      ),
    );
  }
}

/// Recessed ID-number input with a trailing icon + char counter.
class KycNumberField extends StatelessWidget {
  const KycNumberField({
    required this.controller,
    required this.hint,
    this.trailingIcon,
    this.counter,
    super.key,
  });

  final TextEditingController controller;
  final String hint;
  final IconData? trailingIcon;
  final String? counter;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: KpSpacing.m),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLow,
        borderRadius: KpRadii.allL,
        border: Border.all(color: context.colorScheme.outlineVariant, width: 2),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              maxLength: 11,
              style: context.textTheme.bodyLarge,
              decoration: InputDecoration(
                counterText: '',
                filled: false,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: KpSpacing.m,
                ),
                hintText: hint,
                hintStyle: context.textTheme.bodyLarge?.copyWith(
                  color: context.colorScheme.outline,
                ),
              ),
            ),
          ),
          if (counter != null)
            Text(
              counter!,
              style: context.textTheme.labelLarge?.copyWith(
                color: context.colorScheme.outline,
              ),
            )
          else if (trailingIcon != null)
            Icon(trailingIcon, color: context.colorScheme.outline),
        ],
      ),
    );
  }
}
