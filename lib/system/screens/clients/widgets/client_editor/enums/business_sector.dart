enum BusinessSector {
  onlineStores('Онлайн магазини'),
  restaurants('Ресторанти'),
  hotels('Хотели'),
  beautySalons('Салони за красота'),
  groceryStores('Хранителни магазини'),
  wineries('Винарни'),
  lawFirms('Адвокатски дружества'),
  accountingFirms('Счетоводни кантори'),
  serviceBusinesses('Бизнес с услуги'),
  fastFood('Fast food'),
  tattoos('Татуси'),
  other('Други'),
  unknown('Неизвестен');

  const BusinessSector(this.label);

  final String label;
}
