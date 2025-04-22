import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'client_event.dart';
part 'client_state.dart';
part 'client_bloc.freezed.dart';

class ClientBloc extends Bloc<ClientEvent, ClientState> {
  ClientBloc() : super(const ClientState.initial()) {
    on<ClientEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
