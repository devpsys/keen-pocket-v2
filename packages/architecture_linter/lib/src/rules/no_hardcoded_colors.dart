import 'package:analyzer/error/error.dart' hide LintCode;
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

import '../utils/path_utils.dart';

/// Rejects raw colors (`Color(0xFF...)`, `Colors.blue`).
///
/// All colors must come from the design system (`KpColors` /
/// `context.colors`). See docs/design_system_guide.md.
class NoHardcodedColors extends DartLintRule {
  NoHardcodedColors() : super(code: _code);

  static const _code = LintCode(
    name: 'no_hardcoded_colors',
    problemMessage:
        'Hardcoded colors are forbidden. Use a design token '
        '(KpColors.* or context.colors.*).',
    correctionMessage:
        'Define the color in lib/core/design_system/colors and reference it '
        'through the theme/KpColors.',
    errorSeverity: ErrorSeverity.ERROR,
  );

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    if (!isLintableUiFile(resolver.path)) return;

    // Color(...), Color.fromARGB(...), Color.fromRGBO(...)
    context.registry.addInstanceCreationExpression((node) {
      if (node.constructorName.type.name.lexeme == 'Color') {
        reporter.atNode(node, _code);
      }
    });

    // Colors.blue, Colors.red.shade300 (prefix is `Colors`)
    context.registry.addPrefixedIdentifier((node) {
      if (node.prefix.name == 'Colors') {
        reporter.atNode(node, _code);
      }
    });
  }
}
