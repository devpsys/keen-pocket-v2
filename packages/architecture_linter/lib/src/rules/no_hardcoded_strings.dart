import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/error/error.dart' hide LintCode;
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

import '../utils/path_utils.dart';

/// Rejects user-facing string literals (e.g. `Text('Login')`).
///
/// All visible text must come from the localization layer
/// (`context.l10n.<key>`). See docs/localization_guide.md.
class NoHardcodedStrings extends DartLintRule {
  NoHardcodedStrings() : super(code: _code);

  static const _code = LintCode(
    name: 'no_hardcoded_strings',
    problemMessage:
        'User-facing strings must be localized. Use context.l10n.<key> '
        'instead of a hardcoded literal.',
    correctionMessage:
        'Add the string to lib/core/localization/arb/app_en.arb and reference '
        'it via context.l10n.',
    errorSeverity: ErrorSeverity.ERROR,
  );

  static final _hasLetters = RegExp(r'[A-Za-z]');

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    if (!isLintableUiFile(resolver.path)) return;

    context.registry.addInstanceCreationExpression((node) {
      final typeName = node.constructorName.type.name.lexeme;
      if (typeName != 'Text') return;

      final args = node.argumentList.arguments;
      if (args.isEmpty) return;
      final first = args.first;

      // Only flag plain literals; interpolations may be dynamic and are
      // expected to be composed from already-localized fragments.
      if (first is SimpleStringLiteral && _hasLetters.hasMatch(first.value)) {
        reporter.atNode(first, _code);
      } else if (first is AdjacentStrings) {
        reporter.atNode(first, _code);
      }
    });
  }
}
