import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketinya/core/config/service_locator.dart';
import 'package:marketinya/core/design_system/atoms/dimensions.dart';
import 'package:marketinya/core/design_system/atoms/images/marketiniya_images.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/design_system/molecules/button/action_button.dart';
import 'package:marketinya/core/design_system/molecules/fields.dart';
import 'package:marketinya/core/design_system/themes/marketiniya_colors.dart';
import 'package:marketinya/core/enums/action_button_size.dart';
import 'package:marketinya/core/repositories/authentication_repository.dart';
import 'package:marketinya/core/utils/validators/field_validators.dart';
import 'bloc/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(
        authenticationRepository: getIt<AuthenticationRepository>(),
      ),
      child: const _LoginScreen(),
    );
  }
}

class _LoginScreen extends StatefulWidget {
  const _LoginScreen();

  @override
  State<_LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<_LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final color = MarketiniyaColors(context);

    return Form(
      key: _formKey,
      child: Container(
        color: MarketiniyaColors(context).backgrounds.standard,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Padding(
                  padding: dimen.bottom.sm,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MarketiniyaImages.marketiniyaLogo(width: xl, height: lg),
                      const SizedBox(width: xxs),
                      MarketiniyaImages.marketiniyaLabelBacl(
                        width: imageWidth,
                        height: sm - micro,
                        color: color.backgrounds.black,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: imageWidth + xxxl,
                  width: imageWidth + xxxl + xs + micro,
                  child: Card(
                    elevation: xxs,
                    child: Padding(
                      padding: dimen.all.sm,
                      child: Column(
                        children: [
                          CustomTextFormField(
                            padding: dimen.bottom.xxs,
                            labelText: 'Емайл',
                            helperText: 'Въведи потребителско име',
                            filledColor: color.backgrounds.standard,
                            suffixIcon: Icons.cancel_outlined,
                            validator: FieldValidators.combine([
                              FieldValidators.notEmpty(),
                              FieldValidators.email(),
                            ]),
                          ),
                          CustomTextFormField(
                            padding: dimen.bottom.sm,
                            labelText: 'Парола',
                            helperText: 'Въведи парола',
                            filledColor: color.backgrounds.standard,
                            suffixIcon: Icons.lock_outline,
                            validator: FieldValidators.combine([
                              FieldValidators.notEmpty(),
                            ]),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              PortalActionButton(
                                title: 'Назад',
                                icon: Icon(Icons.arrow_back),
                                onPressed: () {},
                                activeTitleColor: Color(0xFF708446),
                                disabledTitleColor: color.texts.disabled,
                                loaderColor: Colors.yellow,
                                buttonType: ActionButtonSize.responsive,
                                buttonColor: Colors.white,
                                borderColor: Color(0xFF708446),
                              ),
                              const SizedBox(width: xs),
                              PortalActionButton(
                                title: 'Влез',
                                icon: Icon(Icons.login),
                                onPressed: () {},
                                activeTitleColor: Colors.white,
                                disabledTitleColor: color.texts.disabled,
                                loaderColor: Colors.yellow,
                                buttonType: ActionButtonSize.responsive,
                                buttonColor: Color(0xFF708446),
                                overlayButtonColor: Color(0xFF5F6F39),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
