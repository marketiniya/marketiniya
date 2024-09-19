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
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;

    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Form(
        key: _formKey,
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 16,
          runSpacing: 16,
          children: [
            _buildHeaderText(isSmallScreen),
            const SizedBox(width: 48),
            _buildEmailField(),
            const SizedBox(width: 24),
            _buildSubscribeButton(context),
          ],
        ),
      ),
    );
  }

  Text _buildHeaderText(bool isSmallScreen) {
    return Text(
      'Бъдете в крак с новостите за\nдостигане на нови клиенти.',
      style: TextStyle(
        color: Colors.black,
        fontSize: isSmallScreen ? 20 : 26,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  SizedBox _buildEmailField() {
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
