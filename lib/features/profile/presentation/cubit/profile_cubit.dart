import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/core/session/session_manager.dart';
import 'package:keenpockets/features/profile/presentation/cubit/profile_state.dart';
import 'package:keenpockets/features/profile/presentation/view_models/profile_view.dart';

/// Builds the profile view. Identity comes from [SessionManager]; reputation /
/// keens / KYC are presentation-only placeholders until trust/gamification data
/// lands.
@injectable
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._session) : super(const ProfileState());

  final SessionManager _session;

  Future<void> load() async {
    emit(state.copyWith(status: StateStatus.loading));
    final user = _session.currentUser;
    emit(
      state.copyWith(
        status: StateStatus.success,
        profile: ProfileView(
          name: user?.name ?? 'Guest',
          phone: '+1 (555) 0123-4567',
          level: 12,
          trustScore: 92,
          tier: 'Keen Pioneer',
          tierBlurb: "You're in the top 5% of reliable savers in your region!",
          kycVerified: user?.kycVerified ?? false,
          paymentReliability: 98,
          pocketsJoined: 12,
          adashisCompleted: 5,
          avgRating: 4.9,
        ),
      ),
    );
  }
}
