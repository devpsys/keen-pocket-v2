import 'package:flutter/material.dart';

/// Centralized icon set — the single source of truth for iconography, mapped to
/// the Material Symbols used across the designs. Widgets reference these
/// semantic names (e.g. `KpIcons.wallet`) instead of hardcoding `Icons.*`, so
/// the icon language stays consistent and swappable.
@immutable
abstract final class KpIcons {
  const KpIcons._();

  // ── Navigation ────────────────────────────────────────────────────────────
  static const IconData dashboard = Icons.dashboard_rounded;
  static const IconData dashboardOutlined = Icons.dashboard_outlined;
  static const IconData pockets = Icons.savings_rounded;
  static const IconData pocketsOutlined = Icons.savings_outlined;
  static const IconData adashi = Icons.cyclone_rounded;
  static const IconData adashiOutlined = Icons.cyclone_outlined;
  static const IconData discover = Icons.explore_rounded;
  static const IconData discoverOutlined = Icons.explore_outlined;
  static const IconData profile = Icons.person_rounded;
  static const IconData profileOutlined = Icons.person_outline_rounded;
  static const IconData wallet = Icons.account_balance_wallet_rounded;
  static const IconData walletOutlined = Icons.account_balance_wallet_outlined;
  static const IconData settings = Icons.settings_rounded;

  // ── Actions ───────────────────────────────────────────────────────────────
  static const IconData notifications = Icons.notifications_rounded;
  static const IconData notificationsOutlined = Icons.notifications_outlined;
  static const IconData help = Icons.help_outline_rounded;
  static const IconData logout = Icons.logout_rounded;
  static const IconData search = Icons.search_rounded;
  static const IconData add = Icons.add_rounded;
  static const IconData account = Icons.account_circle_rounded;
  static const IconData chevronRight = Icons.chevron_right_rounded;
  static const IconData share = Icons.share_rounded;
  static const IconData edit = Icons.edit_rounded;
  static const IconData editNote = Icons.edit_note_rounded;
  static const IconData payments = Icons.payments_rounded;
  static const IconData security = Icons.security_rounded;
  static const IconData rocket = Icons.rocket_launch_rounded;
  static const IconData info = Icons.info_outline_rounded;
  static const IconData remove = Icons.remove_rounded;

  // ── Stats / content ───────────────────────────────────────────────────────
  static const IconData folder = Icons.folder_rounded;
  static const IconData group = Icons.group_rounded;
  static const IconData groups = Icons.groups_rounded;
  static const IconData verified = Icons.verified_rounded;
  static const IconData reputation = Icons.verified_user_rounded;
  static const IconData savings = Icons.savings_rounded;
  static const IconData streak = Icons.local_fire_department_rounded;
  static const IconData freeze = Icons.ac_unit_rounded;
  static const IconData reward = Icons.card_giftcard_rounded;
  static const IconData calendar = Icons.calendar_today_rounded;
  static const IconData trend = Icons.show_chart_rounded;
  static const IconData weeklyGoal = Icons.track_changes_rounded;
  static const IconData medal = Icons.military_tech_rounded;
  static const IconData shopping = Icons.shopping_cart_outlined;
}
