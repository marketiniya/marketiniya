import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marketinya/utils/color_utils.dart';
import 'package:marketinya/utils/image_utils.dart';
import '../utils/routes.dart';
import 'nav_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.activeTab});
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
      leading: const SizedBox.shrink(),
      toolbarHeight: _toolbarHeight,
      title: _buildTitle(context),
      scrolledUnderElevation: 0.0,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: _buildBottomDividerAndLabel(context),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Center(
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 16.0,
        runSpacing: 8.0,
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: _buildLogo(),
          ),
          NavButton(
            label: 'Услуги',
            activeTab: activeTab,
            onPressed: () => Navigator.pushNamed(context, Routes.services),
            fontSize: _fontSize,
          ),
          _buildContactButton(context),
        ],
      ),
    );
  }

  Widget _buildContactButton(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;

        final padding = screenWidth < 800
            ? const EdgeInsets.symmetric(horizontal: 8, vertical: 16)
            : screenWidth < 1300
                ? const EdgeInsets.symmetric(horizontal: 12, vertical: 24)
                : const EdgeInsets.symmetric(horizontal: 16, vertical: 24);

        return SizedBox(
          width: screenWidth < 800 ? 180 : 220,
          child: Padding(
            padding: const EdgeInsets.only(top: 25),
            child: activeTab == 'Свържи се с нас'
                ? _buildTextButton(context, padding)
                : _buildElevatedButton(context, padding),
          ),
        );
      },
    );
  }

  Widget _buildTextButton(BuildContext context, EdgeInsets padding) {
    return TextButton(
      onPressed: () => Navigator.pushNamed(context, Routes.connectWithUs),
      style: TextButton.styleFrom(
        padding: padding,
        backgroundColor: ColorUtils.charcoal,
        foregroundColor: ColorUtils.limeGreen,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      child: const Text(
        'Свържи се с нас',
        style: TextStyle(fontSize: _fontSize),
        semanticsLabel: 'Contact us button',
      ),
    );
  }

  Widget _buildElevatedButton(BuildContext context, EdgeInsets padding) {
    return ElevatedButton(
      onPressed: () => Navigator.pushNamed(context, Routes.connectWithUs),
      style: ElevatedButton.styleFrom(
        padding: padding,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      child: const Text(
        'Свържи се с нас',
        style: TextStyle(fontSize: _fontSize, fontWeight: FontWeight.w600),
        semanticsLabel: 'Contact us button',
      ),
    );
  }

  Widget _buildLogo() {
    return SvgPicture.asset(
      ImageUtils.marketinyaLogoPath,
      height: _logoHeight,
      width: _logoWidth,
      semanticsLabel: 'Marketinya logo',
    );
  }

  Widget _buildBottomDividerAndLabel(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final dividerWidth =
        screenWidth <= 1300 ? screenWidth / 2 - 160 : screenWidth / 2 - 64;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            children: [
              _buildDividerLine(dividerWidth, context),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: SvgPicture.asset(ImageUtils.marketinyaLabelPath),
              ),
              Expanded(
                child: _buildDividerLine(dividerWidth, context),
              ),
            ],
          ),
        ),
        Padding(
          padding: _getResponsiveLabelPadding(screenWidth),
          child: const Text(
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

  EdgeInsets _getResponsiveLabelPadding(double screenWidth) {
    return screenWidth <= 1300
        ? const EdgeInsets.only(top: 6, right: 130)
        : const EdgeInsets.only(top: 6, left: 90);
  }
}
