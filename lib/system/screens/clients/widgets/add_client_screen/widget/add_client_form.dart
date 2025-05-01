import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/system/screens/clients/widgets/add_client_screen/bloc/add_client_bloc.dart';
import 'package:marketinya/system/screens/clients/widgets/add_client_screen/bloc/add_client_state.dart';
import 'package:marketinya/system/screens/clients/widgets/add_client_screen/widget/header_section.dart';
import 'package:marketinya/system/screens/clients/widgets/add_client_screen/widget/content_form.dart';

class AddClientForm extends StatefulWidget {
  const AddClientForm({super.key});

  @override
  State<AddClientForm> createState() => _AddClientFormState();
}

class _AddClientFormState extends State<AddClientForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddClientBloc, AddClientState>(
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: xl),
              HeaderSection(formKey: _formKey),
              const SizedBox(height: lg),
              ContentForm(formKey: _formKey),
            ],
          ),
        );
      },
    );
  }
}
