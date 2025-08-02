import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketinya/core/config/service_locator.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/repositories/attachment_repository.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/tabs/attachments_tab/bloc/file_upload_bloc.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/tabs/attachments_tab/client_files_header.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/tabs/attachments_tab/enums/file_type.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/tabs/attachments_tab/services/file_validation_service.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/tabs/attachments_tab/widgets/file_section.dart';

class ClientFilesPage extends StatelessWidget {
  const ClientFilesPage({
    super.key,
    required this.clientId,
  });

  final String clientId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FileUploadBloc(
        getIt<AttachmentRepository>(),
        getIt<FileValidationService>(),
        clientId,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ClientFilesHeader(),
          const SizedBox(height: lg),
          Expanded(
            child: ListView.separated(
              itemCount: FileType.values.length,
              separatorBuilder: (context, index) => const SizedBox(height: xxsPlus),
              itemBuilder: (context, index) {
                final fileType = FileType.values[index];
                return FileSection(supportedFileType: fileType);
              },
            ),
          ),
        ],
      ),
    );
  }
}
