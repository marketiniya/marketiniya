import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/bloc/client_editor_bloc.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/bloc/client_editor_state.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/tabs/information_tab/widgets/content_form.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/tabs/information_tab/widgets/header_section.dart';

class ClientFormPage extends StatefulWidget {
  const ClientFormPage({super.key});

  @override
  State<ClientFormPage> createState() => _ClientFormPageState();
}

class _ClientFormPageState extends State<ClientFormPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientEditorBloc, ClientEditorState>(
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: ListView(
            children: [
              HeaderSection(formKey: _formKey),
              const SizedBox(height: lg),
              ContentForm(formKey: _formKey, state: state),
            ],
          ),
        );
      },
    );
  }
}
