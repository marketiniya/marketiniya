import 'package:flutter/material.dart';
import 'package:marketinya/core/utils/color_utils.dart';
import 'package:marketinya/website/models/blog_model.dart';
import 'package:marketinya/website/widgets/blog/blog_cards.dart';

class BlogDetailPage extends StatelessWidget {
  const BlogDetailPage({super.key, required this.blog});

  final BlogModel blog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(blog.imageAsset),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    blog.headerValue,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today, size: 16),
                      const SizedBox(width: 8),
                      Text(blog.date),
                      const SizedBox(width: 24),
                      const Icon(Icons.visibility, size: 16),
                      const SizedBox(width: 8),
                      Text('${blog.views} views'),
                    ],
                  ),
                  const SizedBox(height: 32),
                  ...blog.sections.map(
                    (section) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          section.header,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          section.content,
                          style: const TextStyle(
                            fontSize: 16,
                            height: 1.6,
                          ),
                        ),
                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: ColorUtils.limeGreen,
              padding: const EdgeInsets.all(32.0),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Related Articles',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 24),
                  BlogCards(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
