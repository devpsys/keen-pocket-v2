import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/trust/domain/entities/trust_profile.dart';
import 'package:keenpockets/features/trust/domain/usecases/get_trust_profile.dart';
import 'package:keenpockets/features/trust/presentation/cubit/trust_state.dart';
import 'package:keenpockets/features/trust/presentation/view_models/trust_view.dart';

/// Loads the signed-in user's reputation via [GetTrustProfile] and projects the
/// entity into the presentation [TrustView].
@injectable
class TrustCubit extends Cubit<TrustState> {
  TrustCubit(this._getTrustProfile) : super(const TrustState());

  final GetTrustProfile _getTrustProfile;

  Future<void> load() async {
    emit(state.copyWith(status: StateStatus.loading, failure: null));
    final result = await _getTrustProfile(const NoParams());
    emit(
      result.fold(
        (failure) =>
            state.copyWith(status: StateStatus.failure, failure: failure),
        (trust) => state.copyWith(
          status: StateStatus.success,
          trust: trust.toView(),
          failure: null,
        ),
      ),
    );
  }
}

extension on TrustProfile {
  TrustView toView() => TrustView(
    score: score,
    band: band,
    kycVerified: kycVerified,
    ratings: ratings
        .map(
          (r) => RatingView(
            author: r.author,
            stars: r.stars,
            comment: r.comment,
            context: r.context,
            avatarUrl: r.avatarUrl,
          ),
        )
        .toList(),
    memberName: memberName,
    memberSince: memberSince,
    rank: rank,
    avatarUrl: avatarUrl,
    paymentReliability: paymentReliability,
    pocketsJoined: pocketsJoined,
    adashisCompleted: adashisCompleted,
    avgRating: avgRating,
  );
}
