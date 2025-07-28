import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketinya/core/enums/status.dart';
import 'package:marketinya/core/models/social_media_link.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/enums/business_sector.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/enums/client_status.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/enums/department.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/enums/priority_level.dart';

part 'client_editor_state.freezed.dart';

@freezed
class ClientEditorState with _$ClientEditorState {
  factory ClientEditorState({
    @Default(Status.initial) Status status,
    @Default(false) bool isUpdateMode,
    @Default(false) bool shouldRedirectToHome,
    @Default('') String companyName,
    @Default('') String name,
    @Default('') String dateOfBirth,
    @Default(Department.unknown) Department department,
    @Default(BusinessSector.unknown) BusinessSector businessSector,
    @Default('') String companyId,
    @Default('') String personalId,
    @Default('') String email,
    @Default('') String phone,
    @Default(ClientStatus.inactive) ClientStatus clientStatus,
    @Default(PriorityLevel.lowPriority) PriorityLevel priorityLevel,
    @Default('') String description,
    @Default([]) List<SocialMediaLink> socialLinks,
    @Default(false) bool hasBeenCalled,
    String? errorMessage,
  }) = _ClientEditorState;
}
