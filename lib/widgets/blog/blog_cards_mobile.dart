import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:marketinya/data/blog_data.dart';
import 'package:marketinya/models/blog_model.dart';
import 'package:marketinya/utils/color_utils.dart';

class BlogCardsMobile extends StatefulWidget {
  const BlogCardsMobile({super.key});

  @override
  State<BlogCardsMobile> createState() => _BlogCardsMobileState();
}

class _BlogCardsMobileState extends State<BlogCardsMobile> {
  @override
  void initState() {
    super.initState();
    _loadViews();
  }

  Future<void> _loadViews() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      blogData1.views = prefs.getInt(blogData1.headerValue) ?? blogData1.views;
      blogData2.views = prefs.getInt(blogData2.headerValue) ?? blogData2.views;
      blogData3.views = prefs.getInt(blogData3.headerValue) ?? blogData3.views;
      blogData4.views = prefs.getInt(blogData4.headerValue) ?? blogData4.views;
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
    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: Container(
        width: double.infinity,
        color: ColorUtils.limeGreen,
        child: Column(
          children: [
            buildCard(blogData1),
            buildCard(blogData2),
            buildCard(blogData3),
            buildCard(blogData4),
          ],
        ),
      ),
    );
  }

  Widget buildCard(BlogModel post) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 20, right: 16),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        color: ColorUtils.charcoal,
        margin: const EdgeInsets.only(bottom: 24.0),
        elevation: 4.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
              child: SizedBox(
                width: double.infinity,
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
                textAlign: TextAlign.start,
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
                  const Icon(Icons.access_time, size: 16, color: Colors.grey),
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
              padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
                    height: 1.5,
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
