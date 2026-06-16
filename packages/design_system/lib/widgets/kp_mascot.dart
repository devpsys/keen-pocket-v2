import 'package:flutter/material.dart';

/// Mr K — the KeenPocket mascot. He guides the user's emotional journey:
/// celebrating successes, softening errors, and filling empty states (design
/// library, Mascot Integration).
///
/// All moods currently share one rendered asset; [KpMascotMood] is the stable
/// API so screens can request the right tone now and richer art can be wired in
/// later without touching call sites.
enum KpMascotMood {
  /// Friendly greeting — onboarding, dashboard tips.
  wave,

  /// Thinking — loading / processing states.
  think,

  /// Celebrating with coins — success, milestones.
  celebrate,

  /// Searching — empty states / no results.
  search,
}

class KpMascot extends StatelessWidget {
  const KpMascot({this.mood = KpMascotMood.wave, this.size = 120, super.key});

  /// Convenience constructors for readable call sites.
  const KpMascot.celebrate({double size = 120, Key? key})
    : this(mood: KpMascotMood.celebrate, size: size, key: key);
  const KpMascot.search({double size = 120, Key? key})
    : this(mood: KpMascotMood.search, size: size, key: key);
  const KpMascot.think({double size = 120, Key? key})
    : this(mood: KpMascotMood.think, size: size, key: key);

  final KpMascotMood mood;
  final double size;

  static const String _asset = 'assets/images/mr_k_wave.png';
  static const String _package = 'design_system';

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      _asset,
      package: _package,
      width: size,
      height: size,
      fit: BoxFit.contain,
      semanticLabel: 'Mr K',
    );
  }
}
