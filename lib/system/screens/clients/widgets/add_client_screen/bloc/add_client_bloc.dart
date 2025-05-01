import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:marketinya/core/enums/status.dart';
import 'package:marketinya/core/repositories/client_repository.dart';
import 'package:marketinya/core/repositories/user_repository.dart';
import 'add_client_event.dart';
import 'add_client_state.dart';

@Injectable()
class AddClientBloc extends Bloc<AddClientEvent, AddClientState> {
  AddClientBloc(this._userRepository, this._clientRepository)
      : super(AddClientState()) {
    on<AddClientEvent>((event, emit) async {
      await event.map(
        companyNameChanged: (e) async => emit(state.copyWith(companyName: e.value)),
        dateOfBirthChanged: (e) async => emit(state.copyWith(dateOfBirth: e.value)),
        industryChanged: (e) async => emit(state.copyWith(industry: e.value)),
        personalOrCompanyIdChanged: (e) async => emit(state.copyWith(personalOrCompanyId: e.value)),
        phoneChanged: (e) async => emit(state.copyWith(phone: e.value)),
        clientStatusChanged: (e) async => emit(state.copyWith(clientStatus: e.value)),
        descriptionChanged: (e) async => emit(state.copyWith(description: e.value)),
        save: (_) async => await _onSave(emit),
      );
    });
  }

  final UserRepository _userRepository;
  final ClientRepository _clientRepository;

  Future<void> _onSave(Emitter<AddClientState> emit) async {
    emit(state.copyWith(status: Status.loading));

    try {
      final userReference = _userRepository.getCurrentUserRef();
      final dateOfBirth = _parseDateOfBirth();

      final exists = await _clientRepository.isClientRegistered(state.personalOrCompanyId);
      if (exists) {
        emit(
          state.copyWith(
            status: Status.error,
            errorMessage: 'A client with this ID already exists.',
          ),
        );
        return;
      }

      await _clientRepository.createClient(
        assignedTo: userReference,
        tags: [], // TODO: Add tags when implemented
        companyName: state.companyName,
        dateOfBirth: dateOfBirth,
        industry: state.industry,
        personalOrCompanyId: state.personalOrCompanyId,
        phone: state.phone,
        status: state.clientStatus,
      );

      emit(state.copyWith(status: Status.success));
    } catch (e) {
      emit(state.copyWith(status: Status.error, errorMessage: e.toString()));
    }
  }

  DateTime _parseDateOfBirth() {
    final dateFormat = DateFormat('dd.MM.yyyy');
    return dateFormat.parse(state.dateOfBirth);
  }
}
