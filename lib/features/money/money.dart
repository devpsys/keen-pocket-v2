/// Public surface of the `money` feature. Other features import only this
/// barrel (domain + pages) — never `data/` or `presentation/` internals.
library;

export 'domain/entities/payout.dart';
export 'domain/entities/wallet.dart';
export 'domain/repositories/payouts_repository.dart';
export 'domain/repositories/wallet_repository.dart';
export 'domain/usecases/get_payouts.dart';
export 'domain/usecases/get_wallet.dart';
export 'presentation/pages/payouts_hub_page.dart';
export 'presentation/pages/wallet_page.dart';
export 'presentation/view_models/bank_account_view.dart';
export 'presentation/view_models/wallet_view.dart'
    hide WalletTxnKind, WalletTxnStatus;
export 'presentation/widgets/bank_accounts_list.dart';
export 'presentation/widgets/payout_account_selector.dart';
