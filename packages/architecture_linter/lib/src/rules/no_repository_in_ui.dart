import 'package:analyzer/error/error.dart' hide LintCode;
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

import '../utils/path_utils.dart';

/// Rejects direct use of repository types inside the presentation layer.
///
/// UI must talk to a Bloc/Cubit, which talks to use cases, which talk to
/// repositories. A widget referencing a `*Repository` jumps two layers.
class NoRepositoryInUi extends DartLintRule {
  NoRepositoryInUi() : super(code: _code);

  static const _code = LintCode(
    name: 'no_repository_in_ui',
    problemMessage:
        'Presentation must not reference repositories directly. Depend on a '
        'Bloc/Cubit (which depends on use cases) instead.',
    correctionMessage:
        'Move the repository call into a use case and drive it from a '
        'Bloc/Cubit.',
    errorSeverity: ErrorSeverity.ERROR,
  );

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    if (!isPresentationFile(resolver.path) || isGeneratedFile(resolver.path)) {
      return;
    }

    context.registry.addNamedType((node) {
      final name = node.name.lexeme;
      if (name.endsWith('Repository')) {
        reporter.atNode(node, _code);
      }
    });
  }
}
