enum BaseStatus { initial, loading, loaded, error }

class BaseState {
  BaseState({this.baseStatus = BaseStatus.initial, this.error});
  BaseStatus baseStatus;
  String? error;

  BaseState copyWith({
    BaseStatus? status,
    String? error,
  }) {
    return BaseState(
      baseStatus: status ?? baseStatus,
      error: error ?? this.error,
    );
  }
}
