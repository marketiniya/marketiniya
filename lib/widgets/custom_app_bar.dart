import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marketinya/utils/color_utils.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  static const double _fontSize = 20;
  static const double _toolbarHeight = 180;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: _toolbarHeight,
      title: _title(),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: _customDividerAndLabelSvgAndText(context),
      ),
    );
  }

  Widget _title() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(
          onPressed: () {},
          child: const Text(
            'Начало',
            style: TextStyle(fontSize: _fontSize),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Блог',
            style: TextStyle(fontSize: _fontSize),
          ),
        ),
        _svgLogo(),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Услуги',
            style: TextStyle(fontSize: _fontSize),
          ),
        ),
        ElevatedButton(
          onPressed: () {},
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
        'assets/marketinya-logo.svg',
      ),
    );
  }

  Widget _customDividerAndLabelSvgAndText(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double dynamicWidth = screenWidth / 2 - 165;

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
              child: SvgPicture.asset('assets/marketinya-label.svg'),
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
          padding: EdgeInsets.only(top: 12, right: 120),
          child: Text(
            'По-добър маркетинг – по-добри резултати!',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(_toolbarHeight);
}
