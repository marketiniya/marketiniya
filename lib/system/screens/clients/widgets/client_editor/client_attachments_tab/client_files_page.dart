import 'package:flutter/material.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/client_attachments_tab/client_files_header.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/client_attachments_tab/widgets/file_section.dart';

class ClientFilesPage extends StatelessWidget {
  const ClientFilesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ClientFilesHeader(),
        const SizedBox(height: lg),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 180),
            child: ListView(
              children: const [
                  FileSection(
                    title: 'PDF',
                    showDivider: true,
                  ),
                  FileSection(
                    title: 'TXT',
                    showDivider: true,
                  ),
                  FileSection(
                    title: 'Image',
                    showDivider: true,
                  ),
                  FileSection(
                    title: 'Video',
                    showDivider: false,
                  ),
                  SizedBox(height: lg),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
