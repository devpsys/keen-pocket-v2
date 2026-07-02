import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/network/connectivity_checker.dart';
import 'package:keenpockets/features/friends/data/datasources/referrals_remote_datasource.dart';
import 'package:keenpockets/features/friends/data/dtos/referral_dto.dart';
import 'package:keenpockets/features/friends/data/repositories/referrals_repository_impl.dart';
import 'package:keenpockets/features/friends/domain/entities/referral.dart';
import 'package:mocktail/mocktail.dart';

class _MockRemote extends Mock implements ReferralsRemoteDataSource {}

class _MockConnectivity extends Mock implements ConnectivityChecker {}

const _dto = ReferralDto(
  inviteUrl: 'keenpocket.app/ref/kevin9921',
  inviteCode: 'KEEN-9921',
  stats: ReferralStatsDto(
    invited: 8,
    qualified: 3,
    rewarded: 1,
    earned: 150000,
  ),
  circle: [
    ReferralEntryDto(
      id: 'r1',
      name: 'Tunde Adebayo',
      joinedLabel: 'Joined 2 days ago',
      status: 'rewarded',
      rewardAmount: '50 keens',
    ),
  ],
);

void main() {
  late _MockRemote remote;
  late _MockConnectivity connectivity;
  late ReferralsRepositoryImpl repository;

  setUp(() {
    remote = _MockRemote();
    connectivity = _MockConnectivity();
    repository = ReferralsRepositoryImpl(remote, connectivity);
  });

  test('returns NetworkFailure when offline', () async {
    when(() => connectivity.isConnected).thenAnswer((_) async => false);

    final result = await repository.getReferrals();

    expect(result.getLeft().toNullable(), isA<NetworkFailure>());
    verifyNever(() => remote.getReferrals());
  });

  test('flattens stats and maps the circle on success', () async {
    when(() => connectivity.isConnected).thenAnswer((_) async => true);
    when(() => remote.getReferrals()).thenAnswer((_) async => _dto);

    final r = (await repository.getReferrals()).toNullable();

    expect(r?.referralCode, 'KEEN-9921');
    expect(r?.invited, 8);
    expect(r?.circle.single.status, ReferralStatus.rewarded);
  });

  test('maps ServerException to ServerFailure', () async {
    when(() => connectivity.isConnected).thenAnswer((_) async => true);
    when(
      () => remote.getReferrals(),
    ).thenThrow(const ServerException('boom', statusCode: 500));

    final result = await repository.getReferrals();

    expect(result.getLeft().toNullable(), isA<ServerFailure>());
  });
}
