import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/trust/presentation/cubit/trust_state.dart';
import 'package:keenpockets/features/trust/presentation/view_models/trust_view.dart';
import 'package:keenpockets/features/trust/presentation/widgets/trust_fixtures.dart';

/// PRESENTATION-ONLY: placeholder reputation + ratings; swap for a use case.
@injectable
class TrustCubit extends Cubit<TrustState> {
  TrustCubit() : super(const TrustState());

  Future<void> load() async {
    emit(state.copyWith(status: StateStatus.loading));
    emit(
      state.copyWith(
        status: StateStatus.success,
        trust: TrustView(
          score: 82,
          band: 'Keen Pioneer',
          kycVerified: true,
          memberName: 'Alex Rivera',
          memberSince: 'Jan 2023',
          rank: 'Top 5% Contributor',
          avatarUrl: kTrustAvatarUrl,
          paymentReliability: 98,
          pocketsJoined: 12,
          adashisCompleted: 5,
          avgRating: 4.9,
          ratings: [
            RatingView(
              author: 'Sarah J.',
              stars: 5,
              comment:
                  '"Great organizer, very transparent! Always keeps the '
                  'pocket updated on schedules."',
              context: 'ADASHI #4 • AUGUST 2023',
              avatarUrl: kTrustRaterAvatars[0],
            ),
            RatingView(
              author: 'Marcus T.',
              stars: 5,
              comment:
                  '"Reliable and prompt. Would join a pocket with Alex again '
                  'any time!"',
              context: 'TRAVEL POCKET • JULY 2023',
              avatarUrl: kTrustRaterAvatars[1],
            ),
            RatingView(
              author: 'Lin W.',
              stars: 5,
              comment:
                  '"Highly recommend for first-time pocket members. Very '
                  'helpful guidance."',
              context: 'DORM POCKET • MAY 2023',
              avatarUrl: kTrustRaterAvatars[2],
            ),
          ],
        ),
      ),
    );
  }
}
