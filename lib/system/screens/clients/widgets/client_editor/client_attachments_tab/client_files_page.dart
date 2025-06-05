import 'package:flutter/material.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/client_attachments_tab/client_files_header.dart';

class ClientFilesPage extends StatelessWidget {
  const ClientFilesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClientFilesHeader(),
        SizedBox(height: lg),
        Expanded(
          child: Center(
            child: Text(
              'File management content will be added here',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
