import 'package:keenpockets/features/gamification/presentation/view_models/achievements_view.dart';

/// PRESENTATION-ONLY sample achievements (designs `my_achievements_badges` /
/// `_tablet`). Swap for a real progression feed when the backend exists.

/// Celebratory Mr. K used in the motivation hero.
const kAchievementsMascotUrl =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuC1O2A5KLveMfW-W9TfymewWj8hflq1B0mnj4LlIzQeL1HrTGbP1QRdcklA8BNQefJve-itfbUO9u0Z39Ef_AJiF-eH6LcIfAGL5-FoQwadspwQVkCx7DNenGhV5FK4LO6y56B5XboiFBYxHTlkQeE0MZJcI_zzK6chldcjRN2DfMGHUC6dgNc9UH2IJkzrcawJm7b-ZSdFOtqCrngoHDNk3uAzldTdWZSkW-eiSuJsb6Jf9_tZhGtxa2E0uYPI5asA6i8CJ6IbyJc';

const kAchievements = AchievementsView(
  streakWeeks: 5,
  streakDaysDone: 5,
  streakDaysTotal: 7,
  freezes: 2,
  earnedCount: 3,
  eliteGoalDone: 14,
  eliteGoalTotal: 16,
  badges: [
    BadgeView(
      id: 'b1',
      kind: AchievementBadge.reliablePayer,
      label: 'Reliable Payer',
      caption: '90%+ reliability rate',
      earned: true,
    ),
    BadgeView(
      id: 'b2',
      kind: AchievementBadge.topOrganizer,
      label: 'Top Organizer',
      caption: '4.5+ average rating',
      earned: true,
    ),
    BadgeView(
      id: 'b3',
      kind: AchievementBadge.recruiter,
      label: 'Recruiter',
      caption: '3+ friends referred',
      earned: true,
    ),
    BadgeView(
      id: 'b4',
      kind: AchievementBadge.bigSaver,
      label: 'Big Saver',
      caption: 'Unlock at ₦100k',
      earned: false,
    ),
  ],
  milestones: [
    MilestoneView(
      kind: MilestoneKind.consistentContributor,
      label: 'Consistent Contributor',
      percent: 0.85,
    ),
    MilestoneView(
      kind: MilestoneKind.groupGuardian,
      label: 'Group Guardian',
      percent: 0.40,
    ),
  ],
);
