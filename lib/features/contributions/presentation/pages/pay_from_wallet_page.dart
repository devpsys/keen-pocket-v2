import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/app/app_nav.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/contributions/presentation/widgets/pay_fixtures.dart';
import 'package:keenpockets/features/contributions/presentation/widgets/pay_widgets.dart';

/// Confirm-payment screen (design `pay_from_wallet` / `_tablet`): settle an
/// invoice from the in-app wallet. Presentation-only — pops `true` on pay.
class PayFromWalletPage extends StatelessWidget {
  const PayFromWalletPage({this.wallet, super.key});

  final PayWalletView? wallet;

  @override
  Widget build(BuildContext context) {
    final w = wallet ?? kPayWallet;
    if (context.isExpanded) {
      return AppTabletShell(
        selectedIndex: kPocketsTabIndex,
        body: Scaffold(body: SafeArea(child: _tablet(context, w))),
      );
    }
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        iconTheme: IconThemeData(color: context.colorScheme.primary),
        shape: Border(
          bottom: BorderSide(
            color: context.colorScheme.surfaceContainerHighest,
            width: 4,
          ),
        ),
        title: Text(
          context.l10n.brandWordmark,
          style: context.textTheme.titleLarge?.copyWith(
            color: context.colorScheme.primary,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              KpIcons.notificationsOutlined,
              color: context.colorScheme.primary,
            ),
          ),
        ],
      ),
      body: SafeArea(child: _phone(context, w)),
    );
  }

  void _pay(BuildContext context) => Navigator.of(context).maybePop(true);

  Widget _heading(BuildContext context) {
    return Row(
      children: [
        Icon(KpIcons.pockets, color: context.colorScheme.primary),
        const Gap.s(horizontal: true),
        Text(
          context.l10n.payPageTitle,
          style: context.textTheme.headlineMedium,
        ),
      ],
    );
  }

  Widget _card(BuildContext context, PayWalletView w) => w.sufficient
      ? PayConfirmCard(wallet: w, onPay: () => _pay(context))
      : PayInsufficientCard(wallet: w, onTopUp: () {});

  Widget _phone(BuildContext context, PayWalletView w) {
    return ListView(
      padding: const EdgeInsets.all(KpSpacing.l),
      children: [
        _heading(context),
        const Gap.l(),
        _card(context, w),
        const Gap.l(),
        const PaySafeSecureCard(),
        const Gap.l(),
        PayMonthlyLimit(wallet: w),
      ],
    );
  }

  Widget _tablet(BuildContext context, PayWalletView w) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(KpSpacing.xl),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _heading(context),
              const Gap.xl(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 6,
                    child: PayConfirmCard(
                      wallet: w,
                      showTip: false,
                      payLabel: context.l10n.payConfirmSecurely,
                      onPay: () => _pay(context),
                    ),
                  ),
                  const Gap.l(horizontal: true),
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const PayGreatJobCard(),
                        const Gap.l(),
                        Container(
                          padding: const EdgeInsets.all(KpSpacing.l),
                          decoration: BoxDecoration(
                            color: context.colorScheme.surfaceContainerLowest,
                            borderRadius: KpRadii.allXl,
                            border: Border.all(
                              color:
                                  context.colorScheme.surfaceContainerHighest,
                              width: 2,
                            ),
                          ),
                          child: PayMonthlyLimit(wallet: w),
                        ),
                        const Gap.l(),
                        const PaySafeSecureCard(),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
