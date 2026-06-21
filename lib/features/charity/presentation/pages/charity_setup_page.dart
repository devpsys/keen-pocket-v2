import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/app/app_nav.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/core/widgets/kp_network_image.dart';
import 'package:keenpockets/features/charity/presentation/widgets/charity_donate_card.dart';
import 'package:keenpockets/features/charity/presentation/widgets/charity_fixtures.dart';
import 'package:keenpockets/features/charity/presentation/widgets/charity_setup_widgets.dart';

/// Create / edit a charity drive (design `charity_setup` / `_tablet`).
/// Presentation-only — "Save Drive" pops `true`.
class CharitySetupPage extends StatefulWidget {
  const CharitySetupPage({super.key});

  @override
  State<CharitySetupPage> createState() => _CharitySetupPageState();
}

class _CharitySetupPageState extends State<CharitySetupPage> {
  final _title = TextEditingController();
  final _description = TextEditingController();
  final _amount = TextEditingController();
  final _items = <CharitySetupItem>[CharitySetupItem()];
  var _goalType = CharityGoalType.amount;
  var _showBreakdown = true;

  @override
  void initState() {
    super.initState();
    _title.addListener(_onChanged);
    _description.addListener(_onChanged);
    _amount.addListener(_onChanged);
  }

  void _onChanged() => setState(() {});

  @override
  void dispose() {
    _title.dispose();
    _description.dispose();
    _amount.dispose();
    for (final item in _items) {
      item.dispose();
    }
    super.dispose();
  }

  void _addItem() => setState(() => _items.add(CharitySetupItem()));

  void _removeItem(int index) {
    setState(() {
      _items.removeAt(index).dispose();
      if (_items.isEmpty) _items.add(CharitySetupItem());
    });
  }

  void _save() => Navigator.of(context).maybePop(true);

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      iconTheme: IconThemeData(color: context.colorScheme.primary),
      shape: Border(
        bottom: BorderSide(
          color: context.colorScheme.surfaceContainerHighest,
          width: 4,
        ),
      ),
      title: Text(
        context.l10n.charitySetupTitle,
        style: context.textTheme.titleLarge?.copyWith(
          color: context.colorScheme.primary,
        ),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: KpSpacing.m),
          child: Center(
            child: KpNetworkAvatar(url: kCharityAvatarUrl, radius: KpSpacing.m),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (context.isExpanded) {
      return AppTabletShell(
        selectedIndex: kPocketsTabIndex,
        body: Scaffold(
          appBar: _appBar(context),
          body: SafeArea(child: _tablet(context)),
        ),
      );
    }
    return Scaffold(
      appBar: _appBar(context),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: _phone(context)),
            _saveBar(context),
          ],
        ),
      ),
    );
  }

  Widget _saveBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        border: Border(
          top: BorderSide(
            color: context.colorScheme.surfaceContainerHighest,
            width: 4,
          ),
        ),
      ),
      child: KpButton(
        label: context.l10n.charitySaveDrive,
        icon: Icons.volunteer_activism_rounded,
        onPressed: _save,
      ),
    );
  }

  Widget _phone(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(KpSpacing.l),
      children: [
        const CharitySetupGreeting(),
        const Gap.l(),
        _formCard(context),
        const Gap.l(),
        const CharityProTip(),
      ],
    );
  }

  Widget _tablet(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(KpSpacing.l),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _formCard(context, tablet: true),
                const Gap.m(),
                const CharitySetupTabletTip(),
              ],
            ),
          ),
          const Gap.m(horizontal: true),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CharityDrivePreview(
                  title: _title.text.isEmpty
                      ? context.l10n.charityPreviewTitleFallback
                      : _title.text,
                  description: _description.text.isEmpty
                      ? context.l10n.charityDescriptionHint
                      : _description.text,
                  target: _amount.text.isEmpty ? '500,000' : _amount.text,
                ),
                const Gap.l(),
                KpButton(
                  label: context.l10n.charityLaunchDrive,
                  icon: Icons.rocket_launch_rounded,
                  onPressed: _save,
                ),
                const Gap.s(),
                KpButton(
                  label: context.l10n.charitySaveDraft,
                  variant: KpButtonVariant.ghost,
                  onPressed: _save,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _formCard(BuildContext context, {bool tablet = false}) {
    return CharityCard(
      bordered: tablet,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (tablet) ...[const CharityCreateDriveHeader(), const Gap.l()],
          CharityFieldLabel(context.l10n.charityDriveTitleLabel),
          CharityOutlinedField(
            controller: _title,
            hint: context.l10n.charityDriveTitleHint,
          ),
          const Gap.m(),
          CharityFieldLabel(context.l10n.charityDescriptionLabel),
          CharityOutlinedField(
            controller: _description,
            hint: context.l10n.charityDescriptionHint,
          ),
          const Gap.l(),
          CharityFieldLabel(context.l10n.charityGoalTypeLabel),
          if (tablet)
            CharityGoalTypeButtons(
              selected: _goalType,
              onChanged: (t) => setState(() => _goalType = t),
            )
          else
            CharityGoalTypeToggle(
              selected: _goalType,
              onChanged: (t) => setState(() => _goalType = t),
            ),
          const Gap.l(),
          if (_goalType == CharityGoalType.amount) ...[
            CharityFieldLabel(context.l10n.charityTargetAmountLabel),
            CharityOutlinedField(
              controller: _amount,
              hint: context.l10n.charityTargetAmountHint,
              keyboardType: TextInputType.number,
              prefix: Text(
                '₦',
                style: context.textTheme.titleLarge?.copyWith(
                  color: context.colorScheme.primary,
                ),
              ),
            ),
          ] else ...[
            for (var i = 0; i < _items.length; i++) ...[
              CharityItemRow(item: _items[i], onRemove: () => _removeItem(i)),
              const Gap.s(),
            ],
            _addItemButton(context),
          ],
          const Gap.l(),
          CharityBreakdownToggle(
            value: _showBreakdown,
            onChanged: (v) => setState(() => _showBreakdown = v),
          ),
        ],
      ),
    );
  }

  Widget _addItemButton(BuildContext context) {
    return KpButton(
      label: context.l10n.charityAddAnotherItem,
      variant: KpButtonVariant.ghost,
      icon: Icons.add_circle_outline_rounded,
      onPressed: _addItem,
    );
  }
}
