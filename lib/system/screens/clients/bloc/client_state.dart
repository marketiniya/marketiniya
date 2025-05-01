import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketinya/core/enums/status.dart';
import 'package:marketinya/core/models/client.dart';

part 'client_state.freezed.dart';

@freezed
class ClientState with _$ClientState {
  const factory ClientState({
    @Default(Status.initial) Status status,
    @Default([]) List<Client> clients,
    String? errorMessage,
  }) = _ClientState;
}
