/// Public surface of the `auth` feature.
///
/// Other features and the composition root import **only** this barrel — never
/// a feature's `data/` or `presentation/` internals (enforced by the
/// `no_cross_feature_internal_import` lint). Export the feature's pages and the
/// `domain` surface (entities, repository interfaces, use cases, value objects)
/// that other features are allowed to depend on.
library;

// Domain surface (safe for inter-feature dependencies) + presentation entry
// points (route targets). Other features import only what is exported here.
export 'domain/entities/auth_user.dart';
export 'domain/repositories/auth_repository.dart';
export 'domain/usecases/login_usecase.dart';
export 'domain/usecases/logout_usecase.dart';
export 'domain/value_objects/email_address.dart';
export 'presentation/pages/login_page.dart';
