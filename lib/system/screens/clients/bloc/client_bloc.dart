import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:marketinya/core/config/log.dart';
import 'package:marketinya/core/enums/status.dart';
import 'package:marketinya/core/models/client.dart';
import 'package:marketinya/core/repositories/client_repository.dart';
import 'package:marketinya/core/repositories/user_repository.dart';
import 'package:marketinya/system/screens/clients/bloc/client_state.dart';

part 'client_bloc.freezed.dart';
part 'client_event.dart';

@Injectable()
class ClientBloc extends Bloc<ClientEvent, ClientState> {
  ClientBloc(
    this._userRepository,
    this._clientRepository,
  ) : super(const ClientState()) {
    on<ClientEvent>(
      (event, emit) => event.map(
        onLoad: (_) => _onLoad(emit),
        onClientUpdated: (e) => _onClientUpdated(emit, e),
        onSearch: (e) => _onSearch(emit, e),
        onPageChanged: (e) => _onPageChanged(emit, e),
        onItemsPerPageChanged: (e) => _onItemsPerPageChanged(emit, e),
      ),
    );

    add(const ClientEvent.onLoad());
  }

  final UserRepository _userRepository;
  final ClientRepository _clientRepository;

  Future<void> _onLoad(Emitter<ClientState> emit) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final currentUserRef = _userRepository.getCurrentUserRef();
      final clients = await _clientRepository.getClientsForUser(currentUserRef);

      emit(state.copyWith(status: Status.success, clients: clients));
    } catch (e, stackTrace) {
      Log.error(stackTrace.toString());
      emit(
        state.copyWith(
          status: Status.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _onClientUpdated(
    Emitter<ClientState> emit,
    _OnClientUpdated event,
  ) async {
    final client = event.client;

    final updatedClients = List<Client>.from(state.clients);
    final index = updatedClients.indexWhere(
      (c) => c.id == client.id,
    );

    final clientExists = index != -1;

    // If client is marked as deleted, remove it from the list
    if (client.isDeleted) {
      if (clientExists) {
        updatedClients.removeAt(index);
      }
    } else {
      // Normal update/add logic for non-deleted clients
      if (clientExists) {
        updatedClients[index] = client;
      } else {
        updatedClients.add(client);
      }
    }

    final newState = state.copyWith(clients: updatedClients);
    emit(newState);

    // Fix pagination if current page is empty
    _resetPageIfOutOfBounds(emit, newState);
  }

  void _onSearch(Emitter<ClientState> emit, _OnSearch event) {
    emit(
      state.copyWith(
        searchQuery: event.query,
        currentPage: 1,
      ),
    );
  }

  void _onPageChanged(Emitter<ClientState> emit, _OnPageChanged event) {
    emit(state.copyWith(currentPage: event.page));
  }

  void _onItemsPerPageChanged(Emitter<ClientState> emit, _OnItemsPerPageChanged event) {
    // Reset to page 1 when changing page size
    emit(
      state.copyWith(
        itemsPerPage: event.itemsPerPage,
        currentPage: 1,
      ),
    );
  }

  /// Reset to page 1 if current page has no data
  void _resetPageIfOutOfBounds(Emitter<ClientState> emit, ClientState newState) {
    if (newState.isCurrentPageOutOfBounds) {
      emit(newState.copyWith(currentPage: 1));
    }
  }
}
