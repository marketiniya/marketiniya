import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketinya/core/enums/client_status.dart';

part 'add_client_event.freezed.dart';

@freezed
class AddClientEvent with _$AddClientEvent {
  const factory AddClientEvent.load() = _Load;

  const factory AddClientEvent.companyNameChanged(String value) =
      _CompanyNameChanged;

  const factory AddClientEvent.dateOfBirthChanged(String value) =
      _DateOfBirthChanged;

  const factory AddClientEvent.industryChanged(String value) = _IndustryChanged;

  const factory AddClientEvent.personalOrCompanyIdChanged(String value) =
      _PersonalOrCompanyIdChanged;

  const factory AddClientEvent.phoneChanged(String value) = PhoneChanged;

  const factory AddClientEvent.clientStatusChanged(ClientStatus value) =
      _ClientStatusChanged;

  const factory AddClientEvent.descriptionChanged(String value) =
      _DescriptionChanged;

  const factory AddClientEvent.save() = _SaveClient;

  const factory AddClientEvent.update() = _UpdateClient;
}
