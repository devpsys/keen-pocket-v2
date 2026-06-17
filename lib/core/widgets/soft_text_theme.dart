import 'package:flutter/material.dart';

/// Returns [t] with every text style one font-weight step lighter, to dial back
/// the design-system's chunky defaults on a given page subtree.
///
/// Wrap a page in `Theme(data: theme.copyWith(textTheme: softenTextWeights(...)))`
/// so all descendant `context.textTheme.*` reads pick up the softened weights.
TextTheme softenTextWeights(TextTheme t) => TextTheme(
  displayLarge: _soft(t.displayLarge),
  displayMedium: _soft(t.displayMedium),
  displaySmall: _soft(t.displaySmall),
  headlineLarge: _soft(t.headlineLarge),
  headlineMedium: _soft(t.headlineMedium),
  headlineSmall: _soft(t.headlineSmall),
  titleLarge: _soft(t.titleLarge),
  titleMedium: _soft(t.titleMedium),
  titleSmall: _soft(t.titleSmall),
  bodyLarge: _soft(t.bodyLarge),
  bodyMedium: _soft(t.bodyMedium),
  bodySmall: _soft(t.bodySmall),
  labelLarge: _soft(t.labelLarge),
  labelMedium: _soft(t.labelMedium),
  labelSmall: _soft(t.labelSmall),
);

final _lighter = <FontWeight, FontWeight>{
  FontWeight.w900: FontWeight.w800,
  FontWeight.w800: FontWeight.w700,
  FontWeight.w700: FontWeight.w600,
  FontWeight.w600: FontWeight.w500,
  FontWeight.w500: FontWeight.w400,
};

TextStyle? _soft(TextStyle? s) => s?.fontWeight == null
    ? s
    : s!.copyWith(fontWeight: _lighter[s.fontWeight] ?? s.fontWeight);
