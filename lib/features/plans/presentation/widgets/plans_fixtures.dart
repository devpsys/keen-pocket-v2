import 'package:core/core.dart';

// PRESENTATION-ONLY placeholder data for the tablet "Savings Cockpit"
// (design `grocery_plans_list_tablet`).

/// A spotlighted item in the cockpit's "High Priority Items" card.
typedef PlanPriorityItem = ({String name, String category, Money price});

const kPlanGoalPercent = 74;
const kPlanWeeklySaved = Money(4500); // ₦45.00

const kPlanPriorityItems = <PlanPriorityItem>[
  (
    name: 'Organic Eggs (12pk)',
    category: 'Family Groceries',
    price: Money(589),
  ),
  (name: 'Cold Brew Coffee', category: 'Bachelor Week', price: Money(1250)),
];
