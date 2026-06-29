import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/school/presentation/cubit/school_state.dart';
import 'package:keenpockets/features/school/presentation/school_fixtures.dart';

/// PRESENTATION-ONLY: sample owner dashboard; backend-gap, so the page is also
/// flag-gated (built dark). Swap for a use case when the API exists.
@injectable
class SchoolCubit extends Cubit<SchoolState> {
  SchoolCubit() : super(const SchoolState());

  Future<void> load() async {
    emit(state.copyWith(status: StateStatus.loading));
    emit(state.copyWith(status: StateStatus.success, school: kSchool));
  }
}
