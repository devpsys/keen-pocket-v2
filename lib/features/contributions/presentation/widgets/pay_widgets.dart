import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/contributions/presentation/widgets/pay_fixtures.dart';

/// White candy card (7px flat bottom border) used across the pay screen.
class _PayCard extends StatelessWidget {
  const _PayCard({required this.child, this.border});

  final Widget child;
  final Color? border;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLowest,
        borderRadius: KpRadii.allXl,
        border: Border(
          bottom: BorderSide(
            color: border ?? context.colorScheme.surfaceContainerHighest,
            width: 7,
          ),
        ),
      ),
      child: child,
    );
  }
}

/// Confirm-payment card: balances, the highlighted invoice amount, an optional
/// Mr K tip, and the pay CTA (design `pay_from_wallet`).
class PayConfirmCard extends StatelessWidget {
  const PayConfirmCard({
    required this.wallet,
    required this.onPay,
    this.showTip = true,
    this.payLabel,
    super.key,
  });

  final PayWalletView wallet;
  final VoidCallback onPay;
  final bool showTip;
  final String? payLabel;

  @override
  Widget build(BuildContext context) {
    return _PayCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Row(
            label: context.l10n.payWalletBalance.toUpperCase(),
            value: wallet.walletBalance.format(),
          ),
          const Gap.m(),
          Container(
            padding: const EdgeInsets.all(KpSpacing.m),
            decoration: BoxDecoration(
              color: context.colorScheme.primaryContainer.withValues(
                alpha: 0.12,
              ),
              borderRadius: KpRadii.allL,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.receipt_long_rounded,
                      size: KpSpacing.l,
                      color: context.colorScheme.primary,
                    ),
                    const Gap.s(horizontal: true),
                    Text(
                      context.l10n.payInvoiceAmount,
                      style: context.textTheme.bodyLarge,
                    ),
                  ],
                ),
                Text(
                  wallet.invoiceAmount.format(),
                  style: context.textTheme.titleMedium?.copyWith(
                    color: context.colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
          const Gap.m(),
          const _DashedLine(),
          const Gap.m(),
          _Row(
            label: context.l10n.payNewBalance.toUpperCase(),
            value: wallet.newBalance.format(),
            muted: true,
          ),
          if (showTip) ...[const Gap.l(), _MrKTip()],
          const Gap.l(),
          KpButton(
            label:
                payLabel ??
                context.l10n.payFromWallet(wallet.invoiceAmount.format()),
            icon: Icons.arrow_forward_rounded,
            onPressed: onPay,
          ),
        ],
      ),
    );
  }
}

class _MrKTip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLow,
        borderRadius: KpRadii.allL,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const KpMascot.celebrate(size: 40),
          const Gap.s(horizontal: true),
          Expanded(
            child: Text.rich(
              TextSpan(
                style: context.textTheme.bodyMedium?.copyWith(
                  fontStyle: FontStyle.italic,
                  color: context.colorScheme.onSurfaceVariant,
                ),
                children: [
                  TextSpan(text: '"${context.l10n.payTip}" — '),
                  TextSpan(
                    text: context.l10n.mascotName,
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w800,
                      color: context.colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Insufficient-balance card (design `pay_from_wallet`).
class PayInsufficientCard extends StatelessWidget {
  const PayInsufficientCard({
    required this.wallet,
    required this.onTopUp,
    super.key,
  });

  final PayWalletView wallet;
  final VoidCallback onTopUp;

  @override
  Widget build(BuildContext context) {
    return _PayCard(
      border: context.colorScheme.error,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n.payInsufficientTitle,
                style: context.textTheme.headlineSmall?.copyWith(
                  color: context.colorScheme.error,
                ),
              ),
              Icon(
                Icons.warning_amber_rounded,
                color: context.colorScheme.error,
              ),
            ],
          ),
          const Gap.m(),
          _Row(
            label: context.l10n.payWalletBalance,
            value: wallet.walletBalance.format(),
          ),
          const Gap.s(),
          _Row(
            label: context.l10n.payRequiredAmount,
            value: wallet.invoiceAmount.format(),
            danger: true,
          ),
          const Gap.m(),
          Container(
            padding: const EdgeInsets.all(KpSpacing.s),
            decoration: BoxDecoration(
              color: context.colorScheme.errorContainer.withValues(alpha: 0.4),
              borderRadius: KpRadii.allM,
            ),
            child: Text(
              context.l10n.payShortfall(wallet.shortfall.format()),
              style: context.textTheme.bodySmall?.copyWith(
                color: context.colorScheme.error,
              ),
            ),
          ),
          const Gap.l(),
          KpButton(
            label: context.l10n.payTopUp,
            variant: KpButtonVariant.secondary,
            icon: Icons.add_circle_outline_rounded,
            onPressed: onTopUp,
          ),
        ],
      ),
    );
  }
}

/// "Safe & Secure" reassurance card.
class PaySafeSecureCard extends StatelessWidget {
  const PaySafeSecureCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainer,
        borderRadius: KpRadii.allXl,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.info_outline_rounded,
                size: KpSpacing.l,
                color: context.colorScheme.onSurfaceVariant,
              ),
              const Gap.s(horizontal: true),
              Text(
                context.l10n.paySafeTitle.toUpperCase(),
                style: context.textTheme.labelLarge?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          const Gap.s(),
          Text(
            context.l10n.paySecure,
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w400,
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

/// Monthly spending-limit progress.
class PayMonthlyLimit extends StatelessWidget {
  const PayMonthlyLimit({required this.wallet, super.key});

  final PayWalletView wallet;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.l10n.payMonthlyLimit,
              style: context.textTheme.titleSmall?.copyWith(
                color: context.colorScheme.primary,
              ),
            ),
            Text(
              context.l10n.payLimitUsage(
                wallet.monthlySpent.format(),
                wallet.monthlyLimit.format(),
              ),
              style: context.textTheme.labelMedium?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
        const Gap.s(),
        KpProgressBar(value: wallet.limitProgress, height: 12),
      ],
    );
  }
}

/// Tablet "Great Job!" budget tip (gold).
class PayGreatJobCard extends StatelessWidget {
  const PayGreatJobCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: const BoxDecoration(
        color: KpColors.gold100,
        borderRadius: KpRadii.allXl,
        border: Border(bottom: BorderSide(color: KpColors.gold600, width: 7)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const KpMascot.celebrate(size: 44),
          const Gap.s(horizontal: true),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.payTabletTipTitle,
                  style: context.textTheme.titleLarge,
                ),
                const Gap.xxs(),
                Text(
                  context.l10n.payTabletTipBody,
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: context.colorScheme.onSurface,
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

class _Row extends StatelessWidget {
  const _Row({
    required this.label,
    required this.value,
    this.muted = false,
    this.danger = false,
  });

  final String label;
  final String value;
  final bool muted;
  final bool danger;

  @override
  Widget build(BuildContext context) {
    final valueColor = danger ? context.colorScheme.error : null;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: context.textTheme.labelMedium?.copyWith(
            color: danger
                ? context.colorScheme.error
                : context.colorScheme.onSurfaceVariant,
            letterSpacing: 0.5,
          ),
        ),
        Text(
          value,
          style: context.textTheme.titleMedium?.copyWith(
            color: muted ? context.colorScheme.onSurfaceVariant : valueColor,
          ),
        ),
      ],
    );
  }
}

/// A thin dashed horizontal rule.
class _DashedLine extends StatelessWidget {
  const _DashedLine();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: KpSpacing.xxs,
      child: CustomPaint(
        size: Size.infinite,
        painter: _DashPainter(context.colorScheme.surfaceContainerHighest),
      ),
    );
  }
}

class _DashPainter extends CustomPainter {
  const _DashPainter(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.5;
    const dash = 6.0;
    const gap = 4.0;
    final y = size.height / 2;
    var x = 0.0;
    while (x < size.width) {
      canvas.drawLine(Offset(x, y), Offset(x + dash, y), paint);
      x += dash + gap;
    }
  }

  @override
  bool shouldRepaint(_DashPainter old) => old.color != color;
}
