import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/charity/presentation/cubit/charity_state.dart';
import 'package:keenpockets/features/charity/presentation/view_models/charity_view.dart';

/// PRESENTATION-ONLY: placeholder charity drive; swap for a use case later.
@injectable
class CharityCubit extends Cubit<CharityState> {
  CharityCubit() : super(const CharityState());

  Future<void> load(String pocketId) async {
    emit(state.copyWith(status: StateStatus.loading));
    emit(
      state.copyWith(
        status: StateStatus.success,
        drive: const CharityView(
          title: 'Ramadan food drive',
          goal: Money(20000000),
          raised: Money(12500000),
          donorCount: 24,
        ),
      ),
    );
  }
}
