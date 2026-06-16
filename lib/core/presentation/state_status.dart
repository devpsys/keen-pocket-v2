/// Canonical UI status every feature state should expose.
///
/// Combined with Freezed states, this gives each screen the mandated
/// loading / success / empty / error rendering without re-inventing the wheel.
enum StateStatus {
  initial,
  loading,
  success,
  empty,
  failure;

  bool get isInitial => this == StateStatus.initial;
  bool get isLoading => this == StateStatus.loading;
  bool get isSuccess => this == StateStatus.success;
  bool get isEmpty => this == StateStatus.empty;
  bool get isFailure => this == StateStatus.failure;
}
