import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/discovery/presentation/widgets/insights_reports_fixtures.dart';

/// Accent style for an [InsightsStatCard].
enum InsightAccent { primary, amber, neutral }

/// A single "Year in Review" metric card: label, big value, and a captioned
/// icon footer (design `insights_reports`).
class InsightsStatCard extends StatelessWidget {
  const InsightsStatCard({
    required this.label,
    required this.value,
    required this.caption,
    required this.icon,
    required this.accent,
    super.key,
  });

  final String label;
  final String value;
  final String caption;
  final IconData icon;
  final InsightAccent accent;

  @override
  Widget build(BuildContext context) {
    final (Color border, Color accentFg) = switch (accent) {
      InsightAccent.primary => (
        context.colorScheme.primary,
        context.colorScheme.primary,
      ),
      InsightAccent.amber => (
        context.colorScheme.secondary,
        context.colorScheme.secondary,
      ),
      InsightAccent.neutral => (
        context.colorScheme.surfaceContainerHighest,
        context.colorScheme.onSurfaceVariant,
      ),
    };
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLowest,
        borderRadius: KpRadii.allXl,
        border: Border(bottom: BorderSide(color: border, width: 6)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label.toUpperCase(),
            style: context.textTheme.labelMedium?.copyWith(color: accentFg),
          ),
          const Gap.xs(),
          Text(value, style: context.textTheme.headlineMedium),
          const Gap.m(),
          Row(
            children: [
              Icon(icon, size: KpSpacing.l, color: accentFg),
              const Gap.xs(horizontal: true),
              Flexible(
                child: Text(
                  caption,
                  style: context.textTheme.labelSmall?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// The six "Year in Review" metric cards, in display order. Shared by the phone
/// and tablet layouts.
List<InsightsStatCard> insightStatCards(BuildContext context) => [
  InsightsStatCard(
    label: context.l10n.insightsTotalSaved,
    value: kInsightTotalSaved,
    caption: context.l10n.insightsTotalSavedCaption,
    icon: KpIcons.verified,
    accent: InsightAccent.primary,
  ),
  InsightsStatCard(
    label: context.l10n.insightsSavedThisYear,
    value: kInsightSavedThisYear,
    caption: context.l10n.insightsSavedThisYearCaption,
    icon: KpIcons.trend,
    accent: InsightAccent.neutral,
  ),
  InsightsStatCard(
    label: context.l10n.insightsDonated,
    value: kInsightDonated,
    caption: context.l10n.insightsDonatedCaption,
    icon: Icons.favorite_rounded,
    accent: InsightAccent.amber,
  ),
  InsightsStatCard(
    label: context.l10n.insightsContributions,
    value: kInsightContributions,
    caption: context.l10n.insightsContributionsCaption,
    icon: Icons.receipt_long_rounded,
    accent: InsightAccent.neutral,
  ),
  InsightsStatCard(
    label: context.l10n.insightsPockets,
    value: kInsightPockets,
    caption: context.l10n.insightsPocketsCaption,
    icon: KpIcons.wallet,
    accent: InsightAccent.neutral,
  ),
  InsightsStatCard(
    label: context.l10n.insightsAdashi,
    value: kInsightAdashi,
    caption: context.l10n.insightsAdashiCaption,
    icon: KpIcons.group,
    accent: InsightAccent.neutral,
  ),
];
