import 'package:core/core.dart';

import 'package:keenpockets/features/plans/presentation/view_models/plan_item_view.dart';

// PRESENTATION-ONLY placeholder data for the grocery plan detail screen
// (designs `grocery_plan_detail` + `grocery_plan_detail_tablet`).

typedef PlanCollaborator = ({String name, String role, bool owner});

const kPlanDetailName = 'Monthly Groceries';
const kPlanDetailPeriod = 'Oct 1 - Oct 31, 2023';
const kPlanDetailTotalItems = 24;
const kPlanDetailBoughtCount = 12;
const kPlanDetailDeferredCount = 2;
const kPlanDetailEstimated = Money(8450000);
const kPlanDetailSpent = Money(6200000);
const kPlanDetailBudget = Money(7500000);
const kPlanDetailCollaboratorCount = 3;

const kPlanDetailItems = <PlanItemView>[
  PlanItemView(
    id: 'i1',
    name: 'Basmati Rice (Large Bag)',
    quantity: 1,
    unitPrice: Money(3250000),
    status: PlanItemStatus.purchased,
    category: 'Pantry',
    starred: true,
    claimedBy: 'John',
  ),
  PlanItemView(
    id: 'i2',
    name: 'Cooking Oil (5L)',
    quantity: 2,
    unitPrice: Money(450000),
    status: PlanItemStatus.pending,
    category: 'Pantry',
  ),
  PlanItemView(
    id: 'i3',
    name: 'Electric Kettle',
    quantity: 1,
    unitPrice: Money(1800000),
    status: PlanItemStatus.deferred,
    category: 'Appliance',
  ),
];

const kPlanDetailCollaborators = <PlanCollaborator>[
  (name: 'Sarah Chen', role: 'Owner', owner: true),
  (name: 'John Doe', role: 'Collaborator', owner: false),
];
