import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketinya/core/enums/status.dart';

part 'process_state.freezed.dart';

@freezed
class ProcessState<T> with _$ProcessState<T> {
  const factory ProcessState.initial() = _Initial<T>;
  
  const factory ProcessState.loading() = _Loading<T>;
  
  const factory ProcessState.success(T data) = _Success<T>;
  
  const factory ProcessState.error(String message) = _Error<T>;
}

extension ProcessStateExtension<T> on ProcessState<T> {
  bool get isInitial => this is _Initial<T>;
  bool get isLoading => this is _Loading<T>;
  bool get isSuccess => this is _Success<T>;
  bool get isError => this is _Error<T>;
  
  T? get data => maybeWhen(
    success: (data) => data,
    orElse: () => null,
  );
  
  String? get errorMessage => maybeWhen(
    error: (message) => message,
    orElse: () => null,
  );
  
  Status get status => when(
    initial: () => Status.initial,
    loading: () => Status.loading,
    success: (_) => Status.success,
    error: (_) => Status.error,
  );
}
