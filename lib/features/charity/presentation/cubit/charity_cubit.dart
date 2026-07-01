import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/charity/domain/entities/charity_drive.dart';
import 'package:keenpockets/features/charity/domain/usecases/get_charity_drive.dart';
import 'package:keenpockets/features/charity/presentation/cubit/charity_state.dart';
import 'package:keenpockets/features/charity/presentation/view_models/charity_view.dart';

/// Loads a pocket's charity drive via [GetCharityDrive] and projects the entity
/// into the presentation [CharityView].
@injectable
class CharityCubit extends Cubit<CharityState> {
  CharityCubit(this._getDrive) : super(const CharityState());

  final GetCharityDrive _getDrive;

  Future<void> load(String pocketId) async {
    emit(state.copyWith(status: StateStatus.loading, failure: null));
    final result = await _getDrive(pocketId);
    emit(
      result.fold(
        (failure) =>
            state.copyWith(status: StateStatus.failure, failure: failure),
        (drive) => state.copyWith(
          status: StateStatus.success,
          drive: drive.toView(),
          failure: null,
        ),
      ),
    );
  }
}

extension on CharityDrive {
  CharityView toView() => CharityView(
    title: title,
    goal: goal,
    raised: raised,
    donorCount: donorCount,
  );
}
