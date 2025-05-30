import 'package:flutter/material.dart';
import 'package:marketinya/core/utils/routes.dart';

class CheckOurServicesSection extends StatelessWidget {
  const CheckOurServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 108,
      color: Colors.white,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 16),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.services);
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              splashFactory: InkRipple.splashFactory,
              shadowColor: Colors.black.withValues(alpha: 0.2),
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
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
                Icon(Icons.arrow_forward, color: Colors.white),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
