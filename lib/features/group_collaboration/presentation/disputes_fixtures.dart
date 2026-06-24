import 'package:keenpockets/features/group_collaboration/presentation/view_models/dispute_view.dart';

/// PRESENTATION-ONLY sample data for the disputes hub (designs `disputes_hub` /
/// `disputes_hub_tablet`). Swap for real cases when the backend exists.

const kDisputesResolvedThisMonth = 12;
const kDisputesAvgResolution = '4.2 days';

/// Signed-in user's profile photo shown in the hub app bar.
const kDisputesUserAvatar =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuB-YLh3hQiyVJU87xXgZgx1vQpLiAq0PNQDX5GhgcHFbETMAPWKrBvdT-6WhLcyehGMVDCSQLW8QsIlvxes1JK717FUkOxi_RHiazxFP9qhGcDes0Twa7Vi9o5d7AJPpSwOUm5-J-SPJVnCzUhbhUVD7wqRhdxjbYDrDXsltfQG6fyh9pCAn4TicbIZ-WfgMcLqXA4eHDApGvmsJ2aRPRg6Exwpde6m6gF_OVsLQWEBTD_ZBEZflwo1mBpmVTAv6TzTjfOWya9LpE';

const kDisputesMascotAdvice =
    '"Always check your transaction history before raising a dispute! '
    'Most duplicates are just pending holds."';

const kDisputes = <DisputeView>[
  DisputeView(
    id: 'd1',
    title: 'Duplicate Entry',
    author: 'Samuel Adebayo',
    timeAgo: '2d ago',
    description:
        'I was charged twice for the dinner contribution. '
        'Transaction IDs: #4920 and #4921.',
    status: DisputeStatus.open,
    caseNumber: 'KP-2024-884',
    previewQuote: '"I was charged twice for the September cycle…"',
    investigation:
        'Currently reviewing transaction logs for user Samuel Adebayo '
        'regarding a double contribution on Sept 14, 2024.',
    draftNote:
        '"Waiting for Adashi Group Admin confirmation of bank reversal. '
        'Once confirmed, the duplicate credit will be nullified in the '
        'KeenPocket ledger."',
    timeline: [
      DisputeTimelineEntry(
        title: 'Case Opened',
        time: 'Today, 09:45 AM',
        state: DisputeTimelineState.done,
        body: 'Dispute initiated by Samuel Adebayo via mobile app.',
      ),
      DisputeTimelineEntry(
        title: 'Admin Review Started',
        time: 'Today, 11:30 AM',
        state: DisputeTimelineState.active,
        body: 'Case assigned to Regional Lead for Adashi Group verification.',
      ),
      DisputeTimelineEntry(
        title: 'Awaiting Evidence',
        time: 'Pending',
        state: DisputeTimelineState.pending,
      ),
    ],
  ),
  DisputeView(
    id: 'd2',
    title: 'Late Payout',
    author: 'Sarah Jenkins',
    timeAgo: '5d ago',
    description:
        "The payout for our weekend trip hasn't been processed yet. "
        'Everyone contributed their share, but the pot balance still '
        'shows as pending.',
    status: DisputeStatus.resolved,
    caseNumber: 'KP-2024-871',
    previewQuote: '"My payout was delayed by 3 business days…"',
    resolutionNote:
        'Duplicate transaction identified and reversed. Refund should '
        "reflect in Sarah's Pocket within 24 hours.",
  ),
  DisputeView(
    id: 'd3',
    title: 'Group Policy Change',
    author: 'Marcus Chen',
    timeAgo: '1w ago',
    description:
        'Claimed the mandatory fee was incorrect, but it matches the '
        'group charter signed during onboarding.',
    status: DisputeStatus.dismissed,
    caseNumber: 'KP-2024-855',
    previewQuote: '"The new contribution limit is unfair to…"',
  ),
  DisputeView(
    id: 'd4',
    title: 'Missed Contribution',
    author: 'Bisi Akande',
    timeAgo: '1w ago',
    description:
        "The system didn't auto-debit my wallet for this cycle even "
        'though I had sufficient balance.',
    status: DisputeStatus.open,
    caseNumber: 'KP-2024-849',
    previewQuote: '"System didn\'t auto-debit my wallet…"',
    investigation:
        "Checking the auto-debit schedule and Bisi Akande's wallet "
        'balance history for the current cycle.',
    timeline: [
      DisputeTimelineEntry(
        title: 'Case Opened',
        time: 'Mon, 08:10 AM',
        state: DisputeTimelineState.done,
        body: 'Dispute initiated by Bisi Akande via mobile app.',
      ),
      DisputeTimelineEntry(
        title: 'Awaiting Evidence',
        time: 'Pending',
        state: DisputeTimelineState.pending,
      ),
    ],
  ),
];
