import 'package:analyzer/error/error.dart' hide LintCode;
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

import '../utils/path_utils.dart';

/// Rejects importing another feature's *internals* (`data/` or `presentation/`).
///
/// A feature may depend on another feature ONLY through its public surface:
/// the feature barrel (`features/<f>/<f>.dart`) or its `domain/` layer
/// (entities, repository interfaces, use cases, value objects). Reaching into
/// another feature's `data`/`presentation` couples implementation details.
class NoCrossFeatureInternalImport extends DartLintRule {
  NoCrossFeatureInternalImport() : super(code: _code);

  static const _code = LintCode(
    name: 'no_cross_feature_internal_import',
    problemMessage:
        'Do not import another feature\'s data/presentation internals. Depend '
        'on its public barrel or its domain layer instead.',
    correctionMessage:
        'Import features/<other>/<other>.dart or features/<other>/domain/… '
        '(entities, repository interfaces, use cases).',
    errorSeverity: ErrorSeverity.ERROR,
  );

  /// Returns the feature name that owns [path], or null if not under features/.
  String? _featureOf(String path) {
    final p = path.replaceAll(r'\', '/');
    final i = p.indexOf('/features/');
    if (i < 0) return null;
    final rest = p.substring(i + '/features/'.length);
    final slash = rest.indexOf('/');
    return slash < 0 ? rest : rest.substring(0, slash);
  }

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    final currentFeature = _featureOf(resolver.path);
    if (currentFeature == null || isGeneratedFile(resolver.path)) return;

    context.registry.addImportDirective((node) {
      final uri = node.uri.stringValue;
      if (uri == null) return;
      final normalized = uri.replaceAll(r'\', '/');
      if (!normalized.contains('/features/')) return;

      final targetFeature = _featureOf(normalized);
      if (targetFeature == null || targetFeature == currentFeature) return;

      final after = normalized.split('/features/$targetFeature/').last;
      if (after.startsWith('data/') || after.startsWith('presentation/')) {
        reporter.atNode(node, _code);
      }
    });
  }
}
