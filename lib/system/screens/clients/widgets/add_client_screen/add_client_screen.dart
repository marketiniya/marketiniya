import 'package:flutter/material.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/design_system/themes/app_colors.dart';
import 'package:marketinya/system/screens/clients/widgets/add_client_screen/widget/header_section.dart';
import 'package:marketinya/system/screens/clients/widgets/clients_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/add_client_bloc.dart';
import 'widget/content_form.dart';

class AddClientScreen extends StatelessWidget {
  const AddClientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddClientBloc(),
      child: _AddClientScreenContent(),
    );
  }
}

class _AddClientScreenContent extends StatelessWidget {
  _AddClientScreenContent();

  final GlobalKey<AddClientFormState> _formKey = GlobalKey<AddClientFormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ClientsDrawer(),
          Flexible(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(180, xl, 180, lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: xl),
                    HeaderSection(formKey: _formKey),
                    const SizedBox(height: lg),
                    ContentForm(key: _formKey),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
