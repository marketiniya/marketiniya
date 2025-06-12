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
import 'package:marketinya/core/enums/status.dart';
import 'package:go_router/go_router.dart';
import 'package:marketinya/core/enums/go_router_paths.dart';
import 'package:marketinya/core/extensions/context_extension.dart';
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
                _buildLogoSection(colors),
                const SizedBox(height: sm),
                _buildLoginCard(colors, context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogoSection(MarketiniyaColors colors) {
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

  Widget _buildLoginCard(MarketiniyaColors colors, BuildContext context) {
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
              _buildEmailField(colors, context),
              _buildPasswordField(colors, context),
              _buildActionButtons(colors, context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmailField(MarketiniyaColors colors, BuildContext context) {
    return CustomTextFormField(
      padding: dimen.bottom.xxs,
      labelText: 'Емайл',
      helperText: 'Въведи потребителско име',
      filledColor: colors.backgrounds.standard,
      suffixIcon: Icons.cancel_outlined,
      focusNode: _emailFocusNode,
      validator: FieldValidators.combine([
        FieldValidators.notEmpty(),
        FieldValidators.email(),
      ]),
      onSaved: (value) {
        if (value != null) {
          context.read<LoginBloc>().add(LoginEvent.onEmailChanged(value));
        }
      },
    );
  }

  Widget _buildPasswordField(MarketiniyaColors colors, BuildContext context) {
    return CustomTextFormField(
      padding: dimen.bottom.sm,
      labelText: 'Парола',
      helperText: 'Въведи парола',
      filledColor: colors.backgrounds.standard,
      suffixIcon: Icons.lock_outline,
      focusNode: _passwordFocusNode,
      obscureText: true,
      validator: FieldValidators.combine([
        FieldValidators.notEmpty(),
      ]),
      onSaved: (value) {
        if (value != null) {
          context.read<LoginBloc>().add(LoginEvent.onPasswordChanged(value));
        }
      },
    );
  }

  Widget _buildActionButtons(MarketiniyaColors colors, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildBackButton(colors),
        const SizedBox(width: xs),
        _buildLoginButton(colors, context),
      ],
    );
  }

  Widget _buildBackButton(MarketiniyaColors colors) {
    return Expanded(
      child: PortalActionButton(
        title: 'Назад',
        icon: const Icon(Icons.arrow_back),
        onPressed: () {},
        activeTitleColor: colors.buttons.primary,
        disabledTitleColor: colors.texts.disabled,
        loaderColor: colors.buttons.loader,
        buttonType: ActionButtonSize.responsive,
        buttonColor: colors.buttons.secondary,
        borderColor: colors.buttons.primary,
        overlayButtonColor: colors.buttons.secondaryOverlay,
      ),
    );
  }

  Widget _buildLoginButton(MarketiniyaColors colors, BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status == Status.error) {
          context.showFailureSnackBar(state.errorMessage ?? 'Login failed');
        }

        if (state.status == Status.success) {
          context.go(GoRouterPaths.systemHome.path);
        }
      },
      builder: (context, state) {
        return Expanded(
          child: PortalActionButton(
            title: 'Влез',
            isLoading: state.status == Status.loading,
            icon: const Icon(Icons.login),
            onPressed: () => _validateAndSubmit(context),
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

  void _validateAndSubmit(BuildContext context) {
    FocusScope.of(context).unfocus();

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      context.read<LoginBloc>().add(const LoginEvent.onSubmitted());
    }
  }
}
