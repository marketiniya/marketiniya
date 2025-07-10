import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketinya/core/enums/status.dart';
import 'package:marketinya/core/models/client.dart';

part 'client_state.freezed.dart';

@freezed
class ClientState with _$ClientState {
  const factory ClientState({
    @Default(Status.initial) Status status,
    @Default([]) List<Client> clients,
    @Default('') String searchQuery,
    String? errorMessage,
  }) = _ClientState;
}

extension ClientStateExtension on ClientState {
  List<Client> get filteredClients {
    if (searchQuery.isEmpty) {
      return clients;
    }

    final query = searchQuery.toLowerCase();
    return clients.where((client) {
      return client.companyName.toLowerCase().contains(query) ||
          client.name.toLowerCase().contains(query) ||
          client.phone.toLowerCase().contains(query) ||
          client.personalId.toLowerCase().contains(query) ||
          client.companyId.toLowerCase().contains(query);
    }).toList();
  }
}
