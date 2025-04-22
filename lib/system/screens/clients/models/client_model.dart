class ClientModel {
  final String clientNumber;
  final String name;
  final String identifier;
  final String sector;
  final bool isActive;

  const ClientModel({
    required this.clientNumber,
    required this.name,
    required this.identifier,
    required this.sector,
    required this.isActive,
  });
}

final List<String> _sampleCompanyNames = [
  'Marketiniya EOOD',
  'Tech Solutions Ltd',
  'Green Foods BG',
  'Smart Systems OOD',
  'Digital Marketing Pro',
  'Eco Solutions AD',
  'Web Design Plus',
  'Mobile Apps BG',
  'Cloud Services Ltd',
  'Data Systems EOOD',
];

final List<String> _sampleSectors = [
  '#Technology',
  '#Marketing',
  '#Food',
  '#Services',
  '#Healthcare',
  '#Education',
  '#Finance',
  '#Retail',
  '#Manufacturing',
  '#Consulting',
];

final List<ClientModel> sampleClients = List.generate(
  100,
  (index) => ClientModel(
    clientNumber: '#${(1234567890 + index).toString().padLeft(10, '0')}',
    name: _sampleCompanyNames[index % _sampleCompanyNames.length],
    identifier: (1234567890 + index * 11).toString().padLeft(10, '0'),
    sector: _sampleSectors[index % _sampleSectors.length],
    isActive: index % 3 != 0, // 2/3 of clients are active
  ),
);
