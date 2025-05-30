import 'package:flutter/material.dart';
import 'package:marketinya/core/utils/color_utils.dart';
import 'package:marketinya/core/utils/routes.dart';


class FreeConsultationSection extends StatelessWidget {
  const FreeConsultationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 108,
      color: Colors.white,
      child: Center(
        child: SizedBox(
          width: 315,
          height: 55,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.connectWithUs);
            },
            style: ElevatedButton.styleFrom(
              overlayColor: ColorUtils.lightGray.withValues(alpha: 0.3),
              shadowColor: Colors.black.withValues(alpha: 0.2),
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
      ),
    );
  }
}
