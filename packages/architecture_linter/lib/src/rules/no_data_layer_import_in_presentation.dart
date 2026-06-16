import 'package:analyzer/error/error.dart' hide LintCode;
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

import '../utils/path_utils.dart';

/// Rejects imports of the `data/` layer from within `presentation/`.
///
/// Presentation may depend only on `domain/`. The dependency rule points
/// inward: presentation -> domain <- data.
class NoDataLayerImportInPresentation extends DartLintRule {
  NoDataLayerImportInPresentation() : super(code: _code);

  static const _code = LintCode(
    name: 'no_data_layer_import_in_presentation',
    problemMessage:
        'Presentation cannot import the data layer. Depend on domain '
        'abstractions instead.',
    correctionMessage:
        'Import from domain/ (entities, repository interfaces, use cases) '
        'rather than data/.',
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

    context.registry.addImportDirective((node) {
      final uri = node.uri.stringValue;
      if (uri == null) return;
      final normalized = uri.replaceAll(r'\', '/');
      if (normalized.contains('/data/') ||
          normalized.contains('data/datasources/') ||
          normalized.contains('data/models/') ||
          normalized.contains('data/repositories/') ||
          normalized.contains('data/mappers/')) {
        reporter.atNode(node, _code);
      }
    });
  }
}
