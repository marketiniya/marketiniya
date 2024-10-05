class BlogModel {
  BlogModel({
    required this.expandedValue,
    required this.headerValue,
    required this.imageAsset,
    required this.views,
    required this.date,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  String imageAsset;
  int views;
  String date;
  bool isExpanded;
}