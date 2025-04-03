import 'package:flutter/material.dart';
import 'package:marketinya/core/utils/color_utils.dart';
import 'package:marketinya/core/utils/routes.dart';


class CheckServicesAndFreeConsultationSection extends StatelessWidget {
  const CheckServicesAndFreeConsultationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 108,
      color: Colors.white,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 320,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.services);
                },
                style: ElevatedButton.styleFrom(
                  shadowColor: Colors.black.withOpacity(0.2),
                  splashFactory: InkRipple.splashFactory,
                  backgroundColor: ColorUtils.lightGray,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: const BorderSide(
                      color: ColorUtils.charcoal,
                      width: 2.0,
                    ),
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
                        color: ColorUtils.charcoal,
                      ),
                    ),
                    SizedBox(width: 12),
                    Icon(
                      Icons.arrow_forward_outlined,
                      color: ColorUtils.charcoal,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 25),
            SizedBox(
              width: 315,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.connectWithUs);
                },
                style: ElevatedButton.styleFrom(
                  overlayColor: ColorUtils.lightGray.withOpacity(0.3),
                  shadowColor: Colors.black.withOpacity(0.2),
                  splashFactory: InkRipple.splashFactory,
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Безплатна консултация',
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
          ],
        ),
      ),
    );
  }
}