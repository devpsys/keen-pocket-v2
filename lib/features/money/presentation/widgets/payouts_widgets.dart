import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/money/presentation/cubit/payouts_state.dart';
import 'package:keenpockets/features/money/presentation/payouts_fixtures.dart';
import 'package:keenpockets/features/money/presentation/view_models/payout_view.dart';
import 'package:keenpockets/features/money/presentation/widgets/bank_accounts_list.dart';

/// Pill colours + label for a payout status (shared phone + tablet).
({Color bg, Color fg, String label}) payoutStatusStyle(
  BuildContext context,
  PayoutStatus status,
) {
  return switch (status) {
    PayoutStatus.success => (
      bg: context.colors.successContainer,
      fg: context.colors.success,
      label: context.l10n.payoutsStatusSuccess,
    ),
    PayoutStatus.pending => (
      bg: context.colors.warningContainer,
      fg: context.colors.warning,
      label: context.l10n.payoutsStatusPending,
    ),
    PayoutStatus.failed => (
      bg: context.colorScheme.errorContainer,
      fg: context.colorScheme.error,
      label: context.l10n.payoutsStatusFailed,
    ),
  };
}

/// Icon for a payout status (tablet rows show a tinted status icon).
IconData payoutStatusIcon(PayoutStatus status) => switch (status) {
  PayoutStatus.success => Icons.check_circle_rounded,
  PayoutStatus.pending => Icons.pending_rounded,
  PayoutStatus.failed => Icons.error_rounded,
};

/// White "candy" card: 2px outline + a flat 7px bottom shadow (design
/// `payouts_bank_hub`).
BoxDecoration payoutCard(BuildContext context) {
  return BoxDecoration(
    color: context.colorScheme.surface,
    borderRadius: KpRadii.allXl,
    border: Border.all(
      color: context.colorScheme.surfaceContainerHighest,
      width: 2,
    ),
    boxShadow: [
      BoxShadow(
        color: context.colorScheme.surfaceContainerHighest,
        offset: const Offset(0, 7),
      ),
    ],
  );
}

class PayoutSectionHeader extends StatelessWidget {
  const PayoutSectionHeader({
    required this.icon,
    required this.label,
    super.key,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: context.colorScheme.primary),
        const Gap.s(horizontal: true),
        Expanded(
          child: Text(
            label,
            style: context.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    );
  }
}

/// Phone payouts & bank hub (design `payouts_bank_hub`).
class PayoutsPhoneView extends StatelessWidget {
  const PayoutsPhoneView({required this.state, this.onEdit, super.key});

  final PayoutsState state;
  final ValueChanged<String>? onEdit;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(
        KpSpacing.m,
        KpSpacing.l,
        KpSpacing.m,
        KpSpacing.xxl,
      ),
      children: [
        PayoutSectionHeader(
          icon: Icons.account_balance_rounded,
          label: context.l10n.payoutsMyAccount,
        ),
        const Gap.m(),
        const PayoutAccountForm(),
        const Gap.xl(),
        PayoutSectionHeader(
          icon: Icons.savings_rounded,
          label: context.l10n.payoutsCollectionDetails,
        ),
        const Gap.m(),
        BankAccountsList(accounts: state.collections, onEdit: onEdit),
        const Gap.xl(),
        PayoutSectionHeader(
          icon: Icons.history_rounded,
          label: context.l10n.payoutsReceived,
        ),
        const Gap.m(),
        PayoutsReceivedCard(payouts: state.payouts),
      ],
    );
  }
}

/// Bank-name + bank-code + account-number form (design `payouts_bank_hub`).
class PayoutAccountForm extends StatefulWidget {
  const PayoutAccountForm({super.key});

  @override
  State<PayoutAccountForm> createState() => _PayoutAccountFormState();
}

class _PayoutAccountFormState extends State<PayoutAccountForm> {
  final _bankCode = TextEditingController();
  final _account = TextEditingController();

  @override
  void dispose() {
    _bankCode.dispose();
    _account.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: payoutCard(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _FieldLabel(context.l10n.payoutsBankName),
          const Gap.xs(),
          const BankDropdown(),
          const Gap.m(),
          _FieldLabel(context.l10n.payoutsBankCode),
          const Gap.xs(),
          TextField(
            controller: _bankCode,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: context.l10n.payoutsBankCodeHint,
            ),
          ),
          const Gap.m(),
          _FieldLabel(context.l10n.payoutsAccountNumber),
          const Gap.xs(),
          TextField(
            controller: _account,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: context.l10n.payoutsNubanHint,
            ),
          ),
          const Gap.l(),
          KpButton(label: context.l10n.payoutsSaveAccount, onPressed: () {}),
        ],
      ),
    );
  }
}

class _FieldLabel extends StatelessWidget {
  const _FieldLabel(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.textTheme.labelLarge?.copyWith(
        color: context.colorScheme.onSurfaceVariant,
        fontWeight: FontWeight.w800,
      ),
    );
  }
}

/// Receiving-bank dropdown (design `payouts_bank_hub`).
class BankDropdown extends StatefulWidget {
  const BankDropdown({this.hint, super.key});

  final String? hint;

  @override
  State<BankDropdown> createState() => _BankDropdownState();
}

class _BankDropdownState extends State<BankDropdown> {
  String? _selected;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      initialValue: _selected,
      isExpanded: true,
      decoration: InputDecoration(
        hintText: widget.hint ?? context.l10n.payoutsSelectBank,
      ),
      items: [
        for (final bank in kPayoutBanks)
          DropdownMenuItem<String>(value: bank, child: Text(bank)),
      ],
      onChanged: (v) => setState(() => _selected = v),
    );
  }
}

class PayoutsReceivedCard extends StatelessWidget {
  const PayoutsReceivedCard({required this.payouts, this.onViewAll, super.key});

  final List<PayoutView> payouts;
  final VoidCallback? onViewAll;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: payoutCard(context),
      child: Column(
        children: [
          for (var i = 0; i < payouts.length; i++) ...[
            if (i != 0) const Divider(height: 1),
            PayoutRow(payout: payouts[i]),
          ],
          const Divider(height: 1),
          ColoredBox(
            color: context.colorScheme.surfaceContainer,
            child: SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: onViewAll,
                child: Text(context.l10n.payoutsViewAllHistory),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// A "Payouts received" row (design `payouts_bank_hub`).
class PayoutRow extends StatelessWidget {
  const PayoutRow({required this.payout, super.key});

  final PayoutView payout;

  @override
  Widget build(BuildContext context) {
    final s = payoutStatusStyle(context, payout.status);
    return Padding(
      padding: const EdgeInsets.all(KpSpacing.m),
      child: Row(
        children: [
          Container(
            width: KpSpacing.xl,
            height: KpSpacing.xl,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: context.colorScheme.primaryContainer.withValues(
                alpha: 0.2,
              ),
              borderRadius: KpRadii.allM,
            ),
            child: Icon(
              Icons.receipt_long_rounded,
              color: context.colorScheme.primary,
            ),
          ),
          const Gap.m(horizontal: true),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.payoutsRef(payout.reference),
                  style: context.textTheme.labelSmall?.copyWith(
                    color: context.colorScheme.outline,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const Gap.xxs(),
                Text(
                  payout.amount.format(),
                  style: context.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const Gap.s(horizontal: true),
          PayoutStatusPill(status: payout.status, label: s.label),
        ],
      ),
    );
  }
}

class PayoutStatusPill extends StatelessWidget {
  const PayoutStatusPill({
    required this.status,
    required this.label,
    super.key,
  });

  final PayoutStatus status;
  final String label;

  @override
  Widget build(BuildContext context) {
    final s = payoutStatusStyle(context, status);
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.s,
        vertical: KpSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: s.bg,
        borderRadius: const BorderRadius.all(Radius.circular(KpRadii.pill)),
      ),
      child: Text(
        label.toUpperCase(),
        style: context.textTheme.labelSmall?.copyWith(
          color: s.fg,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
