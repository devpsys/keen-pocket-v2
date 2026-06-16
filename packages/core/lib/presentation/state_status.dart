/// Canonical UI status every feature state should expose.
///
/// Models the universal screen states from the architecture brief so every
/// screen renders loading / success / empty / failure / permission-denied /
/// feature-disabled consistently (see `KpAsyncView`).
enum StateStatus {
  initial,
  loading,
  success,
  empty,
  failure,
  permissionDenied,
  featureDisabled;

  bool get isInitial => this == StateStatus.initial;
  bool get isLoading => this == StateStatus.loading;
  bool get isSuccess => this == StateStatus.success;
  bool get isEmpty => this == StateStatus.empty;
  bool get isFailure => this == StateStatus.failure;
  bool get isPermissionDenied => this == StateStatus.permissionDenied;
  bool get isFeatureDisabled => this == StateStatus.featureDisabled;
}
