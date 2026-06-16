# Feature: `contributions`

The single contribution & invoice ledger shared by **both** Pocket and Adashi
(blueprint Phase 2). Host features depend on `contributions`, never the reverse.

## Host-agnostic design
The feature never imports `pockets`/`adashi`. Callers pass a
`ContributionContext` (`pocket(id, slot:)` or `adashi(id, cycle:)`) into the use
cases and pages. `pockets` consumes this via the barrel:
`PocketDetailPage` opens `InvoiceHistoryPage(context: ContributionContext.pocket(id),
canVerify: role == organiser)`.

## Layout
```
contributions/
├── contributions.dart          # public barrel
├── data/{datasources,dtos,mappers,repositories}
├── domain/
│   ├── entities/invoice.dart   # Invoice + InvoiceItem + InvoiceStatus/Type
│   ├── value_objects/          # ContributionContext
│   ├── repositories/           # ContributionRepository
│   └── usecases/               # GetInvoices, SubmitContribution, VerifyContribution
└── presentation/
    ├── cubit/                  # InvoiceHistoryCubit, ContributeCubit (+ states)
    ├── pages/                  # InvoiceHistoryPage, ContributePage
    └── widgets/                # InvoiceTile
```

## Notes
- `Money` is imported from `package:core` (promoted from `pockets` once a second
  feature needed it).
- Authorization: `verify` is an organiser action; the caller decides `canVerify`
  from the host role (`Pocket.roleOf`).

## Scope / deferred
Wallet pay-from-balance (needs the `money` feature) and the **drift offline
outbox + SyncService** for queued contributions are Phase 4b. Backend endpoints:
`invoice`, `invoice/create`, `pocket/invoices`, `payment/status/update`,
`adashi/{id}/contribute`.
