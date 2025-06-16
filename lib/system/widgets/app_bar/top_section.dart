import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketinya/core/config/service_locator.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/design_system/molecules/button/primary_button/primary_button.dart';
import 'package:marketinya/core/design_system/themes/app_colors.dart';
import 'package:marketinya/core/extensions/context_extension.dart';
import 'package:marketinya/core/navigation/routes.dart';
import 'package:marketinya/core/repositories/authentication_repository.dart';
import 'package:marketinya/core/repositories/user_repository.dart';
import 'package:marketinya/core/utils/image_utils.dart';
import 'package:marketinya/system/auth/bloc/authentication_bloc.dart';
import 'package:marketinya/system/auth/bloc/authentication_state.dart';
import 'package:marketinya/system/auth/login/login_screen.dart';

class TopSection extends StatelessWidget {
  const TopSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);

    return BlocProvider(
      create: (BuildContext context) => AuthenticationBloc(
        userRepository: getIt<UserRepository>(),
        authenticationRepository: getIt<AuthenticationRepository>(),
      )..add(const OnRefresh()),
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenSize.width <= 1344
                  ? screenSize.width * 0.10
                  : screenSize.width * 0.15,
              vertical: screenSize.height * 0.01,
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  ImageUtils.marketinyaLogoPath,
                  semanticsLabel: 'Marketinya logo',
                  width: xl + nano,
                  height: lg,
                ),
                const SizedBox(width: xxsPlus),
                SvgPicture.asset(
                  ImageUtils.marketinyaLabelPath,
                  semanticsLabel: 'Marketinya logo',
                  colorFilter: const ColorFilter.mode(
                    Colors.black,
                    BlendMode.srcIn,
                  ),
                  height: 20,
                ),
                const Spacer(),
                Text(
                  'Потребител: ${state.user?.firstName ?? ''} ${state.user?.lastName ?? ''}',
                  style: GoogleFonts.roboto(
                    color: Colors.black,
                    textStyle: const TextStyle(fontSize: xxsPlus + nano),
                  ),
                ),
                const SizedBox(width: 16),
                PrimaryButton.responsive(
                  title: 'Изход',
                  overlayButtonColor: AppColors.lightBeige,
                  onPressed: () {
                    context.pushReplacement(const LoginScreen(),
                        routeName: Routes.login.path,);
                    return context
                        .read<AuthenticationBloc>()
                        .add(const OnLogout());
                  },
                  icon: const Icon(
                    Icons.logout,
                    size: xs + nano,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
