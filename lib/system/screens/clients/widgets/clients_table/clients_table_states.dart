import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/design_system/molecules/error_state/error_state_view.dart';
import 'package:marketinya/core/design_system/themes/app_colors.dart';
import 'package:marketinya/system/screens/clients/bloc/client_bloc.dart';
import 'package:marketinya/system/screens/clients/widgets/clients_table/clients_table_constants.dart';

class ClientsTableLoadingState extends StatelessWidget {
  const ClientsTableLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: imageWidth),
      child: Center(
        child: CircularProgressIndicator(color: AppColors.oliveGreen),
      ),
    );
  }
}

class ClientsTableErrorState extends StatelessWidget {
  const ClientsTableErrorState({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: imageWidth),
      child: Center(
        child: ErrorStateView(
          message: ClientsTableConstants.errorMessage,
          onRetry: () => context.read<ClientBloc>().add(const ClientEvent.onLoad()),
        ),
      ),
    );
  }
}

class ClientsTableEmptyState extends StatelessWidget {
  const ClientsTableEmptyState({
    super.key,
    required this.searchQuery,
  });

  final String searchQuery;

  @override
  Widget build(BuildContext context) {
    final message = searchQuery.isEmpty
        ? ClientsTableConstants.noClientsMessage
        : '${ClientsTableConstants.noSearchResultsMessage} "$searchQuery"..';
    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: imageWidth),
      child: Center(
        child: Text(
          message,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
