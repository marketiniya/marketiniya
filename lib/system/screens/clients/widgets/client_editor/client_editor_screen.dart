import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketinya/core/config/service_locator.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/design_system/themes/app_colors.dart';
import 'package:marketinya/core/models/client.dart';
import 'package:marketinya/core/repositories/client_repository.dart';
import 'package:marketinya/core/repositories/user_repository.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/bloc/add_client_bloc.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/client_attachments_tab/client_files_page.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/enums/client_editor_tab.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/widget/client_form_page.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/widget/drawer/clients_drawer.dart';

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

  static final List<Widget> _tabs = [
    const ClientFormPage(),
    const ClientFilesPage(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: ClientEditorTab.values.length, vsync: this);
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
      create: (context) => AddClientBloc(
        getIt<UserRepository>(),
        getIt<ClientRepository>(),
        widget.client,
        widget.onClientUpdated,
      ),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClientsDrawer(
              onItemSelected: _onDrawerItemTap,
              selectedIndex: _tabController.index,
            ),
            Flexible(
              child: TabBarView(
                controller: _tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: _tabs.map((tab) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 180, top: xl, bottom: xl),
                    child: tab,
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
