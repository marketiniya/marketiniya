import 'package:flutter/material.dart';
import 'package:marketinya/utils/color_utils.dart';

class ServiceCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final double fontSize;

  const ServiceCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;

    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: ColorUtils.limeGreen,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          width: screenWidth,
          height: 265,
          decoration: BoxDecoration(
            color: ColorUtils.charcoal,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(0, 2),
                blurRadius: 8,
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isSmallScreen ? 20 : 120, // Adjust padding based on screen size
            ),
            child: Row(
              children: [
                Flexible(
                  flex: 1, // Make the image take up 1/3 of the available space
                  child: ClipRRect(
                    child: Image.asset(
                      imagePath,
                      height: 265,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Flexible(
                  flex: 2, // Make the text and button take up 2/3 of the available space
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        Text(
                          title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: fontSize,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightGreen,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 35, vertical: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Научи повече',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(width: 12),
                              Icon(
                                Icons.arrow_forward_outlined,
                                color: Colors.black,
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
