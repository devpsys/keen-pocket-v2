import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/profile/domain/entities/profile.dart';
import 'package:keenpockets/features/profile/domain/usecases/get_profile.dart';
import 'package:keenpockets/features/profile/presentation/cubit/profile_state.dart';
import 'package:keenpockets/features/profile/presentation/view_models/profile_view.dart';

/// Loads the signed-in user's profile via [GetProfile] and projects the entity
/// into the presentation [ProfileView].
@injectable
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._getProfile) : super(const ProfileState());

  final GetProfile _getProfile;

  Future<void> load() async {
    emit(state.copyWith(status: StateStatus.loading, failure: null));
    final result = await _getProfile(const NoParams());
    emit(
      result.fold(
        (failure) =>
            state.copyWith(status: StateStatus.failure, failure: failure),
        (profile) => state.copyWith(
          status: StateStatus.success,
          profile: profile.toView(),
          failure: null,
        ),
      ),
    );
  }
}

extension on Profile {
  ProfileView toView() => ProfileView(
    name: name,
    phone: phone,
    level: level,
    trustScore: trustScore,
    tier: tier,
    tierBlurb: tierBlurb,
    kycVerified: kycVerified,
    paymentReliability: paymentReliability,
    pocketsJoined: pocketsJoined,
    adashisCompleted: adashisCompleted,
    avgRating: avgRating,
  );
}
