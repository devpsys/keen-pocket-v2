import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

/// Abstracts "is the device online?" so it can be faked in tests and so the app
/// doesn't depend on `connectivity_plus` outside this file.
abstract interface class ConnectivityChecker {
  Future<bool> get isConnected;
}

@LazySingleton(as: ConnectivityChecker)
class ConnectivityCheckerImpl implements ConnectivityChecker {
  const ConnectivityCheckerImpl(this._connectivity);

  final Connectivity _connectivity;

  @override
  Future<bool> get isConnected async {
    final results = await _connectivity.checkConnectivity();
    return results.any((r) => r != ConnectivityResult.none);
  }
}
