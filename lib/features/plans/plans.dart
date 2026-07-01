/// Public surface of the `plans` feature (built dark). Other features import
/// only this barrel (domain + pages) — never `data/` or `presentation/` internals.
library;

export 'domain/entities/plan.dart';
export 'domain/repositories/plans_repository.dart';
export 'domain/usecases/get_plans.dart';
export 'presentation/pages/plans_page.dart';
export 'presentation/view_models/plan_view.dart' hide PlanCadence;
