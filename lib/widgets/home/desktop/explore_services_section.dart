import 'package:flutter/material.dart';
import 'package:marketinya/utils/routes.dart';

import 'package:marketinya/utils/color_utils.dart';

class ExploreServicesSection extends StatelessWidget {
  const ExploreServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 108,
      color: Colors.white,
      child: Center(
        child: SizedBox(
          width: 330,
          height: 55,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.services);
            },
            style: ElevatedButton.styleFrom(
              overlayColor: ColorUtils.lightGray.withOpacity(0.3),
              shadowColor: Colors.black.withOpacity(0.2),
              splashFactory: InkRipple.splashFactory,
              backgroundColor: ColorUtils.charcoal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Разгледайте услугите ни',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 12),
                Icon(
                  Icons.arrow_forward_outlined,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
