import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketinya/utils/color_utils.dart';
import 'package:marketinya/utils/image_utils.dart';

class BusinessInfoSectionMobile extends StatelessWidget {
  const BusinessInfoSectionMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeaderImage(),
        const SizedBox(height: 32),
        _buildImageWithPadding(ImageUtils.handsImage, height: 230),
        _buildSectionText(
          '•  Не сте сами\n\nНие печелим само ако и вие\nпечелите. Това е основата на\nуспешното сътрудничество.Ние\nсподеляме риска с вас, не е нужно\nда го поемате сами.',
        ),
        _buildImageWithPadding(ImageUtils.chartImage, height: 210),
        _buildSectionText(
          '•  Резултати\n\nНашият приоритет е да постигнем\nрезултати за вас. По-малко думи,\nповече действия.',
        ),
        _buildImageWithPadding(ImageUtils.mapImage, height: 210),
        _buildSectionText(
          '•  Ние сме местни\n\nНие не се крием в анонимен кол\nцентър. Работим на местно ниво в\nБългария, така че знаете къде да ни\nнамерите, ако\nимате нужда от нас.',
        ),
        _buildImageWithPadding(ImageUtils.peopleTableImage, height: 210),
        _buildSectionText(
          '•  Специализация\n\nНашите работни места са\nспециализирани, затова работим с\nиндустриите, в които знаем, че можем\nда осигурим резултати.',
        ),
      ],
    );
  }

  Widget _buildHeaderImage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              ImageUtils.businessManImagePath,
              width: double.infinity,
              height: 230,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 30,
            left: 16,
            child: Text(
              'Какво може\nда очаквате от нас?',
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                  color: ColorUtils.lightGray,
                  fontSize: 28,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            child: Text(
              'Помагаме на бизнесите да\nдостигат до повече клиенти.',
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                  color: ColorUtils.lightGray,
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageWithPadding(String imagePath, {double height = 210}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Image.asset(
          imagePath,
          width: double.infinity,
          height: height,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildSectionText(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 23, top: 12, bottom: 40),
      child: Text(
        text,
        style: GoogleFonts.roboto(
          textStyle: const TextStyle(
            fontSize: 22,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
