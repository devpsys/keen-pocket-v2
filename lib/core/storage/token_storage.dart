import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

/// Secure storage for authentication tokens.
///
/// Sensitive values MUST go here (Keychain/Keystore-backed), never in
/// SharedPreferences. Defined as an interface so the rest of the app does not
/// depend on `flutter_secure_storage` directly.
abstract interface class TokenStorage {
  Future<String?> readAccessToken();
  Future<String?> readRefreshToken();
  Future<void> saveTokens({required String accessToken, String? refreshToken});
  Future<void> clear();
}

@LazySingleton(as: TokenStorage)
class SecureTokenStorage implements TokenStorage {
  const SecureTokenStorage(this._storage);

  final FlutterSecureStorage _storage;

  static const _kAccessToken = 'kp.access_token';
  static const _kRefreshToken = 'kp.refresh_token';

  @override
  Future<String?> readAccessToken() => _storage.read(key: _kAccessToken);

  @override
  Future<String?> readRefreshToken() => _storage.read(key: _kRefreshToken);

  @override
  Future<void> saveTokens({
    required String accessToken,
    String? refreshToken,
  }) async {
    await _storage.write(key: _kAccessToken, value: accessToken);
    if (refreshToken != null) {
      await _storage.write(key: _kRefreshToken, value: refreshToken);
    }
  }

  @override
  Future<void> clear() async {
    await _storage.delete(key: _kAccessToken);
    await _storage.delete(key: _kRefreshToken);
  }
}
