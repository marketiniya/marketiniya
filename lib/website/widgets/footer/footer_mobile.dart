import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:marketinya/core/enums/go_router_paths.dart';
import 'package:marketinya/core/utils/color_utils.dart';
import 'package:marketinya/core/utils/image_utils.dart';

class FooterMobile extends StatelessWidget {
  const FooterMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLogoSection(),
          const SizedBox(height: 40),
          _buildContactSection(),
          const SizedBox(height: 40),
          _socialMediaColumn(),
          const SizedBox(height: 40),
          _buildNavigationLinks(context),
          const SizedBox(height: 40),
          _buildFooterBottom(),
        ],
      ),
    );
  }

  Widget _buildLogoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: SvgPicture.asset(ImageUtils.marketinyaLogoPath),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: SvgPicture.asset(ImageUtils.marketinyaLabelPath),
        ),
      ],
    );
  }

  Widget _buildContactSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Свържи се с нас',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 16),
        _contactInfo(Icons.location_on_outlined, 'България'),
        const SizedBox(height: 12),
        _contactInfo(
          Icons.mail_outline_outlined,
          'rumen.katincharov@marketiniya.bg',
        ),
        const SizedBox(height: 12),
        _contactInfo(Icons.phone_in_talk_outlined, '+359 896 867 024'),
      ],
    );
  }

  Widget _contactInfo(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: ColorUtils.lightGray),
        const SizedBox(width: 13),
        Text(
          text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }

  Widget _socialMediaColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Последвай ни',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            _socialIcon(ImageUtils.facebookLogo),
            const SizedBox(width: 24),
            _socialIcon(ImageUtils.instagramLogo),
            const SizedBox(width: 24),
            _socialIcon(ImageUtils.linkedinLogo),
            const SizedBox(width: 24),
            _socialIcon(ImageUtils.xLogo),
          ],
        ),
      ],
    );
  }

  Widget _socialIcon(String assetPath) {
    return GestureDetector(
      onTap: () {},
      child: SvgPicture.asset(assetPath),
    );
  }

  Widget _buildNavigationLinks(BuildContext context) {
    final links = [
      {'text': 'За нас', 'route': GoRouterPaths.home.path},
      {'text': 'Услуги', 'route': GoRouterPaths.services.path},
      {'text': 'Цени', 'route': GoRouterPaths.home.path},
      {'text': 'Блог', 'route': GoRouterPaths.blog.path},
      {'text': 'Екип', 'route': GoRouterPaths.home.path},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: links
          .map(
            (link) => _footerTextButton(context, link['text']!, link['route']!),
          )
          .toList(),
    );
  }

  Widget _footerTextButton(BuildContext context, String text, String route) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextButton(
        onPressed: () {
          context.go(route);
        },
        child: Text(
          text,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }

  Widget _buildFooterBottom() {
    return const Padding(
      padding: EdgeInsets.only(right: 16, bottom: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Политика за поверителност',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          SizedBox(width: 16),
          Text(
            'Условия за ползване',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 40),
          Text(
            '© 2024 All Rights Reserved',
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
