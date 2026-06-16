import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/session/session_manager.dart';
import 'package:keenpockets/core/session/session_user.dart';

void main() {
  const user = SessionUser(id: '1', name: 'Ada', isSuperAdmin: true);

  test('starts in the unknown state with no user', () {
    final sm = SessionManager();
    expect(sm.status, AuthStatus.unknown);
    expect(sm.currentUser, isNull);
    sm.dispose();
  });

  test('startSession then endSession emits the transitions', () async {
    final sm = SessionManager();
    final emitted = <AuthStatus>[];
    final sub = sm.changes.listen(emitted.add);

    sm.startSession(user);
    expect(sm.status, AuthStatus.authenticated);
    expect(sm.currentUser, user);

    sm.endSession();
    expect(sm.status, AuthStatus.unauthenticated);
    expect(sm.currentUser, isNull);

    await Future<void>.delayed(Duration.zero);
    expect(emitted, [AuthStatus.authenticated, AuthStatus.unauthenticated]);

    await sub.cancel();
    sm.dispose();
  });

  test('updateUser only applies while authenticated', () {
    final sm = SessionManager()..updateUser(user);
    expect(sm.currentUser, isNull); // ignored when not authenticated

    sm
      ..startSession(user)
      ..updateUser(user.copyWith(name: 'Ada Lovelace'));
    expect(sm.currentUser?.name, 'Ada Lovelace');
    sm.dispose();
  });

  group('SessionUser', () {
    test('copyWith and value equality', () {
      expect(user.copyWith(), user);
      expect(user.copyWith(name: 'X').name, 'X');
      expect(user.copyWith(name: 'X'), isNot(user));
    });
  });
}
