import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketinya/core/config/service_locator.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/client_attachments_tab/bloc/file_upload_bloc.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/client_attachments_tab/bloc/file_upload_event.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/client_attachments_tab/client_files_header.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/client_attachments_tab/enums/file_type.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/client_attachments_tab/widgets/file_section.dart';

class ClientFilesPage extends StatelessWidget {
  const ClientFilesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<FileUploadBloc>()
        ..add(const FileUploadEvent.loadAllSections()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ClientFilesHeader(),
          const SizedBox(height: lg),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 180),
              child: ListView(
                children: const [
                  FileSection(fileType: FileType.pdf),
                  FileSection(fileType: FileType.txt),
                  FileSection(fileType: FileType.image),
                  FileSection(fileType: FileType.video),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
