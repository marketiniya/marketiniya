part of 'client_bloc.dart';

@freezed
class ClientEvent with _$ClientEvent {
  const factory ClientEvent.onLoad() = _OnLoad;

  const factory ClientEvent.onClientUpdated(Client client) = _OnClientUpdated;
}
