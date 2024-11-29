import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketinya/extensions/context_extension.dart';
import 'package:marketinya/models/contact_model.dart';
import 'package:marketinya/services/firestore_service.dart';
import 'package:marketinya/utils/color_utils.dart';

class LimeContactFormMobile extends StatefulWidget {
  const LimeContactFormMobile({super.key});

  @override
  State<LimeContactFormMobile> createState() => _LimeContactFormMobileState();
}

class _LimeContactFormMobileState extends State<LimeContactFormMobile> {
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
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          _buildTitle('Свържете се с нас за\nбезплатна консултация', 26),
          _buildTitle(
            'Искате ли да знаете какво\nможем да направим за вас?\nПопълнете формата и нека се\nопознаем. Без обвързвания, без\nдосадни търговски\nпредложения, и двамата сме\nтвърде заети за това.',
            20,
          ),
          _buildFormField('Име и фамилия', 'Име, Фамилия', _nameController),
          _buildFormField('Телефон за връзка', 'Телефон', _telephoneController),
          _buildFormField('Име на фирма', 'Фирма', _firmNameController),
          _buildFormField('Имейл адрес', 'Имейл', _emailController),
          _bigInputField(),
          _sendButton(context)
        ],
      ),
    );
  }

  Widget _buildFormField(String labelText, String placeholderText,
      TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
          TextFormField(
            controller: controller,
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
              filled: true,
              fillColor: ColorUtils.lightGray,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
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
      ),
    );
  }

  Widget _bigInputField() {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Задай въпрос',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 110,
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
      ),
    );
  }

  Widget _sendButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32, left: 12, right: 12, bottom: 40),
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
              context.showFailureSnackBar(
                  'Възникна проблем с изпращането на въпроса');
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Изпрати',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: 12),
              Icon(Icons.arrow_forward),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(String text, double fontSize) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      child: Text(
        text,
        style: GoogleFonts.roboto(
          color: ColorUtils.lightGray,
          textStyle: TextStyle(
            fontSize: fontSize,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
