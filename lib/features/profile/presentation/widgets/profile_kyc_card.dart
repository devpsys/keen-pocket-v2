import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';

/// Error-tinted KYC identity-check prompt with a Verify action (my-profile).
class ProfileKycCheckCard extends StatelessWidget {
  const ProfileKycCheckCard({this.onVerify, super.key});

  static const double _verifyWidth = 76;
  static const double _iconBox = 40;

  final VoidCallback? onVerify;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: BoxDecoration(
        color: context.colorScheme.errorContainer,
        borderRadius: KpRadii.allXl,
        border: Border(
          bottom: BorderSide(color: context.colorScheme.error, width: 7),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: _iconBox,
            height: _iconBox,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: context.colorScheme.error,
              borderRadius: KpRadii.allM,
            ),
            child: Icon(
              Icons.verified_user_rounded,
              color: context.colorScheme.onError,
            ),
          ),
          const Gap.s(horizontal: true),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.profileKycCheckTitle,
                  style: context.textTheme.titleSmall,
                ),
                Text(
                  context.l10n.profileKycCheckBody,
                  style: context.textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          const Gap.s(horizontal: true),
          SizedBox(
            width: _verifyWidth,
            height: _iconBox,
            child: KpButton(
              label: context.l10n.profileVerify,
              variant: KpButtonVariant.error,
              onPressed: onVerify ?? () {},
            ),
          ),
        ],
      ),
    );
  }
}
