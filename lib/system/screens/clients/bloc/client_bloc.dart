import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:marketinya/core/enums/status.dart';
import 'package:marketinya/core/repositories/client_repository.dart';
import 'package:marketinya/core/repositories/user_repository.dart';

import 'client_state.dart';

part 'client_event.dart';

part 'client_bloc.freezed.dart';

@Injectable()
class ClientBloc extends Bloc<ClientEvent, ClientState> {
  ClientBloc(
    this._userRepository,
    this._clientRepository,
  ) : super(const ClientState()) {
    on<ClientEvent>((event, emit) async {
      await event.map(
        onLoad: (_) async => await _onLoad(emit),
      );
    });
    add(const ClientEvent.onLoad());
  }

  final UserRepository _userRepository;
  final ClientRepository _clientRepository;

  Future<void> _onLoad(Emitter<ClientState> emit) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final currentUserRef = _userRepository.getCurrentUserRef();
      final clients = await _clientRepository.getClientsForUser(currentUserRef);

      emit(state.copyWith(
        status: Status.success,
        clients: clients,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: Status.error,
        errorMessage: e.toString(),
      ));
    }
  }
}
