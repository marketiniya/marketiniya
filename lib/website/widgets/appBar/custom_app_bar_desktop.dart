import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marketinya/core/utils/image_utils.dart';
import 'package:marketinya/core/utils/routes.dart';
import 'package:marketinya/website/widgets/appBar/widgets/marketiniya_logo.dart';
import 'package:marketinya/website/widgets/appBar/widgets/nav_button.dart';

class CustomAppBarDesktop extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBarDesktop({super.key, required this.activeTab});

  final String activeTab;
  static const double _fontSize = 20;
  static const double _toolbarHeight = 180;
  static const double _logoHeight = 100;
  static const double _logoWidth = 126;
  static const double _dividerHeight = 2;

  @override
  Size get preferredSize => const Size.fromHeight(_toolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: _toolbarHeight,
      title: _buildTitle(context),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: _buildBottomDividerAndLabel(context),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        NavButton(
          label: 'Начало',
          activeTab: activeTab,
          onPressed: () => Navigator.pushNamed(context, Routes.home),
          fontSize: _fontSize,
        ),
        NavButton(
          label: 'Блог',
          activeTab: activeTab,
          onPressed: () => Navigator.pushNamed(context, Routes.blog),
          fontSize: _fontSize,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: MarketiniyaLogo(width: _logoWidth, height: _logoHeight),
        ),
        NavButton(
          label: 'Услуги',
          activeTab: activeTab,
          onPressed: () => Navigator.pushNamed(context, Routes.services),
          fontSize: _fontSize,
        ),
        _buildContactButton(context),
      ],
    );
  }

  Widget _buildContactButton(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: 220,
          child: Padding(
            padding: const EdgeInsets.only(top: 25),
            child: _buildElevatedButton(context),
          ),
        );
      },
    );
  }

  Widget _buildElevatedButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Navigator.pushNamed(context, Routes.connectWithUs),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      child: const Text(
        'Свържи се с нас',
        style: TextStyle(fontSize: _fontSize, fontWeight: FontWeight.w600),
        semanticsLabel: 'Contact us button',
      ),
    );
  }

  Widget _buildBottomDividerAndLabel(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double adjustedWidth =
        screenWidth > 1500 ? screenWidth / 2.22 : screenWidth / 2.27;

    return Column(
      children: [
        Row(
          children: [
            _buildDividerLine(adjustedWidth, context),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: SvgPicture.asset(ImageUtils.marketinyaLabelPath),
            ),
            Expanded(
              child: _buildDividerLine(adjustedWidth, context),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(top: 6, left: 60),
          child: Text(
            'По-добър маркетинг – по-добри резултати!',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w500,
              fontFamily: 'GothamPro',
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDividerLine(double width, BuildContext context) {
    return Container(
      width: width,
      height: _dividerHeight,
      color: Theme.of(context).colorScheme.secondary,
    );
  }
}
