import 'package:flutter/material.dart';
import 'package:marketinya/core/utils/color_utils.dart';
import 'package:marketinya/core/utils/routes.dart';

class ServiceCard1 extends StatefulWidget {
  final String imagePath;
  final String title;
  final double fontSize;

  const ServiceCard1({
    super.key,
    required this.imagePath,
    required this.title,
    required this.fontSize,
  });

  @override
  State createState() => _ServiceCard1State();
}

class _ServiceCard1State extends State<ServiceCard1> {
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
          height: _isImageClicked ? 2200 : 265,
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
          'assets/service-background-1.png',
          fit: BoxFit.fill,
          width: double.infinity,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 72, horizontal: 132.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Main Header
                const Text(
                  'Преобразете своя бизнес с Маркетинг в\nСоциалните Мрежи',
                  style: TextStyle(
                    fontSize: 44,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 32),
                // Body Text
                const Text(
                  'В днешната дигитална ера, маркетингът в социалните мрежи\nне е просто опция – той е необходимост. Възползвайте се от\nмногобройните потребители в интернет пространството, за\nда достигнете до милиони потенциални клиенти,\nангажирайте вашата аудитория и развийте неразрушима\nвръзка с вашата общност.',
                  style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 64),
                // Section Header
                const Text(
                  'Какво предлагаме:',
                  style: TextStyle(
                    fontSize: 44,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 64),
                _buildListItem(
                  title: '• Създаване на съдържание:',
                  description:
                  'Завладяващи визуализации, ангажиращи постове и\nинтересни истории, които привличат внимание и стимулират\nангажираността на вашата аудитория.',
                ),
                const SizedBox(height: 64),
                _buildListItem(
                  title: '• Управление на рекламни кампании:',
                  description:
                  'От стратегия до изпълнение, ние управляваме вашите\nрекламни кампании, за да осигурим максимално\nвъздействие и възвръщаемост на инвестицията ви.',
                ),
                const SizedBox(height: 64),
                _buildListItem(
                  title: '• Управление на общността:',
                  description:
                  'Отдайте се на важните елементи от вашият бизнес, ние ще се\nпогрижим за развитието и поддържането на вашата общност\nот лоялни клиенти и последователи.',
                ),
                const SizedBox(height: 64),
                _buildListItem(
                  title: '• Анализ и отчетност:',
                  description:
                  'Комплексни отчети, които предоставят подробна\nинформация за вашето представяне в социалните мрежи и\nпоследващи стратегически стъпки.',
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.connectWithUs);
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

  Widget _buildListItem({required String title, required String description}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 44,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 32),
          Text(
            description,
            style: const TextStyle(
              fontSize: 38,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
