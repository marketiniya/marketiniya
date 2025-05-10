import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:marketinya/core/config/log.dart';
import 'package:marketinya/core/enums/status.dart';
import 'package:marketinya/core/models/client.dart';
import 'package:marketinya/core/repositories/client_repository.dart';
import 'package:marketinya/core/repositories/user_repository.dart';
import 'package:marketinya/system/screens/clients/widgets/add_client_screen/bloc/add_client_event.dart';
import 'package:marketinya/system/screens/clients/widgets/add_client_screen/bloc/add_client_state.dart';

@Injectable()
class AddClientBloc extends Bloc<AddClientEvent, AddClientState> {
  AddClientBloc(
    this._userRepository,
    this._clientRepository,
    @factoryParam this._client,
    @factoryParam this._onClientUpdated,
  ) : super(AddClientState()) {
    on<AddClientEvent>((event, emit) async {
      await event.map(
        load: (e) async => _onLoad(emit),
        companyNameChanged: (e) async => emit(state.copyWith(companyName: e.value)),
        dateOfBirthChanged: (e) async => emit(state.copyWith(dateOfBirth: e.value)),
        businessSectorChanged: (e) async => emit(state.copyWith(businessSector: e.value)),
        companyIdChanged: (e) async => emit(state.copyWith(companyId: e.value)),
        personalIdChanged: (e) async => emit(state.copyWith(personalId: e.value)),
        phoneChanged: (e) async => emit(state.copyWith(phone: e.value)),
        clientStatusChanged: (e) async => emit(state.copyWith(clientStatus: e.value)),
        descriptionChanged: (e) async => emit(state.copyWith(description: e.value)),
        save: (_) async => _onSave(emit),
        update: (_) async => _onUpdate(emit),
      );
    });

    if (_client != null) {
      add(const AddClientEvent.load());
    }
  }

  final Client? _client;
  final UserRepository _userRepository;
  final ClientRepository _clientRepository;
  final void Function(Client client) _onClientUpdated;

  Future<void> _onLoad(Emitter<AddClientState> emit) async {
    if (_client == null) {
      return;
    }

    emit(
      state.copyWith(
        isUpdateMode: true,
        companyName: _client.companyName,
        dateOfBirth: DateFormat('dd.MM.yyyy').format(_client.dateOfBirth),
        businessSector: _client.businessSector,
        companyId: _client.companyId,
        personalId: _client.personalId,
        phone: _client.phone,
        clientStatus: _client.status,
        description: _client.description,
      ),
    );
  }

  Future<void> _onSave(Emitter<AddClientState> emit) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final userRef = _userRepository.getCurrentUserRef();

      final client = await _clientRepository.createClient(
        companyName: state.companyName,
        dateOfBirth: _parseDateOfBirth(),
        businessSector: state.businessSector,
        companyId: state.companyId,
        personalId: state.personalId,
        phone: state.phone,
        status: state.clientStatus,
        description: state.description,
        assignedTo: userRef,
        tags: [],
      );

      _onClientUpdated(client);
      emit(state.copyWith(status: Status.success));
    } catch (e, stackTrace) {
      Log.error('Update failed: $e');
      Log.error(stackTrace.toString());
      emit(state.copyWith(status: Status.error));
    }
  }

  Future<void> _onUpdate(Emitter<AddClientState> emit) async {
    emit(state.copyWith(status: Status.loading));

    if (_client == null) {
      emit(state.copyWith(status: Status.error));
      Log.error('Cannot update: no existing client data provided.');
      return;
    }

    try {
      final updatedClient = await _clientRepository.updateClient(
        id: _client.id,
        assignedTo: _client.assignedTo,
        companyId: state.companyId,
        personalId: state.personalId,
        companyName: state.companyName,
        dateOfBirth: _parseDateOfBirth(),
        businessSector: state.businessSector,
        phone: state.phone,
        status: state.clientStatus,
        description: state.description,
        createdAt: _client.createdAt,
      );

      _onClientUpdated(updatedClient);

      emit(state.copyWith(status: Status.success));
    } catch (e, stackTrace) {
      Log.error('Update failed for client ID: ${_client.id}, Error: $e');
      Log.error('Stack trace: $stackTrace');

      emit(
        state.copyWith(
          status: Status.error,
          errorMessage: 'Failed to update the client. Please try again later.',
        ),
      );
    }
  }

  DateTime _parseDateOfBirth() {
    final dateFormat = DateFormat('dd.MM.yyyy');
    return dateFormat.parse(state.dateOfBirth);
  }
}
