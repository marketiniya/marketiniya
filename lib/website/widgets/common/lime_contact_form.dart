import 'package:flutter/material.dart';
import 'package:marketinya/core/config/service_locator.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/extensions/context_extension.dart';
import 'package:marketinya/core/repositories/contact_repository.dart';
import 'package:marketinya/core/utils/color_utils.dart';
import 'package:marketinya/core/utils/constants.dart';
import 'package:marketinya/website/models/contact_model.dart';

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
              width: Constants.kContentMaxWidth,
              decoration: BoxDecoration(
                color: ColorUtils.charcoal,
                borderRadius: BorderRadius.circular(md),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: lg, horizontal: 96),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTitle('Свържете се с нас за безплатна консултация', 36),
                      const SizedBox(height: md),
                      _buildTitle('Искате ли да знаете какво можем да направим за вас?\nПопълнете формата и нека се опознаем. Без обвързвания,\nбез досадни търговски предложения, и двамата сме\nтвърде заети за това.',
                        30,
                      ),
                      const SizedBox(height: lg),
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
        const SizedBox(height: xxsPlus),
        TextFormField(
          controller: controller,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            filled: true,
            fillColor: ColorUtils.lightGray,
            contentPadding: const EdgeInsets.symmetric(vertical: xxsPlus, horizontal: 20),
            labelText: placeholderText,
            labelStyle: const TextStyle(color: Colors.black),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(xs),
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
        const SizedBox(width: sm),
        Expanded(
          child: _buildFormField('Телефон за връзка', 'Телефон', _telephoneController),
        ),
      ],
    );
  }

  // Second row of input fields
  Widget _inputFieldsSecondRow() {
    return Padding(
      padding: const EdgeInsets.only(top: 28, bottom: lg),
      child: Row(
        children: [
          Expanded(
            child: _buildFormField('Име на фирма', 'Фирма', _firmNameController),
          ),
          const SizedBox(width: sm),
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
        const SizedBox(height: xxsPlus),
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
                borderRadius: BorderRadius.circular(xs),
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
      padding: const EdgeInsets.only(top: lg),
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
                    await getIt<ContactRepository>().sendQuestion(contactModel);
                    if (context.mounted) {
                      context.showSuccessSnackBar('Въпросът Ви е изпратен успешно.');
                    }
                  } catch (e) {
                    if (context.mounted) {
                      context.showFailureSnackBar('Възникна проблем с изпращането на въпроса');
                    }
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(xxsPlus),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(xs),
                child: Row(
                  children: [
                    Text(
                      'Изпрати',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: xxsPlus),
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
