import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

/// Abstracts connectivity so it can be faked in tests and so the app doesn't
/// depend on `connectivity_plus` outside this file.
abstract interface class ConnectivityChecker {
  /// One-shot check.
  Future<bool> get isConnected;

  /// Emits `true`/`false` as connectivity changes (drives the sync service and
  /// the offline banner).
  Stream<bool> get onStatusChanged;
}

@LazySingleton(as: ConnectivityChecker)
class ConnectivityCheckerImpl implements ConnectivityChecker {
  const ConnectivityCheckerImpl(this._connectivity);

  final Connectivity _connectivity;

  @override
  Future<bool> get isConnected async {
    final results = await _connectivity.checkConnectivity();
    return _isOnline(results);
  }

  @override
  Stream<bool> get onStatusChanged =>
      _connectivity.onConnectivityChanged.map(_isOnline);

  bool _isOnline(List<ConnectivityResult> results) =>
      results.any((r) => r != ConnectivityResult.none);
}
