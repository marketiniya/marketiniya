part of 'client_bloc.dart';

@freezed
class ClientEvent with _$ClientEvent {
  const factory ClientEvent.onLoad() = _OnLoad;

  const factory ClientEvent.onClientUpdated(Client client) = _OnClientUpdated;

  const factory ClientEvent.onSearch(String query) = _OnSearch;

  const factory ClientEvent.onPageChanged(int page) = _OnPageChanged;

  const factory ClientEvent.onItemsPerPageChanged(int itemsPerPage) = _OnItemsPerPageChanged;

  const factory ClientEvent.onFilterChanged(List<Filter> selectedFilters) = _OnFilterChanged;
}
