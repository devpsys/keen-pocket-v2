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

## Offline (implemented)
When offline, `submitContribution` queues the mutation to the **outbox**
(`core/sync`, drift-backed) and returns an optimistic pending invoice instead of
failing. `ContributionOutboxHandler` replays it and `SyncService` flushes the
queue on reconnect (idempotency-keyed). The shell shows `KpOfflineBanner`.

## Scope / deferred
Wallet pay-from-balance (needs the `money` feature). Backend endpoints:
`invoice`, `invoice/create`, `pocket/invoices`, `payment/status/update`,
`adashi/{id}/contribute`.
