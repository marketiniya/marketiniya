import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marketinya/core/design_system/atoms/images/marketiniya_images.dart';
import 'package:marketinya/core/utils/image_utils.dart';
import 'package:marketinya/website/widgets/appBar/widgets/custom_dialog.dart';

class CustomAppBarMobile extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBarMobile({super.key, required this.activeTab});

  final String activeTab;
  @override
  Size get preferredSize => const Size.fromHeight(69);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MarketiniyaImages.marketiniyaLogo(width: 37, height: 30),
              SvgPicture.asset(ImageUtils.marketinyaLabelPath),
              IconButton(
                icon: const Icon(Icons.menu),
                color: Colors.white,
                onPressed: () => _showFallingDialog(context),
              ),
            ],
          ),
        ),
        Transform.translate(
          offset: const Offset(0, -4), // Move 4 pixels up
          child: Container(
            width: double.infinity,
            height: 1,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ],
    );
  }

  void _showFallingDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierColor: Colors.transparent,
      barrierDismissible: true,
      barrierLabel: 'Dismiss',
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        final slideAnimation = Tween<Offset>(
          begin: const Offset(0, -1),
          end: Offset.zero,
        ).animate(animation);
        return SlideTransition(
          position: slideAnimation,
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return CustomDialog(activeTab: activeTab);
      },
    );
  }
}
