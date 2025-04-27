import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketinya/core/enums/client_status.dart';
import 'package:marketinya/core/enums/status.dart';

part 'add_client_state.freezed.dart';

@freezed
class AddClientState with _$AddClientState {
  factory AddClientState({
    @Default(Status.initial) Status status,
    @Default('') String companyName,
    @Default('') String dateOfBirth,
    @Default('') String industry,
    @Default('') String personalOrCompanyId,
    @Default('') String phone,
    @Default(ClientStatus.active) ClientStatus clientStatus,
    @Default('') String description,
    String? errorMessage,
  }) = _AddClientState;
}
