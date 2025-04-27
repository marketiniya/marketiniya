import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/design_system/molecules/fields.dart';
import 'package:marketinya/core/design_system/molecules/button/primary_button/primary_button.dart';
import 'package:marketinya/core/design_system/themes/app_colors.dart';
import 'package:marketinya/core/models/tags.dart';
import 'package:marketinya/core/utils/validators/field_validators.dart';
import 'package:marketinya/system/screens/clients/widgets/clients_drawer.dart';
import 'package:marketinya/system/screens/clients/widgets/tags_widget.dart';
import 'package:marketinya/core/enums/client_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/add_client_bloc.dart';
import 'bloc/add_client_event.dart';

class AddClientScreen extends StatelessWidget {
  const AddClientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddClientBloc(),
      child: const _AddClientScreenContent(),
    );
  }
}

class _AddClientScreenContent extends StatefulWidget {
  const _AddClientScreenContent();

  @override
  State<_AddClientScreenContent> createState() => _AddClientScreenState();
}

class _AddClientScreenState extends State<_AddClientScreenContent> {
  static const double _buttonWidth = 120.0;
  static const double _inputWidth = 360.0;
  static const Color _inputColor = Color(0xFFD9D9C6);
  final _formKey = GlobalKey<FormState>();

  // Example tags list - this should come from your database
  static const List<Tag> _tags = [
    Tag(id: '1', label: 'Важен клиент', color: Color(0xFFE57373)),
    Tag(id: '2', label: 'ВИП', color: Color(0xFF81C784)),
    Tag(id: '3', label: 'Нов', color: Color(0xFF64B5F6)),
    Tag(id: '4', label: 'Потенциален', color: Color(0xFFFFB74D)),
    Tag(id: '5', label: 'Tag 5', color: Color(0xFFBA68C8)),
    Tag(id: '6', label: 'Tag 6', color: Color(0xFF4DB6AC)),
    Tag(id: '7', label: 'Tag 7', color: Color(0xFFFFB74D)),
    Tag(id: '8', label: 'Tag 8', color: Color(0xFF90A4AE)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ClientsDrawer(),
          Flexible(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(180, xl, 180, lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: xl),
                    _buildHeader(context),
                    const SizedBox(height: lg),
                    _buildForm(context),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
              width: _buttonWidth,
              child: PrimaryButton.responsive(
                icon: const Icon(Icons.check),
                title: 'Добави',
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState?.save();
                    context
                        .read<AddClientBloc>()
                        .add(const AddClientEvent.save());
                  }
                },
                backgroundColor: const Color(0xFF708445),
                activeTitleColor: Colors.white,
              ),
            ),
            const SizedBox(width: md),
            SizedBox(
              width: _buttonWidth,
              child: PrimaryButton.responsive(
                icon: const Icon(Icons.close),
                title: 'Отказ',
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: lg),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Профил на клиента',
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(
              width: 240,
              child: Divider(thickness: nano, color: Colors.black),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: _inputWidth,
                    child: CustomTextFormField(
                      labelText: 'Име / Фирма',
                      keyboardType: TextInputType.name,
                      onSaved: (value) {
                        if (value != null) {
                          context
                              .read<AddClientBloc>()
                              .add(AddClientEvent.companyNameChanged(value));
                        }
                      },
                      validator: FieldValidators.combine([
                        FieldValidators.notEmpty(),
                      ]),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      filledColor: _inputColor,
                      borderRadius: lg,
                    ),
                  ),
                  SizedBox(
                    width: _inputWidth,
                    child: CustomTextFormField(
                      labelText: 'ЕГН / ЕИК',
                      keyboardType: TextInputType.number,
                      onSaved: (value) {
                        if (value != null) {
                          context.read<AddClientBloc>().add(
                              AddClientEvent.personalOrCompanyIdChanged(value));
                        }
                      },
                      validator: FieldValidators.combine([
                        FieldValidators.notEmpty(),
                      ]),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      filledColor: _inputColor,
                      borderRadius: lg,
                    ),
                  ),
                  SizedBox(
                    width: _inputWidth,
                    child: CustomTextFormField(
                      labelText: 'Телефон',
                      keyboardType: TextInputType.number,
                      onSaved: (value) {
                        if (value != null) {
                          context.read<AddClientBloc>().add(AddClientEvent.phoneChanged(value));
                        }
                      },
                      validator: FieldValidators.combine([
                        FieldValidators.notEmpty(),
                        FieldValidators.phone(),
                      ]),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      filledColor: _inputColor,
                      borderRadius: lg,
                    ),
                  ),
                  SizedBox(
                    width: _inputWidth,
                    child: CustomTextFormField(
                      labelText: 'Дата на раждане',
                      keyboardType: TextInputType.number,
                      onSaved: (value) {
                        if (value != null) {
                          context.read<AddClientBloc>().add(AddClientEvent.phoneChanged(value));
                        }
                      },
                      validator: FieldValidators.combine([
                        FieldValidators.notEmpty(),
                        FieldValidators.phone(),
                      ]),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      filledColor: _inputColor,
                      borderRadius: lg,
                    ),
                  ),
                  SizedBox(
                    width: _inputWidth,
                    child: CustomTextFormField(
                      labelText: 'Сектор',
                      keyboardType: TextInputType.text,
                      onSaved: (value) {
                        if (value != null) {
                          context
                              .read<AddClientBloc>()
                              .add(AddClientEvent.industryChanged(value));
                        }
                      },
                      validator: FieldValidators.combine([
                        FieldValidators.notEmpty(),
                      ]),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      filledColor: _inputColor,
                      borderRadius: lg,
                      suffixIcon: Icons.arrow_drop_down,
                    ),
                  ),
                  SizedBox(
                    width: _inputWidth,
                    child: CustomDropdownFormField<ClientStatus>(
                      labelText: 'Статус',
                      items: ClientStatus.values,
                      dropdownValues: (status) => status.label,
                      value: ClientStatus.active,
                      onSaved: (value) {
                        if (value != null) {
                          context
                              .read<AddClientBloc>()
                              .add(AddClientEvent.clientStatusChanged(value));
                        }
                      },
                      padding: EdgeInsets.zero,
                      borderRadius: lg,
                      isExpanded: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: _inputColor,
                        labelText: 'Статус',
                        labelStyle: const TextStyle(color: Colors.black),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(lg),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(lg),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(lg),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: sm, vertical: xs + nano),
                      ),
                      dropdownItemBuilder: (status) => Text(
                        status.label,
                        style: TextStyle(
                          color: status == ClientStatus.active
                              ? Colors.green
                              : Colors.red,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: lg),
              TagsWidget(
                tags: _tags,
                onAddTag: () {
                  // TODO: Implement add tag logic
                },
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: xs),
              SizedBox(
                width: _inputWidth * 2 + lg,
                child: CustomTextFormField(
                  labelText: 'Описание',
                  keyboardType: TextInputType.multiline,
                  onSaved: (value) {
                    if (value != null) {
                      context
                          .read<AddClientBloc>()
                          .add(AddClientEvent.descriptionChanged(value));
                    }
                  },
                  validator: FieldValidators.combine([
                    FieldValidators.notEmpty(),
                  ]),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  filledColor: _inputColor,
                  borderRadius: lg,
                  maxLines: 5,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
