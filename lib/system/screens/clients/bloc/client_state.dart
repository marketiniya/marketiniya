import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketinya/core/enums/status.dart';
import 'package:marketinya/core/models/client.dart';
import 'package:marketinya/system/screens/clients/widgets/filter_multi_dropdown.dart';

part 'client_state.freezed.dart';

@freezed
class ClientState with _$ClientState {
  const factory ClientState({
    @Default(Status.initial) Status status,
    @Default([]) List<Client> clients,
    @Default('') String searchQuery,
    @Default(1) int currentPage,
    @Default(15) int itemsPerPage,
    @Default(Filter.defaultSelected) List<Filter> selectedFilters,
    String? errorMessage,
  }) = _ClientState;
}

extension ClientStateExtension on ClientState {
  List<Client> get filteredClients {
    if (searchQuery.isEmpty) {
      return clients;
    }

    final query = searchQuery.toLowerCase();
    return clients.where((client) {
      final filterChecks = {
        Filter.company: () => client.companyName.toLowerCase().contains(query),
        Filter.name: () => client.name.toLowerCase().contains(query),
        Filter.phone: () => client.phone.toLowerCase().contains(query),
        Filter.companyId: () => client.companyId.toLowerCase().contains(query),
        Filter.sector: () => client.businessSector.label.toLowerCase().contains(query),
        Filter.status: () => client.status.label.toLowerCase().contains(query),
        Filter.priority: () => client.priorityLevel.label.toLowerCase().contains(query),
      };

      return selectedFilters.any(
        (filter) => filterChecks.containsKey(filter) && filterChecks[filter]!(),
      );
    }).toList();
  }

  List<Client> get paginatedClients {
    final filtered = filteredClients;
    if (filtered.isEmpty) {
      return [];
    }

    final startIndex = (currentPage - 1) * itemsPerPage;
    final endIndex = startIndex + itemsPerPage;

    return filtered.sublist(
      startIndex,
      endIndex.clamp(0, filtered.length),
    );
  }

  int get totalPages {
    final filtered = filteredClients;
    if (filtered.isEmpty) {
      return 0;
    }
    return (filtered.length / itemsPerPage).ceil();
  }

  /// True if current page has no data to show
  bool get isCurrentPageOutOfBounds {
    final filteredData = filteredClients;
    if (filteredData.isEmpty) {
      return false;
    }

    final startIndex = (currentPage - 1) * itemsPerPage;
    return startIndex >= filteredData.length;
  }
}
