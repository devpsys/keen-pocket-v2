import 'package:analyzer/error/error.dart' hide LintCode;
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

import '../utils/path_utils.dart';

/// Rejects networking imports outside the data/network layers.
///
/// Only repositories/data sources (and the centralized network module) may
/// perform API calls. Presentation and domain must never import an HTTP client.
class NoDirectHttpInUi extends DartLintRule {
  NoDirectHttpInUi() : super(code: _code);

  static const _code = LintCode(
    name: 'no_direct_http_in_ui',
    problemMessage:
        'Direct HTTP access is only allowed in data sources / the network '
        'module. Go through a use case + repository.',
    correctionMessage:
        'Expose the call from a repository and consume it via a use case.',
    errorSeverity: ErrorSeverity.ERROR,
  );

  static const _networkPackages = {'dio', 'http'};

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    final path = resolver.path;
    if (isGeneratedFile(path) || isNetworkLayerFile(path)) return;
    // Only police the layers that must stay transport-agnostic.
    if (!isPresentationFile(path) &&
        !path.replaceAll(r'\', '/').contains('/domain/')) {
      return;
    }

    context.registry.addImportDirective((node) {
      final uri = node.uri.stringValue;
      if (uri == null) return;
      final isDartHttp = uri == 'dart:io' || uri == 'dart:html';
      final pkg = uri.startsWith('package:')
          ? uri.substring('package:'.length).split('/').first
          : null;
      if (isDartHttp || (pkg != null && _networkPackages.contains(pkg))) {
        reporter.atNode(node, _code);
      }
    });
  }
}
