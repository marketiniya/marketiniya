import 'package:flutter/material.dart';
import 'package:marketinya/utils/color_utils.dart';
import 'package:marketinya/utils/image_utils.dart';

class BusinessInfoSection extends StatelessWidget {
  const BusinessInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(ImageUtils.businessManImagePath),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 156,
            vertical: 220,
          ),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: ColorUtils.lightGray.withOpacity(0.6),
              borderRadius: BorderRadius.circular(32),
            ),
            child: const Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 32),
                  child: Text(
                    'Какво може да очаквате от нас?',
                    style: TextStyle(
                      fontSize: 52,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 72,
                    vertical: 32,
                  ),
                  child: Text(
                    'Помагаме на бизнесите да достигат до повече \n ĸлиенти.',
                    style: TextStyle(
                      fontSize: 44,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
