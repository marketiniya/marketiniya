import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketinya/core/models/social_media_link.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/enums/business_sector.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/enums/client_status.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/enums/department.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/enums/priority_level.dart';

part 'client_editor_event.freezed.dart';

@freezed
class ClientEditorEvent with _$ClientEditorEvent {
  const factory ClientEditorEvent.load() = _Load;

  const factory ClientEditorEvent.companyNameChanged(String value) =
      _CompanyNameChanged;

  const factory ClientEditorEvent.nameChanged(String value) = _NameChanged;

  const factory ClientEditorEvent.dateOfBirthChanged(String value) =
      _DateOfBirthChanged;

  const factory ClientEditorEvent.departmentChanged(Department value) =
      _DepartmentChanged;

  const factory ClientEditorEvent.businessSectorChanged(BusinessSector value) =
      _BusinessSectorChanged;

  const factory ClientEditorEvent.companyIdChanged(String value) =
      _CompanyIdChanged;

  const factory ClientEditorEvent.personalIdChanged(String value) =
      _PersonalIdChanged;

  const factory ClientEditorEvent.emailChanged(String value) = _EmailChanged;

  const factory ClientEditorEvent.phoneChanged(String value) = _PhoneChanged;

  const factory ClientEditorEvent.clientStatusChanged(ClientStatus value) =
      _ClientStatusChanged;

  const factory ClientEditorEvent.priorityLevelChanged(PriorityLevel value) =
      _PriorityLevelChanged;

  const factory ClientEditorEvent.descriptionChanged(String value) =
      _DescriptionChanged;

  const factory ClientEditorEvent.socialLinksChanged(
      List<SocialMediaLink> value,) = _SocialLinksChanged;

  const factory ClientEditorEvent.hasBeenCalledChanged(bool value) =
      _HasBeenCalledChanged;

  const factory ClientEditorEvent.save() = _Save;

  const factory ClientEditorEvent.update() = _Update;

  const factory ClientEditorEvent.delete() = _Delete;

  const factory ClientEditorEvent.cancel() = _Cancel;
}
