import 'package:flutter/material.dart';

import '../colors/kp_colors.dart';

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

  // Hosted mascot art: the celebrate pose for milestones, a friendly standing
  // pose otherwise. TODO: bundle local assets (assets/images/) when finalized.
  static const String _celebrateUrl =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuDMQa_PL9c2lOJIQ8AWux-fl6CyKJHgvYoxe0jVfwoXwC6it0YLysJqLnUujeVfdlHHx_KZPWbFymt-6k_RNj_FlaXigiVZFhuNMxw3CupUbLvYtcg92N51jxFuDxhV55O6w1A36TXaZ2HZjuBhNCoZbj0eT020vMYea3yU8lLw00BFWcHJvDD8Okk_BmQeVOOdjDZijkinMb3RFT7TNv0BwQayu4fLVIBROVmlLYEO2PlsL8SuSpnov3I_T5ntAMgnXv-pddimdmY';
  static const String _defaultUrl =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuBZEf5hB65Od8RYvohkX-1PvyxIe_ekc3k2PzPLZki4p3ldzScG8hBHzL2oyIqqeQw-GXkGlY4uZ9-2MEje1p1ijb7Q1cCIpD4zR9GNfhB-W_GwsRDF3aPkoaqaMd3bQGa3DWl_DLgLqIxcD2tDSB1aw1vYAFJad5ohnoczfFAffs4hYhaSWNcJH71DQY5d6uc4h302HwQeoqsGfwpS2vOuEeTqwbPD7WIY2tVKPb5hejMTAqiUu-ZJpyOH_GQKr3ea_rZNiVlBiwk';

  String get _url =>
      mood == KpMascotMood.celebrate ? _celebrateUrl : _defaultUrl;

  @override
  Widget build(BuildContext context) {
    final fallback = Icon(
      Icons.emoji_emotions_rounded,
      size: size * 0.7,
      color: KpColors.brand500,
    );
    return Image.network(
      _url,
      width: size,
      height: size,
      fit: BoxFit.contain,
      semanticLabel: 'Mr K',
      frameBuilder: (context, child, frame, _) =>
          frame == null ? fallback : child,
      errorBuilder: (_, _, _) => fallback,
    );
  }
}
