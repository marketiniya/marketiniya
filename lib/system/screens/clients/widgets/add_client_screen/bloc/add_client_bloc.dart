import 'package:flutter_bloc/flutter_bloc.dart';
import 'add_client_event.dart';
import 'add_client_state.dart';

class AddClientBloc extends Bloc<AddClientEvent, AddClientState> {
  AddClientBloc() : super(AddClientState()) {
    on<AddClientEvent>((event, emit) {
      event.map(
        companyNameChanged: (e) => emit(state.copyWith(companyName: e.value)),
        dateOfBirthChanged: (e) => emit(state.copyWith(dateOfBirth: e.value)),
        industryChanged: (e) => emit(state.copyWith(industry: e.value)),
        personalOrCompanyIdChanged: (e) => emit(state.copyWith(personalOrCompanyId: e.value)),
        phoneChanged: (e) => emit(state.copyWith(phone: e.value)),
        clientStatusChanged: (e) => emit(state.copyWith(clientStatus: e.value)),
        descriptionChanged: (e) => emit(state.copyWith(description: e.value)),
        save: (_) {
          print('Saving client with data:');
          print('Company Name: ${state.companyName}');
          print('EGN/EIK: ${state.personalOrCompanyId}');
          print('Industry: ${state.industry}');
          print('Status: ${state.clientStatus}');
          print('Description: ${state.description}');
        },
      );
    });
  }
}
