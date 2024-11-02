import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marketinya/utils/color_utils.dart';
import 'package:marketinya/utils/image_utils.dart';

import '../utils/routes.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.activeTab});

  final String activeTab;

  static const double _fontSize = 20;
  static const double _toolbarHeight = 180;

  @override
  Size get preferredSize => const Size.fromHeight(_toolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Container(),
      toolbarHeight: _toolbarHeight,
      title: _title(context),
      scrolledUnderElevation: 0.0,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: _customDividerAndLabelSvgAndText(context),
      ),
    );
  }

  Widget _title(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.home);
          },
          child: Text(
            'Начало',
            style: TextStyle(
              fontSize: _fontSize,
              fontWeight: activeTab == 'Начало' ? FontWeight.bold : FontWeight.normal,
              color: activeTab == 'Начало' ? colorScheme.secondary : colorScheme.primary,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.blog);
          },
          child: Text(
            'Блог',
            style: TextStyle(
              fontSize: _fontSize,
              fontWeight: activeTab == 'Блог' ? FontWeight.bold : FontWeight.normal,
              color: activeTab == 'Блог' ? colorScheme.secondary : colorScheme.primary,
            ),
          ),
        ),
        _svgLogo(),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.services);
          },
          child: Text(
            'Услуги',
            style: TextStyle(
              fontSize: _fontSize,
              fontWeight: activeTab == 'Услуги' ? FontWeight.bold : FontWeight.normal,
              color: activeTab == 'Услуги' ? ColorUtils.limeGreen : ColorUtils.lightGray,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.connectWithUs);
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text(
            'Свържи се с нас',
            style: TextStyle(
              fontSize: _fontSize,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _svgLogo() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: SvgPicture.asset(
        height: 100,
        width: 126,
        ImageUtils.marketinyaLogoPath,
      ),
    );
  }

  Widget _customDividerAndLabelSvgAndText(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double dynamicWidth = screenWidth / 2 - 135;

    return Column(
      children: [
        Row(
          children: [
            Container(
              width: dynamicWidth,
              height: 2,
              color: ColorUtils.limeGreen,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: SvgPicture.asset(ImageUtils.marketinyaLabelPath),
            ),
            Expanded(
              child: Container(
                height: 2,
                color: ColorUtils.limeGreen,
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(top: 12, right: 50),
          child: Text(
            'По-добър маркетинг – по-добри резултати!',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w500,
              fontFamily: 'GothamPro',
            ),
          )
        ),
      ],
    );
  }
}
