import 'dart:async';

import 'package:injectable/injectable.dart';

import 'session_user.dart';

/// Global authentication state.
enum AuthStatus { unknown, authenticated, unauthenticated }

/// Single source of truth for "who is logged in". The router guard listens to
/// [changes]; features read [currentUser]. Hydrated by `auth` after login and
/// cleared on logout / 401.
@lazySingleton
class SessionManager {
  final StreamController<AuthStatus> _controller =
      StreamController<AuthStatus>.broadcast();

  SessionUser? _user;
  AuthStatus _status = AuthStatus.unknown;

  SessionUser? get currentUser => _user;
  AuthStatus get status => _status;

  /// Emits on every transition (unknown → authenticated/unauthenticated …).
  Stream<AuthStatus> get changes => _controller.stream;

  void startSession(SessionUser user) {
    _user = user;
    _status = AuthStatus.authenticated;
    _controller.add(_status);
  }

  void updateUser(SessionUser user) {
    if (_status != AuthStatus.authenticated) return;
    _user = user;
  }

  void endSession() {
    _user = null;
    _status = AuthStatus.unauthenticated;
    _controller.add(_status);
  }

  @disposeMethod
  void dispose() => _controller.close();
}
