import 'package:flutter/material.dart';
import 'package:marketinya/utils/image_utils.dart';

class FeaturesWithImagesSection extends StatelessWidget {
  const FeaturesWithImagesSection({super.key});

  @override
  Widget build(BuildContext context) {
    const height = 100.0;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: [
          _featureRow(
            text: '    •  Не сте сами\n\nНие печелим само ако и\nвие печелите. Това е\nосновата на успешното\nсътрудничество.\nНие споделяме риска с вас,\nне е нужно да го поемате\nсами.',
            imagePath: ImageUtils.handsImage,
            isImageRight: true,
          ),
          const SizedBox(height: height),
          _featureRow(
            text: '   •  Резултати\n\nНашият приоритет е да\nпостигнем резултати за\nвас. По-малко думи,\nповече действия.',
            imagePath: ImageUtils.chartImage,
          ),
          const SizedBox(height: height),
          _featureRow(
            text: '   •  Ние сме местни\n\nНие не се крием в\nанонимен кол център.\nРаботим на местно ниво в\nБългария, така че знаете\nкъде да ни намерите, ако\nимате нужда от нас.',
            imagePath: ImageUtils.mapImage,
            isImageRight: true,
          ),
          const SizedBox(height: height),
          _featureRow(
            text: '   •  Специализация\n\nНашите работни места са\nспециализирани, затова\nработим с индустриите, в\nкоито знаем, че можем да\nосигурим резултати.',
            imagePath: ImageUtils.peopleTableImage,
          ),
          const SizedBox(height: height),
        ],
      ),
    );
  }

  Widget _featureRow({required String text, required String imagePath, bool isImageRight = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: isImageRight
          ? [
              Padding(
                padding: const EdgeInsets.only(right: 96),
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Image.asset(imagePath),
            ]
          : [
              Image.asset(imagePath),
              Padding(
                padding: const EdgeInsets.only(left: 96),
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
    );
  }
}
