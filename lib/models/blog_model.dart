import 'blog_section_model.dart';

class BlogModel {
  final String headerValue;
  final String imageAsset;
  final String date;
  final List<BlogSectionModel> sections;
  bool isExpanded;
  int views;

  BlogModel({
    required this.headerValue,
    required this.imageAsset,
    required this.date,
    required this.sections,
    this.isExpanded = false,
    this.views = 0,
  });
}