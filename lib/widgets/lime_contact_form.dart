import 'package:flutter/material.dart';
import 'package:marketinya/extensions/context_extension.dart';
import 'package:marketinya/models/contact_model.dart';
import '../services/firestore_service.dart';
import '../utils/color_utils.dart';

class LimeContactForm extends StatefulWidget {
  const LimeContactForm({super.key, this.hasLimeBackground = true});

  final bool hasLimeBackground;

  @override
  State<LimeContactForm> createState() => _LimeContactFormState();
}

class _LimeContactFormState extends State<LimeContactForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _telephoneController = TextEditingController();
  final TextEditingController _firmNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _questionController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _telephoneController.dispose();
    _firmNameController.dispose();
    _emailController.dispose();
    _questionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 1100,
          color: widget.hasLimeBackground ? ColorUtils.limeGreen : null,
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 72),
            child: Container(
              width: 1000,
              decoration: BoxDecoration(
                color: ColorUtils.charcoal,
                borderRadius: BorderRadius.circular(32),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 96),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTitle('Свържете се с нас за безплатна консултация', 36),
                      const SizedBox(height: 32),
                      _buildTitle('Искате ли да знаете какво можем да направим за вас?\nПопълнете формата и нека се опознаем. Без обвързвания,\nбез досадни търговски предложения, и двамата сме\nтвърде заети за това.',
                        30,
                      ),
                      const SizedBox(height: 40),
                      _inputFieldsFirstRow(),
                      _inputFieldsSecondRow(),
                      _bigInputField(),
                      _sendButton(context),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTitle(String text, double fontSize) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget _buildFormField(String labelText, String placeholderText, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 12),
        TextFormField(
          controller: controller,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            filled: true,
            fillColor: ColorUtils.lightGray,
            contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            labelText: placeholderText,
            labelStyle: const TextStyle(color: Colors.black),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.never,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Полето е задължително';
            }
            return null;
          },
        ),
      ],
    );
  }

  // First row of input fields
  Widget _inputFieldsFirstRow() {
    return Row(
      children: [
        Expanded(
          child: _buildFormField('Име и фамилия', 'Име, Фамилия', _nameController),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: _buildFormField('Телефон за връзка', 'Телефон', _telephoneController),
        ),
      ],
    );
  }

  // Second row of input fields
  Widget _inputFieldsSecondRow() {
    return Padding(
      padding: const EdgeInsets.only(top: 28, bottom: 40),
      child: Row(
        children: [
          Expanded(
            child: _buildFormField('Име на фирма', 'Фирма', _firmNameController),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: _buildFormField('Имейл адрес', 'Имейл', _emailController),
          ),
        ],
      ),
    );
  }

  // Large input field for questions
  Widget _bigInputField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Задай въпрос',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 155,
          child: TextFormField(
            controller: _questionController,
            expands: true,
            maxLines: null,
            minLines: null,
            style: const TextStyle(color: Colors.black),
            textAlignVertical: TextAlignVertical.top,
            decoration: InputDecoration(
              filled: true,
              fillColor: ColorUtils.lightGray,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              floatingLabelBehavior: FloatingLabelBehavior.never,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Полето е задължително';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  // Button for submitting the form
  Widget _sendButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Row(
        children: [
          const Spacer(),
          SizedBox(
            width: 196,
            child: ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  final contactModel = ContactModel(
                    _nameController.text,
                    _telephoneController.text,
                    _firmNameController.text,
                    _emailController.text,
                    _questionController.text,
                    DateTime.now().toString(),
                  );

                  try {
                    await FirestoreService.instance.sendQuestion(contactModel);
                    context.showSuccessSnackBar('Въпросът Ви е изпратен успешно.');
                  } catch (e) {
                    context.showFailureSnackBar('Възникна проблем с изпращането на въпроса');
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Text(
                      'Изпрати',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 12),
                    Icon(Icons.arrow_forward),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
