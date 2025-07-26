enum Department {
  management('Управление'),
  sales('Продажби'),
  unknown('Неизвестен отдел');

  const Department(this.label);

  final String label;
}
