import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/core/widgets/dashed_rrect_painter.dart';

/// Phone create-school form (design `create_school`).
class CreateSchoolPhoneView extends StatelessWidget {
  const CreateSchoolPhoneView({this.onCreate, super.key});

  final VoidCallback? onCreate;

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
        const SchoolHeroCard(),
        const Gap.l(),
        const SchoolIdentityCard(),
        const Gap.l(),
        SchoolUploadZone(
          title: context.l10n.createSchoolLogo,
          icon: Icons.upload_file_rounded,
          hint: context.l10n.createSchoolLogoHint,
          sizeHint: context.l10n.createSchoolLogoSize,
        ),
        const Gap.l(),
        SchoolUploadZone(
          title: context.l10n.createSchoolBackground,
          icon: Icons.add_photo_alternate_rounded,
          hint: context.l10n.createSchoolBackgroundHint,
          sizeHint: context.l10n.createSchoolBackgroundSize,
        ),
        const Gap.l(),
        const SchoolPayoutCard(),
        const Gap.l(),
        const SchoolCostNotice(),
        const Gap.l(),
        SchoolCreateButton(onPressed: onCreate),
      ],
    );
  }
}

/// Tablet create-school workspace with a live preview (design
/// `create_school_tablet`).
class CreateSchoolTabletView extends StatelessWidget {
  const CreateSchoolTabletView({this.onCreate, super.key});

  final VoidCallback? onCreate;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(KpSpacing.xl),
      children: [
        Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      const SchoolHeroCard(),
                      const Gap.l(),
                      const SchoolIdentityCard(),
                      const Gap.l(),
                      IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: SchoolUploadZone(
                                title: context.l10n.createSchoolLogo,
                                icon: Icons.upload_file_rounded,
                                hint: context.l10n.createSchoolLogoHint,
                                sizeHint: context.l10n.createSchoolLogoSize,
                              ),
                            ),
                            const Gap.l(horizontal: true),
                            Expanded(
                              child: SchoolUploadZone(
                                title: context.l10n.createSchoolBackground,
                                icon: Icons.add_photo_alternate_rounded,
                                hint: context.l10n.createSchoolBackgroundHint,
                                sizeHint:
                                    context.l10n.createSchoolBackgroundSize,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Gap.l(),
                      const SchoolPayoutCard(),
                    ],
                  ),
                ),
                const Gap.l(horizontal: true),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SchoolLivePreviewCard(),
                      const Gap.l(),
                      const SchoolCostNoticeTablet(),
                      const Gap.l(),
                      SchoolCreateButtonTablet(onPressed: onCreate),
                      const Gap.m(),
                      Text(
                        context.l10n.createSchoolTerms,
                        textAlign: TextAlign.center,
                        style: context.textTheme.labelMedium?.copyWith(
                          color: context.colorScheme.outline,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

const _schoolBanks = <String>[
  'Access Bank',
  'GTBank',
  'Zenith Bank',
  'First Bank',
];

/// White "tactile" card: thin outline + a flat 7px bottom shadow (design
/// `create_school`).
BoxDecoration schoolCard(BuildContext context) {
  return BoxDecoration(
    color: context.colorScheme.surface,
    borderRadius: KpRadii.allXl,
    border: Border.all(color: context.colorScheme.surfaceContainerHighest),
    boxShadow: [
      BoxShadow(
        color: context.colorScheme.surfaceContainerHighest,
        offset: const Offset(0, 7),
      ),
    ],
  );
}

/// Mascot + "Build Your School!" welcome hero (design `create_school`).
class SchoolHeroCard extends StatelessWidget {
  const SchoolHeroCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: schoolCard(context),
      child: Column(
        children: [
          Container(
            width: KpSpacing.xxl + KpSpacing.l,
            height: KpSpacing.xxl + KpSpacing.l,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: context.colorScheme.secondaryContainer,
              shape: BoxShape.circle,
            ),
            child: const KpMascot.celebrate(size: 48),
          ),
          const Gap.m(),
          Text(
            context.l10n.createSchoolHeroTitle,
            textAlign: TextAlign.center,
            style: context.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
          const Gap.xs(),
          Text(
            context.l10n.createSchoolHeroBody,
            textAlign: TextAlign.center,
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

class _SectionHeading extends StatelessWidget {
  const _SectionHeading({required this.icon, required this.label});

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
            style: context.textTheme.titleLarge?.copyWith(
              color: context.colorScheme.primary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

class _FieldLabel extends StatelessWidget {
  const _FieldLabel(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: context.textTheme.labelLarge?.copyWith(
        color: context.colorScheme.onSurfaceVariant,
        fontWeight: FontWeight.w800,
        letterSpacing: 0.7, // design `tracking-wider` (0.05em on 14px)
      ),
    );
  }
}

/// School name / contact / address fields (design `create_school`).
class SchoolIdentityCard extends StatefulWidget {
  const SchoolIdentityCard({super.key});

  @override
  State<SchoolIdentityCard> createState() => _SchoolIdentityCardState();
}

class _SchoolIdentityCardState extends State<SchoolIdentityCard> {
  final _name = TextEditingController();
  final _contact = TextEditingController();
  final _address = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _contact.dispose();
    _address.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: schoolCard(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionHeading(
            icon: Icons.corporate_fare_rounded,
            label: context.l10n.createSchoolIdentity,
          ),
          const Gap.l(),
          _FieldLabel(context.l10n.createSchoolName),
          const Gap.xs(),
          TextField(
            controller: _name,
            style: context.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              hintText: context.l10n.createSchoolNameHint,
            ),
          ),
          const Gap.m(),
          _FieldLabel(context.l10n.createSchoolContact),
          const Gap.xs(),
          TextField(
            controller: _contact,
            style: context.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w500,
            ),
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              hintText: context.l10n.createSchoolContactHint,
            ),
          ),
          const Gap.m(),
          _FieldLabel(context.l10n.createSchoolAddress),
          const Gap.xs(),
          TextField(
            controller: _address,
            minLines: 2,
            maxLines: 3,
            style: context.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              hintText: context.l10n.createSchoolAddressHint,
            ),
          ),
        ],
      ),
    );
  }
}

/// Dashed upload zone for the logo / banner (design `create_school`).
class SchoolUploadZone extends StatelessWidget {
  const SchoolUploadZone({
    required this.title,
    required this.icon,
    required this.hint,
    required this.sizeHint,
    super.key,
  });

  final String title;
  final IconData icon;
  final String hint;
  final String sizeHint;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: schoolCard(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: context.textTheme.labelLarge?.copyWith(
              color: context.colorScheme.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Gap.m(),
          CustomPaint(
            foregroundPainter: DashedRRectPainter(
              color: context.colorScheme.outlineVariant,
              radius: KpRadii.m,
            ),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: KpSpacing.xl),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Icon(
                    icon,
                    size: KpSpacing.xl,
                    color: context.colorScheme.outline,
                  ),
                  const Gap.s(),
                  Text(
                    hint,
                    textAlign: TextAlign.center,
                    style: context.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: context.colorScheme.onSurface,
                    ),
                  ),
                  const Gap.xxs(),
                  Text(
                    sizeHint,
                    style: context.textTheme.labelSmall?.copyWith(
                      color: context.colorScheme.outline,
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

/// Bank / NUBAN / account-name payout fields (design `create_school`).
class SchoolPayoutCard extends StatefulWidget {
  const SchoolPayoutCard({super.key});

  @override
  State<SchoolPayoutCard> createState() => _SchoolPayoutCardState();
}

class _SchoolPayoutCardState extends State<SchoolPayoutCard> {
  final _nuban = TextEditingController();
  final _accountName = TextEditingController();
  String? _bank;

  @override
  void dispose() {
    _nuban.dispose();
    _accountName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: schoolCard(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionHeading(
            icon: Icons.account_balance_rounded,
            label: context.l10n.createSchoolPayoutDetails,
          ),
          const Gap.l(),
          _FieldLabel(context.l10n.createSchoolBankName),
          const Gap.xs(),
          DropdownButtonFormField<String>(
            initialValue: _bank,
            isExpanded: true,
            style: context.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              hintText: context.l10n.createSchoolSelectBank,
            ),
            items: [
              for (final bank in _schoolBanks)
                DropdownMenuItem<String>(value: bank, child: Text(bank)),
            ],
            onChanged: (v) => setState(() => _bank = v),
          ),
          const Gap.m(),
          _FieldLabel(context.l10n.createSchoolNuban),
          const Gap.xs(),
          TextField(
            controller: _nuban,
            keyboardType: TextInputType.number,
            style: context.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              hintText: context.l10n.createSchoolNubanHint,
            ),
          ),
          const Gap.m(),
          _FieldLabel(context.l10n.createSchoolAccountName),
          const Gap.xs(),
          TextField(
            controller: _accountName,
            style: context.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              hintText: context.l10n.createSchoolAccountNameHint,
            ),
          ),
        ],
      ),
    );
  }
}

/// "Creating a school costs 50 Keens" notice (design `create_school`).
class SchoolCostNotice extends StatelessWidget {
  const SchoolCostNotice({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: BoxDecoration(
        color: context.colorScheme.primaryContainer.withValues(alpha: 0.25),
        borderRadius: KpRadii.allXl,
        border: Border.all(color: context.colorScheme.primaryContainer),
      ),
      child: Row(
        children: [
          Container(
            width: KpSpacing.xl,
            height: KpSpacing.xl,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: context.colorScheme.secondaryContainer,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.savings_rounded,
              color: context.colorScheme.onSecondaryContainer,
              size: KpSpacing.l,
            ),
          ),
          const Gap.m(horizontal: true),
          Expanded(
            child: Text(
              context.l10n.createSchoolCost,
              style: context.textTheme.bodyLarge?.copyWith(
                color: context.colorScheme.onPrimaryContainer,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// The primary "Create School" CTA (design `create_school`).
class SchoolCreateButton extends StatelessWidget {
  const SchoolCreateButton({this.onPressed, super.key});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return KpButton(
      label: context.l10n.createSchoolCta,
      icon: Icons.rocket_launch_rounded,
      onPressed: onPressed ?? () {},
    );
  }
}

/// Tablet cost notice: a light-blue card with a gold token badge and a bold
/// "50 Keens" amount (design `create_school_tablet`).
class SchoolCostNoticeTablet extends StatelessWidget {
  const SchoolCostNoticeTablet({super.key});

  static const double _badge = 48;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: BoxDecoration(
        color: context.colorScheme.primaryContainer,
        borderRadius: KpRadii.allXl,
        border: Border.all(color: context.colorScheme.primary, width: 2),
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.primary.withValues(alpha: 0.15),
            blurRadius: KpSpacing.m,
            offset: const Offset(0, KpSpacing.xs),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: _badge,
            height: _badge,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: context.colorScheme.secondaryContainer,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: KpColors.gold600.withValues(alpha: 0.3),
                  blurRadius: KpSpacing.xs,
                  offset: const Offset(0, KpSpacing.xxs),
                ),
              ],
            ),
            child: Icon(
              Icons.generating_tokens_rounded,
              color: context.colorScheme.onSecondaryContainer,
              size: KpSpacing.l,
            ),
          ),
          const Gap.m(horizontal: true),
          Expanded(
            child: Text.rich(
              TextSpan(
                style: context.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: context.colorScheme.onPrimaryContainer,
                ),
                children: [
                  TextSpan(text: '${context.l10n.createSchoolCostLead} '),
                  TextSpan(
                    text: context.l10n.createSchoolCostAmount,
                    style: const TextStyle(
                      color: KpColors.brand800,
                      fontWeight: FontWeight.w600,
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

/// Tablet "Create School" CTA: a large bright-blue candy button with dark text
/// and a 4px depth (design `create_school_tablet`).
class SchoolCreateButtonTablet extends StatelessWidget {
  const SchoolCreateButtonTablet({this.onPressed, super.key});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final fg = context.colorScheme.onPrimaryContainer;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colorScheme.primary,
        borderRadius: KpRadii.allXl,
        border: Border(bottom: BorderSide(color: fg, width: 4)),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onPressed ?? () {},
          borderRadius: KpRadii.allXl,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: KpSpacing.l),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  context.l10n.createSchoolCta,
                  style: context.textTheme.headlineSmall?.copyWith(
                    color: fg,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const Gap.s(horizontal: true),
                Icon(Icons.rocket_launch_rounded, color: fg),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Tablet "Live Preview" of how parents see the school (design
/// `create_school_tablet`).
class SchoolLivePreviewCard extends StatelessWidget {
  const SchoolLivePreviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: schoolCard(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(KpSpacing.l),
            color: context.colorScheme.surfaceContainer,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.visibility_rounded,
                      color: context.colorScheme.onSurface,
                    ),
                    const Gap.s(horizontal: true),
                    Text(
                      context.l10n.createSchoolLivePreview,
                      style: context.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
                const Gap.xxs(),
                Text(
                  context.l10n.createSchoolPreviewSubtitle,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
          // Banner with a school-logo placeholder.
          Container(
            height: 140,
            width: double.infinity,
            alignment: Alignment.center,
            color: context.colorScheme.primary,
            child: Container(
              width: KpSpacing.xxl + KpSpacing.l,
              height: KpSpacing.xxl + KpSpacing.l,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: context.colorScheme.surface,
                borderRadius: KpRadii.allL,
              ),
              child: Icon(
                Icons.school_rounded,
                size: KpSpacing.xl,
                color: context.colorScheme.outlineVariant,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(KpSpacing.l),
            child: Column(
              children: [
                const _PreviewBar(widthFactor: 0.7, tall: true),
                const Gap.s(),
                const _PreviewBar(widthFactor: 1),
                const Gap.xs(),
                const _PreviewBar(widthFactor: 0.85),
                const Gap.m(),
                Row(
                  children: [
                    Expanded(
                      child: _PreviewStat(
                        label: context.l10n.schoolStudents,
                        value: '0',
                        color: context.colorScheme.primary,
                      ),
                    ),
                    const Gap.m(horizontal: true),
                    Expanded(
                      child: _PreviewStat(
                        label: context.l10n.createSchoolRating,
                        value: '5.0',
                        color: context.colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PreviewBar extends StatelessWidget {
  const _PreviewBar({required this.widthFactor, this.tall = false});

  final double widthFactor;
  final bool tall;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: FractionallySizedBox(
        widthFactor: widthFactor,
        child: Container(
          height: tall ? KpSpacing.l : KpSpacing.s,
          decoration: BoxDecoration(
            color: tall
                ? context.colorScheme.surfaceContainerHigh
                : context.colorScheme.surfaceContainer,
            borderRadius: const BorderRadius.all(Radius.circular(KpRadii.pill)),
          ),
        ),
      ),
    );
  }
}

class _PreviewStat extends StatelessWidget {
  const _PreviewStat({
    required this.label,
    required this.value,
    required this.color,
  });

  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: KpRadii.allL,
        border: Border.all(color: context.colorScheme.outlineVariant, width: 2),
      ),
      child: Column(
        children: [
          Text(
            label.toUpperCase(),
            style: context.textTheme.labelSmall?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Gap.xxs(),
          Text(
            value,
            style: context.textTheme.headlineSmall?.copyWith(
              color: color,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
