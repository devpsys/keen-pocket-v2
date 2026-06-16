import 'package:analyzer/error/error.dart' hide LintCode;
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

import '../utils/path_utils.dart';

/// Rejects `Dio()` construction outside the centralized network module.
///
/// Exactly one `Dio` instance is created (and DI-registered) in
/// `core/network`. Everything else receives it by injection.
class NoNewDioInstance extends DartLintRule {
  NoNewDioInstance() : super(code: _code);

  static const _code = LintCode(
    name: 'no_new_dio_instance',
    problemMessage:
        'Do not instantiate Dio. Inject the single Dio configured in '
        'core/network instead.',
    correctionMessage:
        'Request Dio via constructor injection (GetIt provides the '
        'centralized instance).',
    errorSeverity: ErrorSeverity.ERROR,
  );

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    final path = resolver.path;
    if (isGeneratedFile(path)) return;
    // The network module is the one place allowed to build the client.
    if (path.replaceAll(r'\', '/').contains('/core/network/')) return;

    context.registry.addInstanceCreationExpression((node) {
      if (node.constructorName.type.name.lexeme == 'Dio') {
        reporter.atNode(node, _code);
      }
    });
  }
}
