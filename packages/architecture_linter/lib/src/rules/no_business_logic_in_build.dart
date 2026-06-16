import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/error/error.dart' hide LintCode;
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

import '../utils/path_utils.dart';

/// Flags imperative business logic inside `build()` methods.
///
/// `build` should be a pure description of UI. Loops, local function
/// declarations and try/catch blocks are signals that logic belongs in a
/// Bloc/Cubit or use case instead.
class NoBusinessLogicInBuild extends DartLintRule {
  NoBusinessLogicInBuild() : super(code: _code);

  static const _code = LintCode(
    name: 'no_business_logic_in_build',
    problemMessage:
        'build() should only describe UI. Move loops, local functions and '
        'error handling into a Bloc/Cubit or use case.',
    correctionMessage:
        'Compute state outside build() and read it via context.watch / '
        'BlocBuilder.',
    errorSeverity: ErrorSeverity.WARNING,
  );

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    if (isGeneratedFile(resolver.path)) return;

    context.registry.addMethodDeclaration((node) {
      if (node.name.lexeme != 'build') return;
      final body = node.body;
      if (body is! BlockFunctionBody) return;

      final visitor = _LogicVisitor();
      body.block.visitChildren(visitor);
      for (final offender in visitor.offenders) {
        reporter.atNode(offender, _code);
      }
    });
  }
}

/// Collects nodes that represent imperative logic, without descending into
/// nested closures (those have their own scope and are acceptable callbacks).
class _LogicVisitor extends RecursiveAstVisitor<void> {
  final List<AstNode> offenders = [];

  @override
  void visitForStatement(ForStatement node) {
    offenders.add(node);
    super.visitForStatement(node);
  }

  @override
  void visitWhileStatement(WhileStatement node) {
    offenders.add(node);
    super.visitWhileStatement(node);
  }

  @override
  void visitDoStatement(DoStatement node) {
    offenders.add(node);
    super.visitDoStatement(node);
  }

  @override
  void visitTryStatement(TryStatement node) {
    offenders.add(node);
    super.visitTryStatement(node);
  }

  @override
  void visitFunctionDeclarationStatement(FunctionDeclarationStatement node) {
    offenders.add(node);
    // Don't recurse into the local function body.
  }
}
