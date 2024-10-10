import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/blog_data.dart';
import '../../models/blog_model.dart';
import '../../utils/color_utils.dart';

class BlogCards extends StatefulWidget {
  const BlogCards({super.key});

  @override
  State<BlogCards> createState() => _BlogCardsState();
}

class _BlogCardsState extends State<BlogCards> {
  @override
  void initState() {
    super.initState();
    _loadViews();
  }

  Future<void> _loadViews() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      for (var post in blogData) {
        post.views = prefs.getInt(post.headerValue) ?? post.views;
      }
    });
  }

  Future<void> _incrementViews(BlogModel post) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      post.views++;
      prefs.setInt(post.headerValue, post.views);
    });
  }

  void _toggleExpansion(BlogModel post) {
    setState(() {
      post.isExpanded = !post.isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: blogData.map<Widget>((BlogModel post) {
          return SizedBox(
            width: 552,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              color: ColorUtils.charcoal,
              margin: const EdgeInsets.only(bottom: 24.0),
              elevation: 4.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                    ),
                    child: SizedBox(
                      width: 552,
                      height: 265,
                      child: Image.asset(post.imageAsset, fit: BoxFit.cover),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      post.headerValue,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.visibility,
                          size: 16,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${post.views}',
                          style: const TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(width: 16),
                        const Icon(
                          Icons.access_time,
                          size: 16,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          'Време за прочит: 5 м.',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          post.date,
                          style: const TextStyle(color: Colors.grey),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.green,
                          ),
                          child: Text(
                            post.isExpanded ? 'Скрий' : 'Виж още',
                            style: const TextStyle(fontSize: 16),
                          ),
                          onPressed: () {
                            _toggleExpansion(post);
                            _incrementViews(post);
                          },
                        ),
                      ],
                    ),
                  ),
                  if (post.isExpanded) _buildExpandedContent(post),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Container _buildExpandedContent(BlogModel post) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: post.sections.map((section) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  section.header,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  section.content,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    height: 1.5, // Line height for better readability
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
