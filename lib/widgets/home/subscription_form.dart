import 'package:flutter/material.dart';
import 'package:marketinya/extensions/context_extension.dart';
import '../../services/firestore_service.dart';
import '../../utils/color_utils.dart';

class SubscriptionForm extends StatefulWidget {
  const SubscriptionForm({super.key});

  @override
  State<SubscriptionForm> createState() => _SubscriptionFormState();
}

class _SubscriptionFormState extends State<SubscriptionForm> {
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildHeaderText(),
            const SizedBox(width: 85),
            _buildEmailField(),
            const SizedBox(width: 25),
            _buildSubscribeButton(context),
          ],
        ),
      ),
    );
  }

  // Build header text
  Widget _buildHeaderText() {
    return const Text(
      'Бъдете в крак с новостите за\nдостигане на нови клиенти.',
      style: TextStyle(
        color: Colors.black,
        fontSize: 26,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildEmailField() {
    return SizedBox(
      width: 260,
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

  ElevatedButton _buildSubscribeButton(BuildContext context) {
    return ElevatedButton(
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
        backgroundColor: Colors.black,
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
    );
  }
}
