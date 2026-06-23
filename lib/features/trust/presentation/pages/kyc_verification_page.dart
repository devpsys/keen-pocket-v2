import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/app/app_nav.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/core/widgets/kp_network_image.dart';
import 'package:keenpockets/features/trust/presentation/widgets/kyc_widgets.dart';
import 'package:keenpockets/features/trust/presentation/widgets/trust_fixtures.dart';

/// KYC identity verification (design `kyc_verification` / `_tablet`):
/// pick an ID type, enter the number and verify. Presentation-only.
class KycVerificationPage extends StatefulWidget {
  const KycVerificationPage({this.status = KycStatus.pending, super.key});

  final KycStatus status;

  @override
  State<KycVerificationPage> createState() => _KycVerificationPageState();
}

class _KycVerificationPageState extends State<KycVerificationPage> {
  final _id = TextEditingController();
  var _type = KycIdType.bvn;

  @override
  void initState() {
    super.initState();
    _id.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _id.dispose();
    super.dispose();
  }

  void _verify() => Navigator.of(context).maybePop(true);

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
        const Padding(
          padding: EdgeInsets.only(right: KpSpacing.m),
          child: Center(
            child: KpNetworkAvatar(url: kTrustAvatarUrl, radius: KpSpacing.m),
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
        body: Scaffold(body: SafeArea(child: _tablet(context))),
      );
    }
    return Scaffold(
      appBar: _appBar(context),
      body: SafeArea(child: _phone(context)),
    );
  }

  Widget _phone(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(KpSpacing.l),
      children: [
        const KycWelcomeCard(),
        const Gap.l(),
        KycStatusBanner(status: widget.status, onRetry: () {}),
        const Gap.l(),
        _formCard(context),
        const Gap.l(),
        Text(
          context.l10n.kycPrivacy,
          textAlign: TextAlign.center,
          style: context.textTheme.bodySmall?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _formCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLowest,
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
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            context.l10n.kycSelectIdType,
            style: context.textTheme.titleMedium,
          ),
          const Gap.l(),
          KycIdSegmented(
            selected: _type,
            onChanged: (t) => setState(() => _type = t),
          ),
          const Gap.l(),
          Text(context.l10n.kycIdNumber, style: context.textTheme.labelLarge),
          const Gap.xs(),
          KycNumberField(
            controller: _id,
            hint: context.l10n.kycEnterDigits,
            trailingIcon: Icons.pin_rounded,
          ),
          const Gap.s(),
          Row(
            children: [
              Icon(
                Icons.lock_rounded,
                size: KpSpacing.m,
                color: context.colorScheme.onSurfaceVariant,
              ),
              const Gap.xs(horizontal: true),
              Expanded(
                child: Text(
                  context.l10n.kycLast4,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ],
          ),
          const Gap.l(),
          KpButton(label: context.l10n.kycVerify, onPressed: _verify),
        ],
      ),
    );
  }

  Widget _tablet(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(KpSpacing.xl),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex: 5, child: _tabletHero(context)),
              const Gap.xl(horizontal: true),
              Expanded(flex: 7, child: _tabletForm(context)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tabletHero(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  color: KpColors.brand100,
                  borderRadius: KpRadii.allXl,
                ),
                padding: const EdgeInsets.all(KpSpacing.l),
                child: const KpNetworkImage(
                  url: kKycRobotUrl,
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                right: -KpSpacing.s,
                bottom: -KpSpacing.s,
                child: Container(
                  padding: const EdgeInsets.all(KpSpacing.m),
                  decoration: const BoxDecoration(
                    color: KpColors.gold500,
                    borderRadius: KpRadii.allL,
                    border: Border(
                      bottom: BorderSide(color: KpColors.gold600, width: 4),
                    ),
                  ),
                  child: const Icon(
                    Icons.verified_user_rounded,
                    color: KpColors.gold600,
                    size: KpSpacing.xl,
                  ),
                ),
              ),
            ],
          ),
        ),
        const Gap.l(),
        Text(
          context.l10n.kycTabletTitle,
          style: context.textTheme.headlineMedium,
        ),
        const Gap.xs(),
        Text(
          context.l10n.kycTabletBody,
          style: context.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w400,
            color: context.colorScheme.onSurfaceVariant,
          ),
        ),
        const Gap.l(),
        const ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(KpRadii.pill)),
          child: KpProgressBar(value: 0.65, height: 16),
        ),
        const Gap.s(),
        Text(
          context.l10n.kycStep,
          style: context.textTheme.labelLarge?.copyWith(
            color: context.colorScheme.primary,
          ),
        ),
      ],
    );
  }

  Widget _tabletForm(BuildContext context) {
    final count = '${_id.text.length}/11';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.all(KpSpacing.xl),
          decoration: BoxDecoration(
            color: context.colorScheme.surfaceContainerLowest,
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
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                context.l10n.kycSelectIdTypeFull.toUpperCase(),
                style: context.textTheme.labelMedium?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                  letterSpacing: 0.5,
                ),
              ),
              const Gap.s(),
              KycIdTypeCards(
                selected: _type,
                onChanged: (t) => setState(() => _type = t),
              ),
              const Gap.l(),
              Text(
                context.l10n.kycEnterNumber.toUpperCase(),
                style: context.textTheme.labelMedium?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                  letterSpacing: 0.5,
                ),
              ),
              const Gap.xs(),
              KycNumberField(
                controller: _id,
                hint: context.l10n.kycEnterNumberHint,
                counter: count,
              ),
              const Gap.s(),
              Row(
                children: [
                  Icon(
                    Icons.info_outline_rounded,
                    size: KpSpacing.m,
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                  const Gap.xs(horizontal: true),
                  Expanded(
                    child: Text(
                      context.l10n.kycLegalUse,
                      style: context.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ],
              ),
              const Gap.l(),
              KpButton(label: context.l10n.kycVerify, onPressed: _verify),
            ],
          ),
        ),
        const Gap.l(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _trustChip(
              context,
              Icons.lock_rounded,
              context.l10n.kycAesEncrypted,
            ),
            const Gap.l(horizontal: true),
            _trustChip(
              context,
              Icons.shield_rounded,
              context.l10n.kycCbnRegulated,
            ),
          ],
        ),
      ],
    );
  }

  Widget _trustChip(BuildContext context, IconData icon, String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: KpSpacing.m,
          color: context.colorScheme.onSurfaceVariant,
        ),
        const Gap.xs(horizontal: true),
        Text(
          label,
          style: context.textTheme.labelMedium?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
