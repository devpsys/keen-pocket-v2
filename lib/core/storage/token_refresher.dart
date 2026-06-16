/// Refreshes the access token using the refresh token.
///
/// Implemented by the `auth` feature (it knows the refresh endpoint) and wired
/// into [AuthInterceptor] so a 401 transparently refreshes and retries once
/// before forcing a logout. Left unregistered until the auth feature provides
/// an implementation — in which case [AuthInterceptor] simply clears the
/// session on 401.
abstract interface class TokenRefresher {
  /// Attempts to obtain and persist a new access token.
  /// Returns true on success (new token stored), false otherwise.
  Future<bool> refresh();
}
