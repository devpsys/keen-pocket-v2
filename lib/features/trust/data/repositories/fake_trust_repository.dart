import 'package:core/core.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/trust/domain/entities/trust_profile.dart';
import 'package:keenpockets/features/trust/domain/repositories/trust_repository.dart';

/// Dev-only stub so the trust screen renders without a backend. Mirrors the old
/// presentation fixtures. `prod`/`staging` use [TrustRepositoryImpl].
@LazySingleton(as: TrustRepository, env: ['dev'])
class FakeTrustRepository implements TrustRepository {
  const FakeTrustRepository();

  static const _avatar =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuDjDKsLw2rN6thhRpxeLZCxCiSAnH4K_S5yZqOzEoyT9-C_bPM2K6_ETb4IADeI_-pDugglDAVL8r3LKJ_dYVnP1np2iYwUaSIDgK8SiOHujnWg9damOkAXCxi9Kb7rFxWhEz1SBHVlc1-CH_JOuKCBhAn5eidwysP6L3NFxoRUeAx91meTauiV29PDqGhi1V6yPQUPcIawsIrXyTFD-YP2L3SNUsG6cxhMJGJ7gwFbkUUHBcMMTzpy1pwDpdK1FqJEzZwwdgAIzZE';
  static const _raters = <String>[
    'https://lh3.googleusercontent.com/aida-public/AB6AXuChzcvRj8VCvJN0y-zvuzFpg0IHgZN3fDHVeJlHxOA64h2Jvqj3JabO67KCCdZDuPUOjSzj9uz7mMziqJh0IalfT7EjYa7Q03qKtejwBKg5mHr_hmIsmSEA5WyFktcwb6M14lEhdXmrOmn8n0c_B6yO0nZBpGPhJr9hjQhul8YYuMdwe-gOgSSHjmtYA54IJNduvFzFxnhuxq0hzgYW2tI7II_e20neOiqPfXPpONVu_x6rCSM9bTUHyKhP2vMzUEFZNu5rHWMh644',
    'https://lh3.googleusercontent.com/aida-public/AB6AXuDrDmsCCUgv_1sjm9qactYEFXUNRweIjUHS_sC3309NlQ7WmL2MkqGgaXvbMoImS1oEH12jT0DKhO9ctxTiqELMuJMUc6iBEfZv3aMQxqCDso9H_oKwZpVn3fEy_ZWHAl-hSy0nVIqAfX5WrBEOXHd71qI8IM1YExc3fbIrJjwcE0wllK5P6DjAf-Un806K9qNmnKgwKmgNylniuOLB5zPBvKpShPfpagrkonUgqzofepZLWYjfOAo8Ykxy7yHwCnlHYAUilwqTTIU',
    'https://lh3.googleusercontent.com/aida-public/AB6AXuCUDoh73WAclW7LAJh9If3-HBWjxNM9HUn-b0AyrRK0-fbEU9C8j0BDA4d-D6C8u47aA3NqAvfXb4wmMPlRxBIR5ucPsVZGKR8u_KywDquT7bBM1FwKfat8SN0CoO7xMIUWJ-enlUjOMnSSkoXoPMKrXJXr_WcpTnwOxJ1L1aCUcpe8RNjruQgF-TkF5dY_kJ7tzQ2SlKkUcWCkz7QmHO-QbejoDOdtjgC0uzx9Wv3fSnaEt0K-dOgYjM86TnT-5WLgAzFTcp23ew8',
  ];

  @override
  Future<Result<TrustProfile>> getMyTrust() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return Right(
      TrustProfile(
        score: 82,
        band: 'Keen Pioneer',
        kycVerified: true,
        memberName: 'Alex Rivera',
        memberSince: 'Jan 2023',
        rank: 'Top 5% Contributor',
        avatarUrl: _avatar,
        paymentReliability: 98,
        pocketsJoined: 12,
        adashisCompleted: 5,
        avgRating: 4.9,
        ratings: [
          Rating(
            author: 'Sarah J.',
            stars: 5,
            comment:
                '"Great organizer, very transparent! Always keeps the '
                'pocket updated on schedules."',
            context: 'ADASHI #4 • AUGUST 2023',
            avatarUrl: _raters[0],
          ),
          Rating(
            author: 'Marcus T.',
            stars: 5,
            comment:
                '"Reliable and prompt. Would join a pocket with Alex again '
                'any time!"',
            context: 'TRAVEL POCKET • JULY 2023',
            avatarUrl: _raters[1],
          ),
          Rating(
            author: 'Lin W.',
            stars: 5,
            comment:
                '"Highly recommend for first-time pocket members. Very '
                'helpful guidance."',
            context: 'DORM POCKET • MAY 2023',
            avatarUrl: _raters[2],
          ),
        ],
      ),
    );
  }
}
