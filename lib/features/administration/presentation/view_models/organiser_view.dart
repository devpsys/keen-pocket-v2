import 'package:core/core.dart';

/// Pocket kind shown on a health card (design `admin_health_dashboard`).
enum OrganiserPocketType { adashi, savings }

/// Collection-health state of a managed pocket.
enum PocketHealth { pending, atRisk, healthy, overdue }

/// A pulse-checklist item's emphasis + action.
enum PulseTone { info, urgent }

enum PulseAction { review, nudge }

/// A managed pocket's health summary (design `admin_health_dashboard`).
class OrganiserPocketView {
  const OrganiserPocketView({
    required this.type,
    required this.name,
    required this.members,
    required this.collected,
    required this.target,
    required this.health,
    required this.healthCount,
  });

  final OrganiserPocketType type;
  final String name;
  final int members;
  final Money collected;
  final Money target;
  final PocketHealth health;
  final int healthCount; // e.g. "2 pending"

  double get percent =>
      target.kobo == 0 ? 0 : (collected.kobo / target.kobo).clamp(0, 1);
}

/// A pulse-checklist action (design `admin_health_dashboard`).
class PulseItemView {
  const PulseItemView({
    required this.title,
    required this.subtitle,
    required this.tone,
    required this.action,
  });

  final String title;
  final String subtitle;
  final PulseTone tone;
  final PulseAction action;
}

/// UI-shaped organiser dashboard (presentation-only placeholder for now).
class OrganiserView {
  const OrganiserView({
    required this.activePockets,
    required this.totalManaged,
    required this.managedDeltaPct,
    required this.activeMembers,
    required this.newMembersToday,
    required this.urgentActions,
    required this.pockets,
    required this.pulse,
  });

  final int activePockets;
  final Money totalManaged;
  final int managedDeltaPct;
  final int activeMembers;
  final int newMembersToday;
  final int urgentActions;
  final List<OrganiserPocketView> pockets;
  final List<PulseItemView> pulse;
}
