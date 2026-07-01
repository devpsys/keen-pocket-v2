// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../features/adashi/presentation/cubit/adashi_detail_cubit.dart'
    as _i449;
import '../../features/adashi/presentation/cubit/adashi_list_cubit.dart'
    as _i885;
import '../../features/adashi/presentation/cubit/adashi_manage_cubit.dart'
    as _i458;
import '../../features/adashi/presentation/cubit/adashi_rotation_cubit.dart'
    as _i777;
import '../../features/administration/presentation/cubit/admin_cubit.dart'
    as _i842;
import '../../features/administration/presentation/cubit/organiser_cubit.dart'
    as _i407;
import '../../features/auth/data/datasources/auth_local_datasource.dart'
    as _i992;
import '../../features/auth/data/datasources/auth_remote_datasource.dart'
    as _i161;
import '../../features/auth/data/datasources/fake_auth_remote_datasource.dart'
    as _i44;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i153;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i787;
import '../../features/auth/domain/usecases/login_usecase.dart' as _i188;
import '../../features/auth/domain/usecases/logout_usecase.dart' as _i48;
import '../../features/auth/presentation/bloc/auth_bloc.dart' as _i797;
import '../../features/charity/data/datasources/charity_remote_datasource.dart'
    as _i5;
import '../../features/charity/data/repositories/charity_repository_impl.dart'
    as _i227;
import '../../features/charity/data/repositories/fake_charity_repository.dart'
    as _i719;
import '../../features/charity/domain/repositories/charity_repository.dart'
    as _i560;
import '../../features/charity/domain/usecases/get_charity_drive.dart'
    as _i1059;
import '../../features/charity/presentation/cubit/charity_cubit.dart' as _i402;
import '../../features/contributions/data/datasources/contribution_remote_datasource.dart'
    as _i158;
import '../../features/contributions/data/repositories/contribution_repository_impl.dart'
    as _i971;
import '../../features/contributions/data/sync/contribution_outbox_handler.dart'
    as _i559;
import '../../features/contributions/domain/repositories/contribution_repository.dart'
    as _i128;
import '../../features/contributions/domain/usecases/get_invoices.dart'
    as _i726;
import '../../features/contributions/domain/usecases/submit_contribution.dart'
    as _i366;
import '../../features/contributions/domain/usecases/verify_contribution.dart'
    as _i995;
import '../../features/contributions/presentation/cubit/contribute_cubit.dart'
    as _i902;
import '../../features/contributions/presentation/cubit/invoice_history_cubit.dart'
    as _i813;
import '../../features/dashboard/presentation/cubit/dashboard_cubit.dart'
    as _i24;
import '../../features/discovery/presentation/cubit/discovery_cubit.dart'
    as _i953;
import '../../features/friends/presentation/cubit/friends_cubit.dart' as _i135;
import '../../features/gamification/presentation/cubit/achievements_cubit.dart'
    as _i947;
import '../../features/gamification/presentation/cubit/leaderboard_cubit.dart'
    as _i964;
import '../../features/group_collaboration/presentation/cubit/disputes_hub_cubit.dart'
    as _i889;
import '../../features/group_collaboration/presentation/cubit/group_chat_cubit.dart'
    as _i228;
import '../../features/money/data/datasources/payouts_remote_datasource.dart'
    as _i1073;
import '../../features/money/data/datasources/wallet_remote_datasource.dart'
    as _i646;
import '../../features/money/data/repositories/fake_payouts_repository.dart'
    as _i880;
import '../../features/money/data/repositories/fake_wallet_repository.dart'
    as _i511;
import '../../features/money/data/repositories/payouts_repository_impl.dart'
    as _i415;
import '../../features/money/data/repositories/wallet_repository_impl.dart'
    as _i522;
import '../../features/money/domain/repositories/payouts_repository.dart'
    as _i565;
import '../../features/money/domain/repositories/wallet_repository.dart'
    as _i724;
import '../../features/money/domain/usecases/get_payouts.dart' as _i763;
import '../../features/money/domain/usecases/get_wallet.dart' as _i1031;
import '../../features/money/presentation/cubit/payouts_cubit.dart' as _i334;
import '../../features/money/presentation/cubit/wallet_cubit.dart' as _i868;
import '../../features/notifications/data/datasources/notifications_remote_datasource.dart'
    as _i937;
import '../../features/notifications/data/repositories/fake_notifications_repository.dart'
    as _i315;
import '../../features/notifications/data/repositories/notifications_repository_impl.dart'
    as _i201;
import '../../features/notifications/domain/repositories/notifications_repository.dart'
    as _i563;
import '../../features/notifications/domain/usecases/get_notifications.dart'
    as _i163;
import '../../features/notifications/domain/usecases/mark_all_read.dart'
    as _i1050;
import '../../features/notifications/presentation/cubit/notifications_cubit.dart'
    as _i405;
import '../../features/plans/data/datasources/plans_remote_datasource.dart'
    as _i759;
import '../../features/plans/data/repositories/fake_plans_repository.dart'
    as _i424;
import '../../features/plans/data/repositories/plans_repository_impl.dart'
    as _i867;
import '../../features/plans/domain/repositories/plans_repository.dart'
    as _i361;
import '../../features/plans/domain/usecases/get_plans.dart' as _i187;
import '../../features/plans/presentation/cubit/plans_cubit.dart' as _i602;
import '../../features/pockets/data/datasources/pocket_remote_datasource.dart'
    as _i822;
import '../../features/pockets/data/repositories/fake_pocket_repository.dart'
    as _i297;
import '../../features/pockets/data/repositories/pocket_repository_impl.dart'
    as _i915;
import '../../features/pockets/domain/repositories/pocket_repository.dart'
    as _i922;
import '../../features/pockets/domain/usecases/get_my_pockets.dart' as _i890;
import '../../features/pockets/domain/usecases/get_pocket_detail.dart' as _i523;
import '../../features/pockets/presentation/cubit/pocket_detail_cubit.dart'
    as _i563;
import '../../features/pockets/presentation/cubit/pockets_cubit.dart' as _i229;
import '../../features/profile/data/datasources/profile_remote_datasource.dart'
    as _i327;
import '../../features/profile/data/repositories/fake_profile_repository.dart'
    as _i850;
import '../../features/profile/data/repositories/profile_repository_impl.dart'
    as _i334;
import '../../features/profile/domain/repositories/profile_repository.dart'
    as _i894;
import '../../features/profile/domain/usecases/get_profile.dart' as _i72;
import '../../features/profile/presentation/cubit/profile_cubit.dart' as _i36;
import '../../features/school/presentation/cubit/children_cubit.dart' as _i216;
import '../../features/school/presentation/cubit/school_cubit.dart' as _i917;
import '../../features/trust/data/datasources/trust_remote_datasource.dart'
    as _i485;
import '../../features/trust/data/repositories/fake_trust_repository.dart'
    as _i1004;
import '../../features/trust/data/repositories/trust_repository_impl.dart'
    as _i842;
import '../../features/trust/domain/repositories/trust_repository.dart'
    as _i684;
import '../../features/trust/domain/usecases/get_trust_profile.dart' as _i943;
import '../../features/trust/presentation/cubit/trust_cubit.dart' as _i756;
import '../config/app_config.dart' as _i650;
import '../feature_flags/feature_flag_service.dart' as _i349;
import '../network/connectivity_checker.dart' as _i402;
import '../network/network_module.dart' as _i200;
import '../session/session_manager.dart' as _i432;
import '../storage/database/app_database.dart' as _i406;
import '../storage/token_storage.dart' as _i973;
import '../sync/drift_outbox_store.dart' as _i904;
import '../sync/outbox_store.dart' as _i55;
import '../sync/sync_service.dart' as _i520;

const String _dev = 'dev';
const String _prod = 'prod';
const String _staging = 'staging';

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final networkModule = _$NetworkModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => networkModule.sharedPreferences,
      preResolve: true,
    );
    gh.factory<_i449.AdashiDetailCubit>(() => _i449.AdashiDetailCubit());
    gh.factory<_i885.AdashiListCubit>(() => _i885.AdashiListCubit());
    gh.factory<_i458.AdashiManageCubit>(() => _i458.AdashiManageCubit());
    gh.factory<_i777.AdashiRotationCubit>(() => _i777.AdashiRotationCubit());
    gh.factory<_i407.OrganiserCubit>(() => _i407.OrganiserCubit());
    gh.factory<_i953.DiscoveryCubit>(() => _i953.DiscoveryCubit());
    gh.factory<_i135.FriendsCubit>(() => _i135.FriendsCubit());
    gh.factory<_i947.AchievementsCubit>(() => _i947.AchievementsCubit());
    gh.factory<_i964.LeaderboardCubit>(() => _i964.LeaderboardCubit());
    gh.factory<_i889.DisputesHubCubit>(() => _i889.DisputesHubCubit());
    gh.factory<_i228.GroupChatCubit>(() => _i228.GroupChatCubit());
    gh.factory<_i216.ChildrenCubit>(() => _i216.ChildrenCubit());
    gh.factory<_i917.SchoolCubit>(() => _i917.SchoolCubit());
    gh.lazySingleton<_i349.FeatureFlagService>(
      () => _i349.FeatureFlagService(),
    );
    gh.lazySingleton<_i895.Connectivity>(() => networkModule.connectivity);
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => networkModule.secureStorage,
    );
    gh.lazySingleton<_i432.SessionManager>(
      () => _i432.SessionManager(),
      dispose: (i) => i.dispose(),
    );
    gh.lazySingleton<_i406.AppDatabase>(() => _i406.AppDatabase());
    gh.lazySingleton<_i563.NotificationsRepository>(
      () => const _i315.FakeNotificationsRepository(),
      registerFor: {_dev},
    );
    gh.factory<_i842.AdminCubit>(
      () => _i842.AdminCubit(gh<_i432.SessionManager>()),
    );
    gh.factory<_i24.DashboardCubit>(
      () => _i24.DashboardCubit(gh<_i432.SessionManager>()),
    );
    gh.lazySingleton<_i724.WalletRepository>(
      () => const _i511.FakeWalletRepository(),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i922.PocketRepository>(
      () => const _i297.FakePocketRepository(),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i894.ProfileRepository>(
      () => _i850.FakeProfileRepository(gh<_i432.SessionManager>()),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i560.CharityRepository>(
      () => const _i719.FakeCharityRepository(),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i565.PayoutsRepository>(
      () => const _i880.FakePayoutsRepository(),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i361.PlansRepository>(
      () => const _i424.FakePlansRepository(),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i161.AuthRemoteDataSource>(
      () => const _i44.FakeAuthRemoteDataSource(),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i684.TrustRepository>(
      () => const _i1004.FakeTrustRepository(),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i55.OutboxStore>(
      () => _i904.DriftOutboxStore(gh<_i406.AppDatabase>()),
    );
    gh.lazySingleton<_i973.TokenStorage>(
      () => _i973.SecureTokenStorage(gh<_i558.FlutterSecureStorage>()),
    );
    gh.lazySingleton<_i402.ConnectivityChecker>(
      () => _i402.ConnectivityCheckerImpl(gh<_i895.Connectivity>()),
    );
    gh.lazySingleton<_i992.AuthLocalDataSource>(
      () => _i992.AuthLocalDataSourceImpl(
        gh<_i973.TokenStorage>(),
        gh<_i460.SharedPreferences>(),
      ),
    );
    gh.lazySingleton<_i361.Dio>(
      () => networkModule.dio(
        gh<_i650.AppConfig>(),
        gh<_i973.TokenStorage>(),
        gh<_i402.ConnectivityChecker>(),
      ),
    );
    gh.lazySingleton<_i485.TrustRemoteDataSource>(
      () => _i485.TrustRemoteDataSourceImpl(gh<_i361.Dio>()),
      registerFor: {_prod, _staging},
    );
    gh.lazySingleton<_i5.CharityRemoteDataSource>(
      () => _i5.CharityRemoteDataSourceImpl(gh<_i361.Dio>()),
      registerFor: {_prod, _staging},
    );
    gh.lazySingleton<_i684.TrustRepository>(
      () => _i842.TrustRepositoryImpl(
        gh<_i485.TrustRemoteDataSource>(),
        gh<_i402.ConnectivityChecker>(),
      ),
      registerFor: {_prod, _staging},
    );
    gh.lazySingleton<_i327.ProfileRemoteDataSource>(
      () => _i327.ProfileRemoteDataSourceImpl(gh<_i361.Dio>()),
      registerFor: {_prod, _staging},
    );
    gh.lazySingleton<_i937.NotificationsRemoteDataSource>(
      () => _i937.NotificationsRemoteDataSourceImpl(gh<_i361.Dio>()),
      registerFor: {_prod, _staging},
    );
    gh.lazySingleton<_i520.SyncService>(
      () => _i520.SyncService(
        gh<_i55.OutboxStore>(),
        gh<_i402.ConnectivityChecker>(),
      ),
      dispose: (i) => i.dispose(),
    );
    gh.lazySingleton<_i646.WalletRemoteDataSource>(
      () => _i646.WalletRemoteDataSourceImpl(gh<_i361.Dio>()),
      registerFor: {_prod, _staging},
    );
    gh.factory<_i943.GetTrustProfile>(
      () => _i943.GetTrustProfile(gh<_i684.TrustRepository>()),
    );
    gh.lazySingleton<_i759.PlansRemoteDataSource>(
      () => _i759.PlansRemoteDataSourceImpl(gh<_i361.Dio>()),
      registerFor: {_prod, _staging},
    );
    gh.lazySingleton<_i1073.PayoutsRemoteDataSource>(
      () => _i1073.PayoutsRemoteDataSourceImpl(gh<_i361.Dio>()),
      registerFor: {_prod, _staging},
    );
    gh.lazySingleton<_i161.AuthRemoteDataSource>(
      () => _i161.AuthRemoteDataSourceImpl(gh<_i361.Dio>()),
      registerFor: {_prod, _staging},
    );
    gh.lazySingleton<_i724.WalletRepository>(
      () => _i522.WalletRepositoryImpl(
        gh<_i646.WalletRemoteDataSource>(),
        gh<_i402.ConnectivityChecker>(),
      ),
      registerFor: {_prod, _staging},
    );
    gh.lazySingleton<_i822.PocketRemoteDataSource>(
      () => _i822.PocketRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i158.ContributionRemoteDataSource>(
      () => _i158.ContributionRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i128.ContributionRepository>(
      () => _i971.ContributionRepositoryImpl(
        gh<_i158.ContributionRemoteDataSource>(),
        gh<_i402.ConnectivityChecker>(),
        gh<_i55.OutboxStore>(),
      ),
    );
    gh.factory<_i726.GetInvoices>(
      () => _i726.GetInvoices(gh<_i128.ContributionRepository>()),
    );
    gh.factory<_i366.SubmitContribution>(
      () => _i366.SubmitContribution(gh<_i128.ContributionRepository>()),
    );
    gh.factory<_i995.VerifyContribution>(
      () => _i995.VerifyContribution(gh<_i128.ContributionRepository>()),
    );
    gh.lazySingleton<_i894.ProfileRepository>(
      () => _i334.ProfileRepositoryImpl(
        gh<_i327.ProfileRemoteDataSource>(),
        gh<_i402.ConnectivityChecker>(),
      ),
      registerFor: {_prod, _staging},
    );
    gh.lazySingleton<_i922.PocketRepository>(
      () => _i915.PocketRepositoryImpl(
        gh<_i822.PocketRemoteDataSource>(),
        gh<_i402.ConnectivityChecker>(),
      ),
      registerFor: {_prod, _staging},
    );
    gh.lazySingleton<_i787.AuthRepository>(
      () => _i153.AuthRepositoryImpl(
        gh<_i161.AuthRemoteDataSource>(),
        gh<_i992.AuthLocalDataSource>(),
        gh<_i402.ConnectivityChecker>(),
      ),
    );
    gh.factory<_i813.InvoiceHistoryCubit>(
      () => _i813.InvoiceHistoryCubit(
        gh<_i726.GetInvoices>(),
        gh<_i995.VerifyContribution>(),
      ),
    );
    gh.factory<_i72.GetProfile>(
      () => _i72.GetProfile(gh<_i894.ProfileRepository>()),
    );
    gh.lazySingleton<_i361.PlansRepository>(
      () => _i867.PlansRepositoryImpl(
        gh<_i759.PlansRemoteDataSource>(),
        gh<_i402.ConnectivityChecker>(),
      ),
      registerFor: {_prod, _staging},
    );
    gh.lazySingleton<_i560.CharityRepository>(
      () => _i227.CharityRepositoryImpl(
        gh<_i5.CharityRemoteDataSource>(),
        gh<_i402.ConnectivityChecker>(),
      ),
      registerFor: {_prod, _staging},
    );
    gh.factory<_i188.LoginUseCase>(
      () => _i188.LoginUseCase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i48.LogoutUseCase>(
      () => _i48.LogoutUseCase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i187.GetPlans>(
      () => _i187.GetPlans(gh<_i361.PlansRepository>()),
    );
    gh.factory<_i756.TrustCubit>(
      () => _i756.TrustCubit(gh<_i943.GetTrustProfile>()),
    );
    gh.lazySingleton<_i563.NotificationsRepository>(
      () => _i201.NotificationsRepositoryImpl(
        gh<_i937.NotificationsRemoteDataSource>(),
        gh<_i402.ConnectivityChecker>(),
      ),
      registerFor: {_prod, _staging},
    );
    gh.factory<_i1031.GetWallet>(
      () => _i1031.GetWallet(gh<_i724.WalletRepository>()),
    );
    gh.factory<_i1059.GetCharityDrive>(
      () => _i1059.GetCharityDrive(gh<_i560.CharityRepository>()),
    );
    gh.factory<_i868.WalletCubit>(
      () => _i868.WalletCubit(gh<_i1031.GetWallet>()),
    );
    gh.factory<_i902.ContributeCubit>(
      () => _i902.ContributeCubit(gh<_i366.SubmitContribution>()),
    );
    gh.lazySingleton<_i565.PayoutsRepository>(
      () => _i415.PayoutsRepositoryImpl(
        gh<_i1073.PayoutsRemoteDataSource>(),
        gh<_i402.ConnectivityChecker>(),
      ),
      registerFor: {_prod, _staging},
    );
    gh.factory<_i602.PlansCubit>(() => _i602.PlansCubit(gh<_i187.GetPlans>()));
    gh.factory<_i559.ContributionOutboxHandler>(
      () => _i559.ContributionOutboxHandler(
        gh<_i158.ContributionRemoteDataSource>(),
      ),
    );
    gh.factory<_i163.GetNotifications>(
      () => _i163.GetNotifications(gh<_i563.NotificationsRepository>()),
    );
    gh.factory<_i1050.MarkAllRead>(
      () => _i1050.MarkAllRead(gh<_i563.NotificationsRepository>()),
    );
    gh.factory<_i890.GetMyPockets>(
      () => _i890.GetMyPockets(gh<_i922.PocketRepository>()),
    );
    gh.factory<_i523.GetPocketDetail>(
      () => _i523.GetPocketDetail(gh<_i922.PocketRepository>()),
    );
    gh.factory<_i36.ProfileCubit>(
      () => _i36.ProfileCubit(gh<_i72.GetProfile>()),
    );
    gh.factory<_i563.PocketDetailCubit>(
      () => _i563.PocketDetailCubit(
        gh<_i523.GetPocketDetail>(),
        gh<_i432.SessionManager>(),
      ),
    );
    gh.factory<_i797.AuthBloc>(
      () => _i797.AuthBloc(
        gh<_i188.LoginUseCase>(),
        gh<_i48.LogoutUseCase>(),
        gh<_i432.SessionManager>(),
      ),
    );
    gh.factory<_i763.GetPayouts>(
      () => _i763.GetPayouts(gh<_i565.PayoutsRepository>()),
    );
    gh.factory<_i229.PocketsCubit>(
      () => _i229.PocketsCubit(gh<_i890.GetMyPockets>()),
    );
    gh.factory<_i402.CharityCubit>(
      () => _i402.CharityCubit(gh<_i1059.GetCharityDrive>()),
    );
    gh.factory<_i405.NotificationsCubit>(
      () => _i405.NotificationsCubit(
        gh<_i163.GetNotifications>(),
        gh<_i1050.MarkAllRead>(),
      ),
    );
    gh.factory<_i334.PayoutsCubit>(
      () => _i334.PayoutsCubit(gh<_i763.GetPayouts>()),
    );
    return this;
  }
}

class _$NetworkModule extends _i200.NetworkModule {}
