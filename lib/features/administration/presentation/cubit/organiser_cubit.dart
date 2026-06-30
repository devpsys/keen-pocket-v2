import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/administration/presentation/cubit/organiser_state.dart';
import 'package:keenpockets/features/administration/presentation/organiser_fixtures.dart';

/// PRESENTATION-ONLY: sample organiser dashboard. Swap for a use case when the
/// organiser APIs exist.
@injectable
class OrganiserCubit extends Cubit<OrganiserState> {
  OrganiserCubit() : super(const OrganiserState());

  Future<void> load() async {
    emit(state.copyWith(status: StateStatus.loading));
    emit(state.copyWith(status: StateStatus.success, data: kOrganiser));
  }
}
