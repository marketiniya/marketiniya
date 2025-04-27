import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/design_system/themes/app_colors.dart';
import 'package:marketinya/system/screens/clients/bloc/client_bloc.dart';
import 'package:marketinya/system/screens/clients/widgets/clients_drawer.dart';
import 'package:marketinya/system/screens/clients/widgets/clients_table.dart';
import 'package:marketinya/system/screens/clients/widgets/content_header.dart';

class ClientsScreen extends StatelessWidget {
  const ClientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ClientBloc(),
      child: const Scaffold(
        backgroundColor: AppColors.background,
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClientsDrawer(),
            Flexible(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: xl),
                    ContentHeader(),
                    ContentTable(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
