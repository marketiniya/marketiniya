import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketinya/core/design_system/atoms/dimensions.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/design_system/themes/app_colors.dart';

class ClientsDrawer extends StatelessWidget {
  const ClientsDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: dimen.top.sm,
      child: Drawer(
        elevation: 15,
        shadowColor: Colors.black.withValues(alpha: 3),
        surfaceTintColor: Colors.transparent,
        width: 80,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.mutedOlive,
                AppColors.lightBeige,
              ],
              stops: [1, 2],
            ),
          ),
          child: ListView(
            children: [
              const SizedBox(height: 28),
              const DrawerButton(),
              const SizedBox(height: lg),
              Column(
                children: [
                  Padding(
                    padding: dimen.horizontal.xxsPlus,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xFFC1C29E),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.group),
                      ),
                    ),
                  ),
                  const SizedBox(height: micro),
                  Text(
                    'Клиенти',
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: xxsPlus,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );;
  }
}
