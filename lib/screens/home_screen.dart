import 'package:flutter/material.dart';
import 'package:marketinya/utils/color_utils.dart';
import 'package:marketinya/utils/image_utils.dart';
import 'package:marketinya/widgets/custom_app_bar.dart';
import 'package:marketinya/widgets/footer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const CustomAppBar(
        activeTab: 'Начало',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Positioned(
                  top: 110,
                  left: width * 0.19,
                  child: Image.asset(
                    ImageUtils.socialMediaBackgroundPath,
                    width: 952,
                    height: 635,
                    fit: BoxFit.cover,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _textAndButtonsColumn(),
                    _pcImageStack(),
                  ],
                ),
              ],
            ),
            const Footer(),
          ],
        )
      ),
    );
  }

  Padding _header1() {
    return const Padding(
      padding: EdgeInsets.only(top: 124, bottom: 32),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          "Трансформирайте вашия бизнес",
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  Column _textAndButtonsColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _header1(),
        const Text(
          "Увеличете продажбите с\nпомощта на правилно\nпозиционирани\nреĸламни ĸампании.",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 100),
        SizedBox(
          height: 60,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorUtils.charcoal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: const BorderSide(
                  color: ColorUtils.lightGray,
                  width: 1, // Outline width
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            ),
            child: const Row(
              children: [
                Text(
                  'Разгледайте услугите ни',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: ColorUtils.lightGray,
                  ),
                ),
                SizedBox(width: 12),
                Icon(Icons.arrow_forward, color: ColorUtils.lightGray),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          height: 60,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorUtils.lightGray,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            ),
            child: const Row(
              children: [
                Text(
                  'Безплатна консултация',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: ColorUtils.charcoal,
                  ),
                ),
                SizedBox(width: 12),
                Icon(Icons.arrow_forward, color: ColorUtils.charcoal),
              ],
            ),
          ),
        )
      ],
    );
  }

  Stack _pcImageStack(){
    return Stack(
      children: [
        Image.asset(
          'assets/pc-image.png',
          //width: 864,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 96,
          left: 243,
          child: Image.asset(
            'assets/desktop-image.png',
            width: 457,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
