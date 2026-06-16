import 'dart:convert';

import 'package:core/error/exceptions.dart';
import 'package:injectable/injectable.dart';
import 'package:keenpockets/core/storage/token_storage.dart';
import 'package:keenpockets/features/auth/data/dtos/auth_user_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Local authentication cache.
///
/// Tokens go to secure storage ([TokenStorage]); the (non-sensitive) user
/// profile is cached in [SharedPreferences] for fast cold-start rendering.
abstract interface class AuthLocalDataSource {
  Future<void> cacheSession({
    required String accessToken,
    String? refreshToken,
    required AuthUserDto user,
  });
  Future<AuthUserDto?> getCachedUser();
  Future<void> clear();
}

@LazySingleton(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  const AuthLocalDataSourceImpl(this._tokenStorage, this._prefs);

  final TokenStorage _tokenStorage;
  final SharedPreferences _prefs;

  static const _kCachedUser = 'kp.cached_user';

  @override
  Future<void> cacheSession({
    required String accessToken,
    String? refreshToken,
    required AuthUserDto user,
  }) async {
    try {
      await _tokenStorage.saveTokens(
        accessToken: accessToken,
        refreshToken: refreshToken,
      );
      await _prefs.setString(_kCachedUser, jsonEncode(user.toJson()));
    } catch (e, st) {
      throw CacheException(
        'Failed to persist session.',
        cause: e,
        stackTrace: st,
      );
    }
  }

  @override
  Future<AuthUserDto?> getCachedUser() async {
    try {
      final raw = _prefs.getString(_kCachedUser);
      if (raw == null) return null;
      return AuthUserDto.fromJson(jsonDecode(raw) as Map<String, dynamic>);
    } catch (e, st) {
      throw CacheException(
        'Failed to read cached user.',
        cause: e,
        stackTrace: st,
      );
    }
  }

  @override
  Future<void> clear() async {
    await _tokenStorage.clear();
    await _prefs.remove(_kCachedUser);
  }
}
