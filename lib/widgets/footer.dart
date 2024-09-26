import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marketinya/utils/color_utils.dart';
import 'package:marketinya/utils/image_utils.dart';
import 'package:marketinya/utils/routes.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isSmallScreen = width < 600;

    return Padding(
      padding: const EdgeInsets.only(top: 60),
      child: SizedBox(
        height: isSmallScreen ? null : MediaQuery.of(context).size.height * 0.37,
        child: SingleChildScrollView(
          child: Column(
            children: [
              isSmallScreen ? _buildSmallScreenLayout(context) : _buildLargeScreenLayout(context),
              const SizedBox(height: 50),
              _buildFooterBottom(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSmallScreenLayout(BuildContext context) {
    return Column(
      children: [
        _imagesColumn(),
        const SizedBox(height: 20),
        _contactColumn(),
        const SizedBox(height: 20),
        _socialMediaColumn(),
        const SizedBox(height: 20),
        _redirectTextButtons(context),
      ],
    );
  }

  Widget _buildLargeScreenLayout(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _imagesColumn()),
        Expanded(child: _contactColumn()),
        Expanded(child: _redirectTextButtons(context)),
        Expanded(child: _socialMediaColumn())
      ],
    );
  }

  Widget _imagesColumn() {
    return Column(
      children: [
        SvgPicture.asset(
          height: 100,
          width: 126,
          ImageUtils.marketinyaLogoPath,
        ),
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
        const SizedBox(height: 14.5),
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
        Flexible(
          child: Text(
            text,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        )
      ],
    );
  }

  Widget _redirectTextButtons(BuildContext context) {
    return Column(
      children: [
        _footerTextButton(context, 'Услуги', Routes.services),
        _footerTextButton(context, 'Блог', Routes.blog),
      ],
    );
  }

  Widget _footerTextButton(BuildContext context, String text, String route) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
        child: Text(
          text,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }

  Widget _socialMediaColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Последвай ни",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 28),
        Wrap(
          spacing: 24,
          children: [
            _socialIcon(ImageUtils.facebookLogo),
            _socialIcon(ImageUtils.instagramLogo),
            _socialIcon(ImageUtils.linkedinLogo),
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

  Widget _buildFooterBottom() {
    return const Padding(
      padding: EdgeInsets.only(top: 24, bottom: 24),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 156),
            child: Text(
              '© 2024 All Rights Reserved',
              style: TextStyle(fontSize: 14),
            ),
          ),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Политика за поверителност',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                SizedBox(width: 12),
                Text(
                  'Условия за ползване',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
