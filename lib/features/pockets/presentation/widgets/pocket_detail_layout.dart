import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

/// Two-column tablet arrangement of the pocket detail hub
/// (design `pocket_detail_hub_tablet`).
class PocketDetailTabletLayout extends StatelessWidget {
  const PocketDetailTabletLayout({
    required this.header,
    required this.progress,
    required this.contributions,
    required this.shopping,
    required this.pending,
    required this.payout,
    required this.members,
    required this.topContributors,
    required this.rules,
    super.key,
  });

  static const double _maxWidth = 1100;

  final Widget header;
  final Widget progress;
  final Widget contributions;
  final Widget shopping;
  final Widget pending;
  final Widget payout;
  final Widget members;
  final Widget topContributors;
  final Widget rules;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(KpSpacing.l),
      children: [
        Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: _maxWidth),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          header,
                          const Gap.m(),
                          progress,
                          const Gap.l(),
                          contributions,
                          const Gap.l(),
                          shopping,
                        ],
                      ),
                    ),
                    const Gap.l(horizontal: true),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          pending,
                          const Gap.m(),
                          payout,
                          const Gap.l(),
                          members,
                          const Gap.l(),
                          topContributors,
                        ],
                      ),
                    ),
                  ],
                ),
                const Gap.l(),
                rules,
                const Gap.xl(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// Single-column phone arrangement of the pocket detail hub.
class PocketDetailPhoneLayout extends StatelessWidget {
  const PocketDetailPhoneLayout({
    required this.header,
    required this.progress,
    required this.contributions,
    required this.shopping,
    required this.pending,
    required this.payout,
    required this.members,
    required this.topContributors,
    required this.rules,
    super.key,
  });

  final Widget header;
  final Widget progress;
  final Widget contributions;
  final Widget shopping;
  final Widget pending;
  final Widget payout;
  final Widget members;
  final Widget topContributors;
  final Widget rules;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(KpSpacing.l),
      children: [
        header,
        const Gap.m(),
        pending,
        const Gap.m(),
        progress,
        const Gap.l(),
        contributions,
        const Gap.l(),
        shopping,
        const Gap.l(),
        payout,
        const Gap.l(),
        members,
        const Gap.l(),
        topContributors,
        const Gap.l(),
        rules,
        const Gap.xl(),
      ],
    );
  }
}
