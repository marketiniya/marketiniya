import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marketinya/utils/image_utils.dart';
import 'package:marketinya/widgets/appBar/marketiniya_logo.dart';

class CustomAppBarMobile extends StatelessWidget {
  const CustomAppBarMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const MarketiniyaLogo(width: 37, height: 30),
              SvgPicture.asset(ImageUtils.marketinyaLabelPath),
              IconButton(
                icon: const Icon(Icons.menu),
                color: Colors.white,
                onPressed: () => _onPressed(context),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 1,
          color: Theme.of(context).colorScheme.secondary,
        )
      ],
    );
  }

  void _onPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const Dialog(
          //shape: ,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [],
          ),
        );
      },
    );
  }
}
