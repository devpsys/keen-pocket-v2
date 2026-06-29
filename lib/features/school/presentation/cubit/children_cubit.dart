import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/school/presentation/children_fixtures.dart';
import 'package:keenpockets/features/school/presentation/cubit/children_state.dart';

/// PRESENTATION-ONLY: sample linked children; backend-gap, so the page is also
/// flag-gated (built dark). Swap for a use case when the API exists.
@injectable
class ChildrenCubit extends Cubit<ChildrenState> {
  ChildrenCubit() : super(const ChildrenState());

  Future<void> load() async {
    emit(state.copyWith(status: StateStatus.loading));
    emit(state.copyWith(status: StateStatus.success, children: kChildren));
  }
}
