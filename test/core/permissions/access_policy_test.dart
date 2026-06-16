import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/permissions/access_policy.dart';
import 'package:keenpockets/core/session/session_user.dart';

void main() {
  test('reflects the session user capabilities', () {
    const user = SessionUser(
      id: '1',
      name: 'Ada',
      isSuperAdmin: true,
      canCreateSchool: true,
      kycVerified: true,
    );
    const policy = AccessPolicy(user);

    expect(policy.isAuthenticated, isTrue);
    expect(policy.isSuperAdmin, isTrue);
    expect(policy.canCreateSchool, isTrue);
    expect(policy.isKycVerified, isTrue);
  });

  test('denies everything for a null (signed-out) user', () {
    const policy = AccessPolicy(null);
    expect(policy.isAuthenticated, isFalse);
    expect(policy.isSuperAdmin, isFalse);
    expect(policy.canCreateSchool, isFalse);
    expect(policy.isKycVerified, isFalse);
  });
}
