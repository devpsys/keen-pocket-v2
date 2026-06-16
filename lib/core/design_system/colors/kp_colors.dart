import 'package:flutter/material.dart';

/// Raw color palette — the single source of truth for every color in the app.
///
/// These are the ONLY places a `Color(0x...)` literal is allowed (the
/// `no_hardcoded_colors` lint exempts `core/design_system`). Widgets must never
/// reference this class directly for *semantic* colors; they should read from
/// the theme via `Theme.of(context).colorScheme` or `context.colors`. Use the
/// semantic [KpSemanticColors] (see themes/) rather than raw swatches in UI.
///
/// Brand anchors (from the KeenPocket design library): brand `#1cb0f6`,
/// dark `#1899d6`, light `#ddf4ff`, gold `#ffd900`.
@immutable
abstract final class KpColors {
  const KpColors._();

  // ── Brand (KeenPocket sky-blue) ───────────────────────────────────────────
  static const Color brand50 = Color(0xFFDDF4FF); // light
  static const Color brand100 = Color(0xFFB5E6FE);
  static const Color brand200 = Color(0xFF85D5FD);
  static const Color brand300 = Color(0xFF54C3FB);
  static const Color brand400 = Color(0xFF34B9F8);
  static const Color brand500 = Color(0xFF1CB0F6); // primary
  static const Color brand600 = Color(0xFF1899D6); // dark
  static const Color brand700 = Color(0xFF147CAE);
  static const Color brand800 = Color(0xFF105F86);
  static const Color brand900 = Color(0xFF0B425E);

  // ── Gold (Keens / rewards accent) ─────────────────────────────────────────
  static const Color gold500 = Color(0xFFFFD900);
  static const Color gold100 = Color(0xFFFFF4B8);

  // ── Neutral ──────────────────────────────────────────────────────────────
  static const Color neutral0 = Color(0xFFFFFFFF);
  static const Color neutral50 = Color(0xFFF7F8FA);
  static const Color neutral100 = Color(0xFFEEF0F4);
  static const Color neutral200 = Color(0xFFDDE1E8);
  static const Color neutral300 = Color(0xFFC2C8D4);
  static const Color neutral400 = Color(0xFF98A1B3);
  static const Color neutral500 = Color(0xFF6B7488);
  static const Color neutral600 = Color(0xFF4A5266);
  static const Color neutral700 = Color(0xFF333A4A);
  static const Color neutral800 = Color(0xFF20242F);
  static const Color neutral900 = Color(0xFF12151C);
  static const Color neutral1000 = Color(0xFF000000);

  // ── Semantic accents ───────────────────────────────────────────────────────
  static const Color success500 = Color(0xFF2E9E5B);
  static const Color success100 = Color(0xFFD7F0E0);
  static const Color warning500 = Color(0xFFE0A100);
  static const Color warning100 = Color(0xFFFBEFCB);
  static const Color error500 = Color(0xFFD64545);
  static const Color error100 = Color(0xFFF8D7D7);
  static const Color info500 = Color(0xFF1CB0F6);
  static const Color info100 = Color(0xFFDDF4FF);

  static const Color transparent = Color(0x00000000);
}
