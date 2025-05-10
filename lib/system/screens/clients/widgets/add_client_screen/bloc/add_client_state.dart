import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketinya/core/enums/business_sector.dart';
import 'package:marketinya/core/enums/client_status.dart';
import 'package:marketinya/core/enums/status.dart';

part 'add_client_state.freezed.dart';

@freezed
class AddClientState with _$AddClientState {
  factory AddClientState({
    @Default(Status.initial) Status status,
    @Default(false) bool isUpdateMode, // True when updating an existing client.
    @Default('') String companyName,
    @Default('') String dateOfBirth,
    @Default(BusinessSector.unknown) BusinessSector businessSector,
    @Default('') String companyId,
    @Default('') String personalId,
    @Default('') String phone,
    @Default(ClientStatus.inactive) ClientStatus clientStatus,
    @Default('') String description,
    String? errorMessage,
  }) = _AddClientState;
}
