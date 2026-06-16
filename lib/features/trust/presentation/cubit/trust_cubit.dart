import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/trust/presentation/cubit/trust_state.dart';
import 'package:keenpockets/features/trust/presentation/view_models/trust_view.dart';

/// PRESENTATION-ONLY: placeholder reputation + ratings; swap for a use case.
@injectable
class TrustCubit extends Cubit<TrustState> {
  TrustCubit() : super(const TrustState());

  Future<void> load() async {
    emit(state.copyWith(status: StateStatus.loading));
    emit(
      state.copyWith(
        status: StateStatus.success,
        trust: const TrustView(
          score: 86,
          band: 'Trusted',
          kycVerified: true,
          ratings: [
            RatingView(
              author: 'Funke',
              stars: 5,
              comment: 'Always pays on time.',
            ),
            RatingView(
              author: 'Chidi',
              stars: 4,
              comment: 'Reliable organiser.',
            ),
          ],
        ),
      ),
    );
  }
}
