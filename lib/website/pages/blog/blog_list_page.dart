import 'package:flutter/material.dart';
import '../../../core/utils/color_utils.dart';
import '../../data/blog_data.dart';
import '../../models/blog_model.dart';
import '../../widgets/blog/blog_cards.dart';

class BlogListPage extends StatelessWidget {
  const BlogListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Blog',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Latest articles and updates',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 48),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 32,
                    crossAxisSpacing: 32,
                    childAspectRatio: 1.5,
                    children: [
                      _buildBlogCard(blogData1),
                      _buildBlogCard(blogData2),
                      _buildBlogCard(blogData3),
                      _buildBlogCard(blogData4),
                    ],
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
                    'Featured Articles',
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

  Widget _buildBlogCard(BlogModel blog) {
    return Card(
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(blog.imageAsset),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  blog.headerValue,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
