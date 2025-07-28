import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketinya/core/config/service_locator.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/design_system/themes/app_colors.dart';
import 'package:marketinya/core/enums/status.dart';
import 'package:marketinya/core/extensions/context_extension.dart';
import 'package:marketinya/core/models/client.dart';
import 'package:marketinya/core/navigation/routes.dart';
import 'package:marketinya/core/repositories/client_repository.dart';
import 'package:marketinya/core/repositories/user_repository.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/bloc/client_editor_bloc.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/bloc/client_editor_state.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/enums/client_editor_tab.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/shared/drawer/clients_drawer.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/tabs/attachments_tab/client_files_page.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/tabs/information_tab/client_form_page.dart';

class ClientEditorScreen extends StatefulWidget {
  const ClientEditorScreen({
    super.key,
    this.client,
    required this.onClientUpdated,
  });

  final Client? client;

  // Callback to update the client on the previous screen after changes
  final Function(Client) onClientUpdated;

  @override
  State<ClientEditorScreen> createState() => _ClientEditorScreenState();
}

class _ClientEditorScreenState extends State<ClientEditorScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late List<ClientEditorTab> _availableTabs;

  @override
  void initState() {
    super.initState();

    /// Define available tabs
    _availableTabs = [
      ClientEditorTab.information,
      if (widget.client != null) ClientEditorTab.attachments,
    ];

    _tabController = TabController(length: _availableTabs.length, vsync: this);
    _tabController.addListener(_handleTabChange);
  }

  void _handleTabChange() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  void _onDrawerItemTap(int index) {
    _tabController.animateTo(index);
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabChange);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ClientEditorBloc(
        getIt<UserRepository>(),
        getIt<ClientRepository>(),
        widget.client,
        widget.onClientUpdated,
      ),
      child: BlocListener<ClientEditorBloc, ClientEditorState>(
        listener: (context, state) {
          if (state.status == Status.success && state.shouldRedirectToHome) {
            context.showSuccessSnackBar('Client deleted successfully');
            context.go(Routes.systemHome.path);
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.background,
          body: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClientsDrawer(
                availableTabs: _availableTabs,
                onItemSelected: _onDrawerItemTap,
                selectedIndex: _tabController.index,
              ),
              Flexible(
                child: TabBarView(
                  controller: _tabController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: _availableTabs.map((tab) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: xl, horizontal: 180),
                    child: switch (tab) {
                      ClientEditorTab.information => const ClientFormPage(),
                      ClientEditorTab.attachments => ClientFilesPage(clientId: widget.client!.id)
                    },
                  ),).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
