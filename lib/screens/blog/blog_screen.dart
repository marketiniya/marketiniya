import 'package:flutter/material.dart';
import 'package:marketinya/config/responsive_layout.dart';
import 'package:marketinya/screens/blog/layout/blog_mobile_layout.dart';

import 'layout/blog_desktop_layout.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobile: BlogMobileLayout(),
      desktop: BlogDesktopLayout(),
    );
  }
}
