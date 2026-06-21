import 'package:core/core.dart';

/// PRESENTATION-ONLY view models for the Invoice Ledger screen
/// (design `invoice_history` / `_tablet`). Replaced by real invoice data later.

/// How a logged payment was settled.
enum InvoicePayMethod { wallet, manual }

/// A row in the payment-history list.
class InvoiceHistoryRow {
  const InvoiceHistoryRow({
    required this.ref,
    required this.date,
    required this.amount,
    required this.method,
    required this.paid,
  });

  final String ref;
  final String date;
  final Money amount;
  final InvoicePayMethod method;
  final bool paid;
}

/// A contribution awaiting an organiser's verification.
class InvoiceApproval {
  const InvoiceApproval({
    required this.groupName,
    required this.memberName,
    required this.sentBy,
    required this.amount,
    required this.proofFileName,
  });

  final String groupName;
  final String memberName;
  final String sentBy;
  final Money amount;
  final String proofFileName;
}

/// How a tablet-ledger payment was made (richer than the phone's two methods).
enum InvoiceMethod { directTransfer, keenWallet, cardPayment }

/// Settlement state shown in the tablet ledger table.
enum InvoiceLedgerStatus { paid, pending, overdue }

/// One row of the tablet payment-history table (design `invoice_history_tablet`).
class InvoiceTableRow {
  const InvoiceTableRow({
    required this.ref,
    required this.date,
    required this.method,
    required this.amount,
    required this.status,
  });

  final String ref;
  final String date;
  final InvoiceMethod method;
  final Money amount;
  final InvoiceLedgerStatus status;
}

/// An invoice due imminently, surfaced as an urgent action.
class InvoiceUrgent {
  const InvoiceUrgent({
    required this.ref,
    required this.name,
    required this.amount,
  });

  final String ref;
  final String name;
  final Money amount;
}

/// Filter tabs over the payment history.
enum InvoiceFilter { all, paid, pending }

/// The whole ledger snapshot the screen renders.
class InvoiceLedgerView {
  const InvoiceLedgerView({
    required this.approvals,
    required this.urgent,
    required this.history,
    required this.tableRows,
    required this.totalSent,
    required this.awaiting,
  });

  final List<InvoiceApproval> approvals;
  final InvoiceUrgent? urgent;
  final List<InvoiceHistoryRow> history;
  final List<InvoiceTableRow> tableRows;
  final Money totalSent;
  final Money awaiting;

  List<InvoiceHistoryRow> filtered(InvoiceFilter filter) => switch (filter) {
    InvoiceFilter.all => history,
    InvoiceFilter.paid => history.where((r) => r.paid).toList(),
    InvoiceFilter.pending => history.where((r) => !r.paid).toList(),
  };

  List<InvoiceTableRow> filteredRows(InvoiceFilter filter) => switch (filter) {
    InvoiceFilter.all => tableRows,
    InvoiceFilter.paid =>
      tableRows.where((r) => r.status == InvoiceLedgerStatus.paid).toList(),
    InvoiceFilter.pending =>
      tableRows.where((r) => r.status != InvoiceLedgerStatus.paid).toList(),
  };
}

final kInvoiceLedger = InvoiceLedgerView(
  approvals: [
    InvoiceApproval(
      groupName: 'Adashi Weekly Saver',
      memberName: 'Boluwatife A.',
      sentBy: 'Temi O.',
      amount: Money.naira(12500),
      proofFileName: 'Payment_Proof_Oct14.jpg',
    ),
  ],
  urgent: InvoiceUrgent(
    ref: '#KP-9044',
    name: 'Office Rent Contribution',
    amount: Money.naira(50000),
  ),
  history: [
    InvoiceHistoryRow(
      ref: '#KP-9021',
      date: 'Oct 12, 2023',
      amount: Money.naira(15000),
      method: InvoicePayMethod.wallet,
      paid: true,
    ),
    InvoiceHistoryRow(
      ref: '#KP-8944',
      date: 'Oct 05, 2023',
      amount: Money.naira(5000),
      method: InvoicePayMethod.manual,
      paid: false,
    ),
    InvoiceHistoryRow(
      ref: '#KP-8812',
      date: 'Sep 28, 2023',
      amount: Money.naira(22500),
      method: InvoicePayMethod.wallet,
      paid: true,
    ),
  ],
  tableRows: [
    InvoiceTableRow(
      ref: 'INV-2023-001',
      date: 'Oct 24, 2023',
      method: InvoiceMethod.directTransfer,
      amount: Money.naira(25000),
      status: InvoiceLedgerStatus.paid,
    ),
    InvoiceTableRow(
      ref: 'INV-2023-002',
      date: 'Oct 26, 2023',
      method: InvoiceMethod.keenWallet,
      amount: Money.naira(12500),
      status: InvoiceLedgerStatus.pending,
    ),
    InvoiceTableRow(
      ref: 'INV-2023-003',
      date: 'Nov 01, 2023',
      method: InvoiceMethod.cardPayment,
      amount: Money.naira(50000),
      status: InvoiceLedgerStatus.overdue,
    ),
  ],
  totalSent: Money.naira(1200000),
  awaiting: Money.naira(62000),
);
