.PHONY: setup gen watch format analyze lint test coverage verify hooks

setup: ## Install deps + git hooks
	flutter pub get
	bash scripts/install_hooks.sh

gen: ## Run code generation (freezed/json/injectable/l10n)
	bash scripts/generate.sh

watch: ## Continuous code generation
	bash scripts/watch.sh

format: ## Format all Dart code
	dart format .

analyze: ## Static analysis
	flutter analyze

lint: ## Architecture (custom_lint) checks
	dart run custom_lint

test: ## Run tests
	flutter test

coverage: ## Run tests with coverage + threshold (overall >= 70%, per blueprint)
	flutter test --coverage
	bash scripts/check_coverage.sh 70

verify: ## Full local quality gate (mirrors CI)
	bash scripts/verify.sh

hooks: ## Install git hooks
	bash scripts/install_hooks.sh
