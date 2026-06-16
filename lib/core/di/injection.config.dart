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
import '../../features/group_collaboration/presentation/cubit/group_chat_cubit.dart'
    as _i228;
import '../../features/money/presentation/cubit/wallet_cubit.dart' as _i868;
import '../../features/notifications/presentation/cubit/notifications_cubit.dart'
    as _i405;
import '../../features/plans/presentation/cubit/plans_cubit.dart' as _i602;
import '../../features/pockets/data/datasources/pocket_remote_datasource.dart'
    as _i822;
import '../../features/pockets/data/repositories/pocket_repository_impl.dart'
    as _i915;
import '../../features/pockets/domain/repositories/pocket_repository.dart'
    as _i922;
import '../../features/pockets/domain/usecases/get_my_pockets.dart' as _i890;
import '../../features/pockets/domain/usecases/get_pocket_detail.dart' as _i523;
import '../../features/pockets/presentation/cubit/pocket_detail_cubit.dart'
    as _i563;
import '../../features/pockets/presentation/cubit/pockets_cubit.dart' as _i229;
import '../../features/profile/presentation/cubit/profile_cubit.dart' as _i36;
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
    gh.factory<_i402.CharityCubit>(() => _i402.CharityCubit());
    gh.factory<_i953.DiscoveryCubit>(() => _i953.DiscoveryCubit());
    gh.factory<_i135.FriendsCubit>(() => _i135.FriendsCubit());
    gh.factory<_i947.AchievementsCubit>(() => _i947.AchievementsCubit());
    gh.factory<_i228.GroupChatCubit>(() => _i228.GroupChatCubit());
    gh.factory<_i868.WalletCubit>(() => _i868.WalletCubit());
    gh.factory<_i405.NotificationsCubit>(() => _i405.NotificationsCubit());
    gh.factory<_i602.PlansCubit>(() => _i602.PlansCubit());
    gh.factory<_i756.TrustCubit>(() => _i756.TrustCubit());
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
    gh.factory<_i24.DashboardCubit>(
      () => _i24.DashboardCubit(gh<_i432.SessionManager>()),
    );
    gh.factory<_i36.ProfileCubit>(
      () => _i36.ProfileCubit(gh<_i432.SessionManager>()),
    );
    gh.lazySingleton<_i161.AuthRemoteDataSource>(
      () => const _i44.FakeAuthRemoteDataSource(),
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
    gh.lazySingleton<_i520.SyncService>(
      () => _i520.SyncService(
        gh<_i55.OutboxStore>(),
        gh<_i402.ConnectivityChecker>(),
      ),
      dispose: (i) => i.dispose(),
    );
    gh.lazySingleton<_i161.AuthRemoteDataSource>(
      () => _i161.AuthRemoteDataSourceImpl(gh<_i361.Dio>()),
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
    gh.factory<_i188.LoginUseCase>(
      () => _i188.LoginUseCase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i48.LogoutUseCase>(
      () => _i48.LogoutUseCase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i902.ContributeCubit>(
      () => _i902.ContributeCubit(gh<_i366.SubmitContribution>()),
    );
    gh.lazySingleton<_i922.PocketRepository>(
      () => _i915.PocketRepositoryImpl(
        gh<_i822.PocketRemoteDataSource>(),
        gh<_i402.ConnectivityChecker>(),
      ),
    );
    gh.factory<_i559.ContributionOutboxHandler>(
      () => _i559.ContributionOutboxHandler(
        gh<_i158.ContributionRemoteDataSource>(),
      ),
    );
    gh.factory<_i890.GetMyPockets>(
      () => _i890.GetMyPockets(gh<_i922.PocketRepository>()),
    );
    gh.factory<_i523.GetPocketDetail>(
      () => _i523.GetPocketDetail(gh<_i922.PocketRepository>()),
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
    gh.factory<_i229.PocketsCubit>(
      () => _i229.PocketsCubit(gh<_i890.GetMyPockets>()),
    );
    return this;
  }
}

class _$NetworkModule extends _i200.NetworkModule {}
