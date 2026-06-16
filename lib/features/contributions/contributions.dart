/// Public surface of the `contributions` feature — the shared ledger consumed
/// by `pockets` and `adashi`. Other features import only this barrel.
library;

export 'domain/entities/invoice.dart';
export 'domain/repositories/contribution_repository.dart';
export 'domain/usecases/get_invoices.dart';
export 'domain/usecases/submit_contribution.dart';
export 'domain/usecases/verify_contribution.dart';
export 'domain/value_objects/contribution_context.dart';
export 'presentation/pages/contribute_page.dart';
export 'presentation/pages/invoice_history_page.dart';
