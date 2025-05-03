import 'package:flutter/material.dart';
import 'package:marketinya/core/config/service_locator.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/design_system/themes/app_colors.dart';
import 'package:marketinya/core/models/client.dart';
import 'package:marketinya/core/repositories/client_repository.dart';
import 'package:marketinya/core/repositories/user_repository.dart';
import 'package:marketinya/system/screens/clients/widgets/add_client_screen/widget/add_client_form.dart';
import 'package:marketinya/system/screens/clients/widgets/clients_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/add_client_bloc.dart';

class AddClientScreen extends StatelessWidget {
  const AddClientScreen({
    super.key,
    this.client,
  });

  final Client? client;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddClientBloc(
        getIt<UserRepository>(),
        getIt<ClientRepository>(),
        client,
      ),
      child: const _AddClientScreenContent(),
    );
  }
}

class _AddClientScreenContent extends StatelessWidget {
  const _AddClientScreenContent();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClientsDrawer(),
          Flexible(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: EdgeInsets.fromLTRB(180, xl, 180, lg),
                child: AddClientForm(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
