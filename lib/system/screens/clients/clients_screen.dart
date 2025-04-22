import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketinya/core/design_system/themes/app_colors.dart';
import 'package:marketinya/system/screens/clients/bloc/client_bloc.dart';
import 'package:marketinya/system/screens/clients/widgets/clients_drawer.dart';
import 'package:marketinya/system/screens/clients/widgets/content.dart';

class ClientsScreen extends StatelessWidget {
   const ClientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ClientBloc(),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return const Scaffold(
            backgroundColor: AppColors.background,
            body: Row(
              children: [
                ClientsDrawer(),
                Content(),
              ],
            ),
          );
        },
      ),
    );
  }
}
