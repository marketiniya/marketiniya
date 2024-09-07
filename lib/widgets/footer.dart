import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marketinya/utils/color_utils.dart';
import 'package:marketinya/utils/image_utils.dart';
import 'package:marketinya/utils/routes.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.only(top: 60),
      child: SizedBox(
        height: height * 0.3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _imagesColumn(),
            _contactColumn(),
            _redirectTextButtons(context),
            _socialMediaColumn()
          ],
        ),
      ),
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
        const Spacer(),
        const Padding(
          padding: EdgeInsets.only(bottom: 24),
          child: Text(
            '© 2024 All Rights Reserved',
            style: TextStyle(fontSize: 14),
          ),
        )
      ],
    );
  }

  Widget _contactColumn() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Свържи се с нас',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 14.5),
          child: Row(
            children: [
              Icon(Icons.location_on_outlined, color: ColorUtils.lightGray),
              SizedBox(width: 13),
              Text(
                'България',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 16),
          child: Row(
            children: [
              Icon(Icons.mail_outline_outlined, color: ColorUtils.lightGray),
              SizedBox(width: 14),
              Text(
                'rumen.katincharov@marketiniya.bg',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 16),
          child: Row(
            children: [
              Icon(Icons.phone_in_talk_outlined, color: ColorUtils.lightGray),
              SizedBox(width: 14),
              Text(
                '+359 896 867 024',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        Spacer(),
        Padding(
          padding: EdgeInsets.only(bottom: 24),
          child: Row(
            children: [
              Text(
                "Политика за поверителност",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(width: 12),
              Text(
                "Условия за ползване",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _redirectTextButtons(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.services);
            },
            child: const Text(
              "Услуги",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.blog);
          },
          child: const Text(
            "Блог",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        )
      ],
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
            )
        ),
        const SizedBox(height: 28),
        Row(
          children: [
            GestureDetector(
              onTap: () {},
              child: SvgPicture.asset(ImageUtils.facebookLogo),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24,right: 24),
              child: GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(ImageUtils.instagramLogo),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(ImageUtils.linkedinLogo),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: SvgPicture.asset(ImageUtils.xLogo),
            ),
          ],
        )
      ],
    );
  }
}
