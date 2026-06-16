import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/error/error.dart' hide LintCode;
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

import '../utils/path_utils.dart';

/// Rejects arbitrary spacing values (`SizedBox(height: 12)`,
/// `EdgeInsets.all(16)`).
///
/// Spacing must come from `AppSpacing` tokens. See docs/design_system_guide.md.
class NoArbitrarySpacing extends DartLintRule {
  NoArbitrarySpacing() : super(code: _code);

  static const _code = LintCode(
    name: 'no_arbitrary_spacing',
    problemMessage:
        'Arbitrary spacing is forbidden. Use AppSpacing tokens '
        '(e.g. AppSpacing.m) instead of raw numbers.',
    correctionMessage:
        'Replace the literal with a token from '
        'lib/core/design_system/spacing.',
    errorSeverity: ErrorSeverity.ERROR,
  );

  static const _edgeInsetsCtors = {'all', 'symmetric', 'only', 'fromLTRB'};

  bool _isRawNumber(Expression? expr) =>
      expr is IntegerLiteral && expr.value != 0 ||
      expr is DoubleLiteral && expr.value != 0;

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    if (!isLintableUiFile(resolver.path)) return;

    context.registry.addInstanceCreationExpression((node) {
      final typeName = node.constructorName.type.name.lexeme;
      final ctorName = node.constructorName.name?.name;

      if (typeName == 'SizedBox') {
        for (final arg in node.argumentList.arguments) {
          if (arg is NamedExpression &&
              (arg.name.label.name == 'height' ||
                  arg.name.label.name == 'width') &&
              _isRawNumber(arg.expression)) {
            reporter.atNode(arg, _code);
          }
        }
      } else if (typeName == 'EdgeInsets' &&
          _edgeInsetsCtors.contains(ctorName)) {
        for (final arg in node.argumentList.arguments) {
          final value = arg is NamedExpression ? arg.expression : arg;
          if (_isRawNumber(value)) {
            reporter.atNode(arg, _code);
          }
        }
      }
    });
  }
}
