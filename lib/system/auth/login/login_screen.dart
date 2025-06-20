import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketinya/core/config/service_locator.dart';
import 'package:marketinya/core/design_system/atoms/dimensions.dart';
import 'package:marketinya/core/design_system/atoms/images/marketiniya_images.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/design_system/molecules/button/action_button.dart';
import 'package:marketinya/core/design_system/molecules/fields.dart';
import 'package:marketinya/core/design_system/themes/marketiniya_colors.dart';
import 'package:marketinya/core/enums/action_button_size.dart';
import 'package:marketinya/core/enums/status.dart';
import 'package:marketinya/core/extensions/context_extension.dart';
import 'package:marketinya/core/navigation/routes.dart';
import 'package:marketinya/core/repositories/authentication_repository.dart';
import 'package:marketinya/core/utils/validators/field_validators.dart';
import 'package:marketinya/system/auth/login/bloc/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(getIt<AuthenticationRepository>()),
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
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = MarketiniyaColors(context);

    return Scaffold(
      backgroundColor: colors.backgrounds.standard,
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LoginLogoSection(colors:colors),
                const SizedBox(height: sm),
                LoginCard(
                  colors: colors,
                  emailFocusNode: _emailFocusNode,
                  passwordFocusNode: _passwordFocusNode,
                  validateAndSubmit: _validateAndSubmit,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _validateAndSubmit(BuildContext context) {
    FocusScope.of(context).unfocus();

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      context.read<LoginBloc>().add(const LoginEvent.onSubmitted());
    }
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.colors,
    required this.validateAndSubmit,
  });

  final MarketiniyaColors colors;
  final void Function(BuildContext context) validateAndSubmit;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status == Status.error) {
          context.showFailureSnackBar(state.errorMessage ?? 'Login failed');
        }

        if (state.status == Status.success) {
          context.go(Routes.systemHome.path);
        }
      },
      builder: (context, state) {
        return Expanded(
          child: PortalActionButton(
            title: 'Влез',
            isLoading: state.status == Status.loading,
            icon: const Icon(Icons.login),
            onPressed: () => validateAndSubmit(context),
            activeTitleColor: colors.buttons.secondary,
            disabledTitleColor: colors.texts.disabled,
            loaderColor: colors.buttons.loader,
            buttonType: ActionButtonSize.responsive,
            buttonColor: colors.buttons.primary,
            overlayButtonColor: colors.buttons.primaryOverlay,
          ),
        );
      },
    );
  }
}

class LoginBackButton extends StatelessWidget {
  const LoginBackButton({
    super.key,
    required this.colors,
  });

  final MarketiniyaColors colors;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PortalActionButton(
        title: 'Назад',
        icon: const Icon(Icons.arrow_back),
        activeTitleColor: colors.buttons.primary,
        onPressed: () => GoRouterHelper(context).pop(),
        disabledTitleColor: colors.texts.disabled,
        loaderColor: colors.buttons.loader,
        buttonType: ActionButtonSize.responsive,
        buttonColor: colors.buttons.secondary,
        borderColor: colors.buttons.primary,
        overlayButtonColor: colors.buttons.secondaryOverlay,
      ),
    );
  }
}

class ActionButtonsRow extends StatelessWidget {
  const ActionButtonsRow({
    super.key,
    required this.colors,
    required this.validateAndSubmit,
  });

  final MarketiniyaColors colors;
  final void Function(BuildContext) validateAndSubmit;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LoginBackButton(colors: colors),
        const SizedBox(width: xs),
        LoginButton(
          colors: colors,
          validateAndSubmit: validateAndSubmit,
        ),
      ],
    );
  }
}

class LoginTextField extends StatelessWidget {
  const LoginTextField({
    super.key,
    required this.colors,
    required this.focusNode,
    required this.labelText,
    required this.helperText,
    required this.suffixIcon,
    this.padding,
    this.obscureText = false,
    this.validator,
    this.onSaved,
  });

  final MarketiniyaColors colors;
  final FocusNode focusNode;
  final String labelText;
  final EdgeInsetsGeometry? padding;
  final String helperText;
  final IconData suffixIcon;
  final bool obscureText;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      labelText: labelText,
      helperText: helperText,
      filledColor: colors.backgrounds.standard,
      suffixIcon: suffixIcon,
      focusNode: focusNode,
      obscureText: obscureText,
      validator: validator,
      onSaved: onSaved,
    );
  }
}

class LoginCard extends StatelessWidget {
  const LoginCard({
    super.key,
    required this.colors,
    required this.emailFocusNode,
    required this.passwordFocusNode,
    required this.validateAndSubmit,
  });

  final MarketiniyaColors colors;
  final FocusNode emailFocusNode;
  final FocusNode passwordFocusNode;
  final void Function(BuildContext) validateAndSubmit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: imageWidth + xxxl,
      width: 350,
      child: Card(
        elevation: xxs,
        child: Padding(
          padding: dimen.all.sm,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoginTextField(
                colors: colors,
                focusNode: emailFocusNode,
                labelText: 'Емайл',
                helperText: 'Въведи потребителско име',
                suffixIcon: Icons.cancel_outlined,
                validator: FieldValidators.combine([
                  FieldValidators.notEmpty(),
                  FieldValidators.email(),
                ]),
                onSaved: (value) {
                  if (value != null) {
                    context
                        .read<LoginBloc>()
                        .add(LoginEvent.onEmailChanged(value));
                  }
                },
              ),
              LoginTextField(
                colors: colors,
                focusNode: passwordFocusNode,
                labelText: 'Парола',
                helperText: 'Въведи парола',
                suffixIcon: Icons.lock_outline,
                obscureText: true,
                validator:
                    FieldValidators.combine([FieldValidators.notEmpty()]),
                onSaved: (value) {
                  if (value != null) {
                    context
                        .read<LoginBloc>()
                        .add(LoginEvent.onPasswordChanged(value));
                  }
                },
              ),
              ActionButtonsRow(
                colors: colors,
                validateAndSubmit: validateAndSubmit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class LoginLogoSection extends StatelessWidget {

  const LoginLogoSection({super.key, required this.colors});
  final MarketiniyaColors colors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MarketiniyaImages.marketiniyaLogo(width: xl, height: lg),
            const SizedBox(width: xxs),
            MarketiniyaImages.marketiniyaLabelBacl(
              width: imageWidth,
              height: sm - micro,
              color: colors.backgrounds.black,
            ),
          ],
        ),
      ],
    );
  }
}
