import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketinya/extensions/context_extension.dart';
import 'package:marketinya/services/firestore_service.dart';
import 'package:marketinya/utils/color_utils.dart';

class SubscriptionFormMobile extends StatefulWidget {
  const SubscriptionFormMobile({super.key});

  @override
  State<SubscriptionFormMobile> createState() => _SubscriptionFormMobileState();
}

class _SubscriptionFormMobileState extends State<SubscriptionFormMobile> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderText(),
            const SizedBox(height: 16),
            _buildEmailField(),
            const SizedBox(height: 16),
            _buildSubscribeButton(context),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Text _buildHeaderText() {
    return Text(
      'Бъдете в крак с новостите за\nдостигане на нови клиенти.',
      style:GoogleFonts.roboto(
        color: Colors.black,
        textStyle: const TextStyle(
          fontSize: 20,
            fontWeight: FontWeight.w500
        ),
      )
    );
  }

  SizedBox _buildEmailField() {
    return SizedBox(
      height: 55,
      child: TextFormField(
        controller: _emailController,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          filled: true,
          fillColor: ColorUtils.lightGray,
          labelText: 'Въведи имейл',
          labelStyle: const TextStyle(color: Colors.black),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: Colors.black,
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: Colors.black,
              width: 2.5,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 2.0,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 2.5,
            ),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Полето е задължително';
          }
          if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
            return 'Въведете валиден имейл адрес';
          }
          return null;
        },
      ),
    );
  }

  SizedBox _buildSubscribeButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            try {
              await FirestoreService.instance.subscribe(_emailController.text);
              context.showSuccessSnackBar('Успешно се абонирахте');
            } catch (e) {
              if (e.toString().contains('email-exists')) {
                context.showFailureSnackBar('Вече сте абонирани');
              } else {
                context.showFailureSnackBar('Възникна грешка с абонирането');
              }
            }
          }
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          splashFactory: InkRipple.splashFactory,
          shadowColor: Colors.black.withOpacity(0.2),
          backgroundColor: ColorUtils.charcoal,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: const Text(
          'Абониране',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
