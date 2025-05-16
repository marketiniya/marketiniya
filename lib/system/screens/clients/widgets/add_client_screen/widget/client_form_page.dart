import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/system/screens/clients/widgets/add_client_screen/bloc/add_client_bloc.dart';
import 'package:marketinya/system/screens/clients/widgets/add_client_screen/bloc/add_client_state.dart';
import 'package:marketinya/system/screens/clients/widgets/add_client_screen/widget/header_section.dart';
import 'package:marketinya/system/screens/clients/widgets/add_client_screen/widget/content_form.dart';

class ClientFormPage extends StatefulWidget {
  const ClientFormPage({super.key});

  @override
  State<ClientFormPage> createState() => _ClientFormPageState();
}

class _ClientFormPageState extends State<ClientFormPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddClientBloc, AddClientState>(
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
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
