import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/app/app_nav.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/core/widgets/kp_network_image.dart';
import 'package:keenpockets/features/contributions/domain/value_objects/contribution_context.dart';
import 'package:keenpockets/features/contributions/presentation/pages/allocate_months_page.dart';
import 'package:keenpockets/features/contributions/presentation/widgets/contribute_fixtures.dart';
import 'package:keenpockets/features/contributions/presentation/widgets/contribute_widgets.dart';

/// Contribute screen (design `contribute_amount` / `_tablet`): target goal,
/// amount entry with quick-adds, a charity toggle. "Continue" advances to the
/// allocate-months step which performs the submit. Presentation-only.
class ContributePage extends StatefulWidget {
  const ContributePage({required this.context, super.key});

  final ContributionContext context;

  @override
  State<ContributePage> createState() => _ContributePageState();
}

class _ContributePageState extends State<ContributePage> {
  final _controller = TextEditingController();
  final _target = kContributeTarget;
  bool _charity = false;
  bool _showAmountError = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  num get _amount =>
      num.tryParse(_controller.text.replaceAll(',', '').trim()) ?? 0;

  void _addQuick(int naira) {
    final text = groupAmountText('${_amount + naira}');
    setState(() {
      _controller.value = TextEditingValue(
        text: text,
        selection: TextSelection.collapsed(offset: text.length),
      );
    });
  }

  Future<void> _continue(BuildContext context) async {
    final naira = _amount;
    if (naira <= 0) {
      setState(() => _showAmountError = true);
      return;
    }
    setState(() => _showAmountError = false);
    final done = await Navigator.of(context).push<bool>(
      MaterialPageRoute(
        builder: (_) => AllocateMonthsPage(
          context: widget.context,
          amount: Money.naira(naira),
        ),
      ),
    );
    if ((done ?? false) && context.mounted) Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    if (context.isExpanded) {
      return AppTabletShell(
        selectedIndex: kPocketsTabIndex,
        body: Scaffold(body: SafeArea(child: _tablet(context))),
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
          context.l10n.contributeToPocket,
          style: context.textTheme.titleLarge?.copyWith(
            color: context.colorScheme.primary,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: KpSpacing.m),
            child: Container(
              width: KpSpacing.xl,
              height: KpSpacing.xl,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: context.colorScheme.primaryContainer,
                  width: 2,
                ),
              ),
              child: const KpNetworkAvatar(
                url: kContributeAvatarUrl,
                radius: 14,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(child: _phone(context)),
    );
  }

  Widget _amountError(BuildContext context) {
    if (!_showAmountError) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(top: KpSpacing.s),
      child: Text(
        context.l10n.contributeAmountInvalid,
        textAlign: TextAlign.center,
        style: context.textTheme.bodySmall?.copyWith(
          color: context.colorScheme.error,
        ),
      ),
    );
  }

  Widget _phone(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(KpSpacing.l),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ContributeGoalCard(target: _target),
          const Gap.xl(),
          Text(
            context.l10n.contributeEnterAmount.toUpperCase(),
            textAlign: TextAlign.center,
            style: context.textTheme.labelLarge?.copyWith(
              color: context.colorScheme.primary,
              letterSpacing: 0.5,
            ),
          ),
          const Gap.s(),
          ContributeAmountField(controller: _controller, onQuickAdd: _addQuick),
          _amountError(context),
          const Gap.xl(),
          const ContributeTip(),
          const Gap.l(),
          ContributeCharityToggle(
            value: _charity,
            onChanged: (v) => setState(() => _charity = v),
            target: _target,
          ),
          const Gap.xl(),
          KpButton(
            label: context.l10n.contributeContinue,
            onPressed: () => _continue(context),
          ),
          const Gap.m(),
          Text(
            context.l10n.contributeSecureFooter.toUpperCase(),
            textAlign: TextAlign.center,
            style: context.textTheme.labelSmall?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _tablet(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(KpSpacing.xl),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ContributeGoalCardTablet(target: _target),
                    const Gap.l(),
                    const ContributeTip(),
                  ],
                ),
              ),
              const Gap.l(horizontal: true),
              Expanded(
                flex: 7,
                child: Container(
                  padding: const EdgeInsets.all(KpSpacing.l),
                  decoration: BoxDecoration(
                    color: context.colorScheme.surfaceContainerLowest,
                    borderRadius: KpRadii.allXl,
                    border: Border(
                      bottom: BorderSide(
                        color: context.colorScheme.surfaceContainerHighest,
                        width: 7,
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: Text(
                          context.l10n.contributeEnterContribution,
                          style: context.textTheme.headlineSmall,
                        ),
                      ),
                      const Gap.xxs(),
                      Center(
                        child: Text(
                          context.l10n.contributeEnterSubtitle,
                          textAlign: TextAlign.center,
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: context.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                      const Gap.l(),
                      ContributeAmountField(
                        controller: _controller,
                        onQuickAdd: _addQuick,
                      ),
                      _amountError(context),
                      const Gap.l(),
                      ContributeCharityToggle(
                        value: _charity,
                        onChanged: (v) => setState(() => _charity = v),
                        target: _target,
                        showSubtitle: true,
                      ),
                      const Gap.l(),
                      KpButton(
                        label: context.l10n.contributeConfirm,
                        icon: Icons.arrow_forward_rounded,
                        onPressed: () => _continue(context),
                      ),
                      const Gap.s(),
                      Center(
                        child: Text(
                          context.l10n.contributeFundsDebited,
                          style: context.textTheme.bodySmall?.copyWith(
                            color: context.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
