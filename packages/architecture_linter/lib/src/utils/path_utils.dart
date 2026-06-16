/// Helpers for reasoning about which Clean Architecture layer a file belongs to.
///
/// Paths are normalized to forward slashes so the same logic works on Windows
/// and POSIX.
library;

String _normalize(String path) => path.replaceAll(r'\', '/');

/// Files where design tokens are *defined* — exempt from "no hardcoded value"
/// rules because this is the single allowed source of raw colors/sizes/etc.
bool isDesignSystemFile(String path) =>
    _normalize(path).contains('/core/design_system/');

/// Generated files — never linted.
bool isGeneratedFile(String path) {
  final p = _normalize(path);
  return p.endsWith('.g.dart') ||
      p.endsWith('.freezed.dart') ||
      p.endsWith('.config.dart') ||
      p.endsWith('.gen.dart') ||
      p.contains('/generated/') ||
      p.contains('/l10n/');
}

/// Test files — exempt from UI-token rules but still covered by layering rules.
bool isTestFile(String path) {
  final p = _normalize(path);
  return p.endsWith('_test.dart') || p.contains('/test/');
}

/// True for files inside any feature's `presentation/` directory.
bool isPresentationFile(String path) =>
    _normalize(path).contains('/presentation/');

/// True for files inside any feature's `data/` directory.
bool isDataFile(String path) => _normalize(path).contains('/data/');

/// True for files allowed to construct/own the networking client
/// (the centralized network module and data sources).
bool isNetworkLayerFile(String path) {
  final p = _normalize(path);
  return p.contains('/core/network/') || p.contains('/datasources/');
}

/// True for files where raw Dart UI primitives may legitimately appear and the
/// token rules should be skipped entirely.
bool isLintableUiFile(String path) =>
    !isGeneratedFile(path) && !isDesignSystemFile(path) && !isTestFile(path);
