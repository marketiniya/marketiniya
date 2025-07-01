import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketinya/core/navigation/routes.dart';
import 'package:marketinya/core/utils/color_utils.dart';

class ServiceCard3 extends StatefulWidget {
  const ServiceCard3({
    super.key,
    required this.imagePath,
    required this.title,
    required this.fontSize,
  });

  final String imagePath;
  final String title;
  final double fontSize;

  @override
  State createState() => _ServiceCard1State();
}

class _ServiceCard1State extends State<ServiceCard3> {
  bool _isImageClicked = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;

    return Padding(
      padding: const EdgeInsets.only(top: 72),
      child: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(vertical: 16),
          height: _isImageClicked ? 1100 : 265,
          width: screenWidth,
          child: Container(
            decoration: BoxDecoration(
              color: ColorUtils.charcoal,
              borderRadius: BorderRadius.circular(_isImageClicked ? 0 : 32),
            ),
            child: _isImageClicked
                ? _buildExpandedBackground()
                : _buildInitialCard(screenWidth, isSmallScreen),
          ),
        ),
      ),
    );
  }

  Widget _buildInitialCard(double screenWidth, bool isSmallScreen) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isSmallScreen ? 20 : 120,
      ),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: ClipRRect(
              child: Image.asset(
                widget.imagePath,
                height: 265,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 120),
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    widget.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: widget.fontSize,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isImageClicked = true;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreen,
                      padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isImageClicked = true;
                        });
                      },
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExpandedBackground() {
    return Stack(
      children: [
        Image.asset(
          'assets/service-background-3.png',
          fit: BoxFit.fill,
          width: double.infinity,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 72, horizontal: 132.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Разширете Вашият Онлайн Отпечатъĸ с Еĸспертна\nSEO Оптимизация',
                  style: TextStyle(
                    fontSize: 44,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 32),
                const Text(
                  'В дигиталния свят, видимостта е всичĸо. Да сте в горните\nрезултати на интернет търсачĸите гарантират оставането ви\nстъпĸа напред пред ĸонĸуренцията.',
                  style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 64),
                // Section Header
                const Text(
                  'С прецизно проучване на ĸлючови думи и безупречната\nинтеграция на съдържание, подсигурявате онлайн\nприсъствието на вашият бранд и достъп до по-голяма\nаудитория от потенциални ĸлиенти.\nПревърнете ĸлиĸванията в ĸонверсии и зрителите в лоялни\nĸлиенти. Маĸсимизирайте дигиталния си отпечатъĸ с\nправилна SEO оптимизация, ĸоято носи резултати. Бъдете\nлидер в своята индустрия.',
                  style: TextStyle(
                    fontSize: 44,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context.go(Routes.connectWithUs.path);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightGreen,
                        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        'Получете безплатна консултация',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
