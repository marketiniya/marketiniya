import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:marketinya/core/enums/go_router_paths.dart';
import 'package:marketinya/core/utils/color_utils.dart';
import 'package:marketinya/core/utils/image_utils.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildScreenLayout(context),
            _buildFooterBottom(),
          ],
        ),
      ),
    );
  }

  Widget _buildScreenLayout(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _imagesColumn(),
        const SizedBox(width: 140),
        _contactColumn(),
        const SizedBox(width: 86),
        _redirectTextButtons(context),
        const SizedBox(width: 184),
        _socialMediaColumn(),
      ],
    );
  }

  Widget _imagesColumn() {
    return Column(
      children: [
        SvgPicture.asset(ImageUtils.marketinyaLogoPath),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: SvgPicture.asset(ImageUtils.marketinyaLabelPath),
        ),
      ],
    );
  }

  Widget _contactColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Свържи се с нас',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 28),
        _contactInfo(Icons.location_on_outlined, 'България'),
        const SizedBox(height: 16),
        _contactInfo(Icons.mail_outline_outlined, 'rumen.katincharov@marketiniya.bg'),
        const SizedBox(height: 16),
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

  Widget _redirectTextButtons(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, 35), // Move the entire column 35 pixels downwards
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _footerTextButton(context, 'За нас', GoRouterPaths.home.path),
          _footerTextButton(context, 'Услуги', GoRouterPaths.services.path),
          _footerTextButton(context, 'Цени', GoRouterPaths.home.path),
          _footerTextButton(context, 'Блог', GoRouterPaths.blog.path),
          _footerTextButton(context, 'Екип', GoRouterPaths.home.path),
        ],
      ),
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

  Widget _socialMediaColumn() {
    return Transform.translate(
      offset: const Offset(0, -35), // Move the entire column 35 pixels upward
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Последвай ни',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 28),
          Row(
            children: [
              _socialIcon(ImageUtils.facebookLogo),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: _socialIcon(ImageUtils.instagramLogo),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 24),
                child: _socialIcon(ImageUtils.linkedinLogo),
              ),
              _socialIcon(ImageUtils.xLogo),
            ],
          ),
        ],
      ),
    );
  }

  Widget _socialIcon(String assetPath) {
    return GestureDetector(
      onTap: () {},
      child: SvgPicture.asset(assetPath),
    );
  }

  Widget _buildFooterBottom() {
    return const Padding(
      padding: EdgeInsets.only(top: 90, bottom: 24),
      child: Row(
        children: [
          Text('© 2024 All Rights Reserved',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(width: 250),
          Text('Политика за поверителност',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          SizedBox(width: 30),
          Text('Условия за ползване',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
