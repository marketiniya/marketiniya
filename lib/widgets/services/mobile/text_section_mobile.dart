import 'package:flutter/material.dart';
import 'package:marketinya/utils/image_utils.dart';

class TextSectionMobile extends StatelessWidget {
  const TextSectionMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _backgroundImage(),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                'Как да извлечете\nмаксимум резултати\nот Маркетинг?',
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Какви са Ви опциите:',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 24),
              Text(
                '   •  Да свършите всичко сами?',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Това е добре, ако имате време.\nНо ако го нямате, това не е опция.',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 24),
              Text(
                '   •  Още служители?',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Намирането на правилния персонал\nне е лесно. Обучението на персонала\nе скъпо и отнема много време.\nДори да намерите перфектния човек\nза работата...\nЩе продължите да зависите от\nедин човек!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 24),
              Text(
                '   •  Да наемете голяма агенция?',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Ако нямате маркетинговия бюджет\nна Coca-Cola, Вашата рекламна\nкампания ще бъде управлявана\nот стажанта на някой\nопитен маркетолог.',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ],
    );
  }

  Widget _backgroundImage() {
    return SizedBox(
      width: double.infinity,
      height: 800,
      child: Image.asset(
        ImageUtils.socialMediaBackgroundPath,
        fit: BoxFit.cover,
      ),
    );
  }
}
