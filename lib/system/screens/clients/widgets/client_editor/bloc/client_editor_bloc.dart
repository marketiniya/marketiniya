import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:marketinya/core/config/log.dart';
import 'package:marketinya/core/enums/status.dart';
import 'package:marketinya/core/models/client.dart';
import 'package:marketinya/core/repositories/client_repository.dart';
import 'package:marketinya/core/repositories/user_repository.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/bloc/client_editor_event.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/bloc/client_editor_state.dart';

@Injectable()
class ClientEditorBloc extends Bloc<ClientEditorEvent, ClientEditorState> {
  ClientEditorBloc(
    this._userRepository,
    this._clientRepository,
    @factoryParam this._client,
    @factoryParam this._onClientUpdated,
  ) : super(ClientEditorState()) {
    on<ClientEditorEvent>((event, emit) async {
      await event.map(
        load: (e) async => _onLoad(emit),
        companyNameChanged: (e) async => emit(state.copyWith(companyName: e.value, status: Status.initial)),
        nameChanged: (e) async => emit(state.copyWith(name: e.value, status: Status.initial)),
        dateOfBirthChanged: (e) async => emit(state.copyWith(dateOfBirth: e.value, status: Status.initial)),
        departmentChanged: (e) async => emit(state.copyWith(department: e.value, status: Status.initial)),
        businessSectorChanged: (e) async => emit(state.copyWith(businessSector: e.value, status: Status.initial)),
        companyIdChanged: (e) async => emit(state.copyWith(companyId: e.value, status: Status.initial)),
        personalIdChanged: (e) async => emit(state.copyWith(personalId: e.value, status: Status.initial)),
        emailChanged: (e) async => emit(state.copyWith(email: e.value, status: Status.initial)),
        phoneChanged: (e) async => emit(state.copyWith(phone: e.value, status: Status.initial)),
        clientStatusChanged: (e) async => emit(state.copyWith(clientStatus: e.value, status: Status.initial)),
        priorityLevelChanged: (e) async => emit(state.copyWith(priorityLevel: e.value, status: Status.initial)),
        descriptionChanged: (e) async => emit(state.copyWith(description: e.value, status: Status.initial)),
        socialLinksChanged: (e) async => emit(state.copyWith(socialLinks: e.value, status: Status.initial)),
        hasBeenCalledChanged: (e) async => emit(state.copyWith(hasBeenCalled: e.value, status: Status.initial)),
        save: (_) async => _onSave(emit),
        update: (_) async => _onUpdate(emit),
        delete: (_) async => _onDelete(emit),
        cancel: (_) async => emit(state.copyWith(shouldRedirectToHome: true)),
      );
    });

    if (_client != null) {
      add(const ClientEditorEvent.load());
    }
  }

  final Client? _client;
  final UserRepository _userRepository;
  final ClientRepository _clientRepository;
  final void Function(Client client) _onClientUpdated;

  Future<void> _onLoad(Emitter<ClientEditorState> emit) async {
    if (_client == null) {
      return;
    }

    emit(
      state.copyWith(
        isUpdateMode: true,
        companyName: _client.companyName,
        name: _client.name,
        dateOfBirth: DateFormat('dd.MM.yyyy').format(_client.dateOfBirth),
        department: _client.department,
        businessSector: _client.businessSector,
        companyId: _client.companyId,
        personalId: _client.personalId,
        email: _client.email,
        phone: _client.phone,
        clientStatus: _client.status,
        priorityLevel: _client.priorityLevel,
        description: _client.description,
        socialLinks: _client.socialLinks,
        hasBeenCalled: _client.hasBeenCalled,
      ),
    );
  }

  Future<void> _onSave(Emitter<ClientEditorState> emit) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final userRef = _userRepository.getCurrentUserRef();

      final client = await _clientRepository.createClient(
        companyName: state.companyName,
        name: state.name,
        dateOfBirth: _parseDateOfBirth(),
        department: state.department,
        businessSector: state.businessSector,
        companyId: state.companyId,
        personalId: state.personalId,
        email: state.email,
        phone: state.phone,
        status: state.clientStatus,
        priorityLevel: state.priorityLevel,
        description: state.description,
        assignedTo: userRef,
        tags: [],
        socialLinks: state.socialLinks,
        hasBeenCalled: state.hasBeenCalled,
      );

      _onClientUpdated(client);
      emit(state.copyWith(status: Status.success));
    } catch (e, stackTrace) {
      Log.error('Update failed: $e');
      Log.error(stackTrace.toString());
      emit(state.copyWith(status: Status.error));
    }
  }

  Future<void> _onUpdate(Emitter<ClientEditorState> emit) async {
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
        name: state.name,
        dateOfBirth: _parseDateOfBirth(),
        department: state.department,
        businessSector: state.businessSector,
        email: state.email,
        phone: state.phone,
        status: state.clientStatus,
        priorityLevel: state.priorityLevel,
        description: state.description,
        createdAt: _client.createdAt,
        socialLinks: state.socialLinks,
        hasBeenCalled: state.hasBeenCalled,
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

  Future<void> _onDelete(Emitter<ClientEditorState> emit) async {
    emit(state.copyWith(status: Status.loading));

    if (_client == null) {
      emit(
        state.copyWith(
          status: Status.error,
          errorMessage: 'Cannot delete: no client data found.',
        ),
      );
      Log.error('Delete attempt failed: no existing client data provided.');
      return;
    }

    try {
      await _clientRepository.deleteClient(_client.id);

      // Notify the callback that client was deleted
      _onClientUpdated(_client.copyWith(isDeleted: true));

      emit(state.copyWith(
        status: Status.success,
        shouldRedirectToHome: true,
      ),);
    } catch (e, stackTrace) {
      Log.error('Delete failed for client ID: ${_client.id}', error: e);
      Log.error('Stack trace: $stackTrace');

      emit(
        state.copyWith(
          status: Status.error,
          errorMessage: 'Failed to delete the client. Please try again later.',
        ),
      );
    }
  }



  DateTime _parseDateOfBirth() {
    final dateFormat = DateFormat('dd.MM.yyyy');
    return dateFormat.parse(state.dateOfBirth);
  }
}
