import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketinya/core/models/social_media_link.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/enums/business_sector.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/enums/client_status.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/enums/department.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/enums/priority_level.dart';

part 'add_client_event.freezed.dart';

@freezed
class AddClientEvent with _$AddClientEvent {
  const factory AddClientEvent.load() = _Load;

  const factory AddClientEvent.companyNameChanged(String value) =
      _CompanyNameChanged;

  const factory AddClientEvent.nameChanged(String value) = _NameChanged;

  const factory AddClientEvent.dateOfBirthChanged(String value) =
      _DateOfBirthChanged;

  const factory AddClientEvent.departmentChanged(Department value) =
      _DepartmentChanged;

  const factory AddClientEvent.businessSectorChanged(BusinessSector value) =
      _BusinessSectorChanged;

  const factory AddClientEvent.companyIdChanged(String value) =
      _CompanyIdChanged;

  const factory AddClientEvent.personalIdChanged(String value) =
      _PersonalIdChanged;

  const factory AddClientEvent.phoneChanged(String value) = PhoneChanged;

  const factory AddClientEvent.clientStatusChanged(ClientStatus value) =
      _ClientStatusChanged;

  const factory AddClientEvent.priorityLevelChanged(PriorityLevel value) =
      _PriorityLevelChanged;

  const factory AddClientEvent.descriptionChanged(String value) =
      _DescriptionChanged;

  const factory AddClientEvent.socialLinksChanged(List<SocialMediaLink> value) =
      _SocialLinksChanged;

  const factory AddClientEvent.save() = _SaveClient;

  const factory AddClientEvent.update() = _UpdateClient;

  const factory AddClientEvent.delete() = _DeleteClient;
}
