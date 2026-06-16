import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:keenpockets/features/school/presentation/view_models/school_view.dart';

part 'school_state.freezed.dart';

@freezed
abstract class SchoolState with _$SchoolState {
  const factory SchoolState({
    @Default(StateStatus.initial) StateStatus status,
    SchoolView? school,
  }) = _SchoolState;
}
