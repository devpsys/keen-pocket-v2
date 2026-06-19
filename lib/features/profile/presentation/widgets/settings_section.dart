import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

/// A titled white [KpCard] used for each block on the settings screen.
///
/// Renders a [titleMedium] heading above the section's [child] (design
/// `settings`).
class SettingsSection extends StatelessWidget {
  const SettingsSection({required this.title, required this.child, super.key});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return KpCard(
      padding: const EdgeInsets.all(KpSpacing.l),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: context.textTheme.titleMedium),
          const Gap.m(),
          child,
        ],
      ),
    );
  }
}
