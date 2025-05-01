import 'package:flutter/material.dart';
import 'package:marketinya/core/design_system/atoms/dimensions.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/design_system/molecules/fields.dart';
import 'package:marketinya/core/utils/validators/field_validators.dart';
import 'package:marketinya/system/screens/clients/widgets/add_client_screen/widget/tags_section.dart';
import 'package:marketinya/core/enums/client_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/add_client_bloc.dart';
import '../bloc/add_client_event.dart';

class ContentForm extends StatelessWidget {
  const ContentForm({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;
  static const double _inputWidth = 360.0;
  static const Color _inputColor = Color(0xFFD9D9C6);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AddClientBloc>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBasicInfoSection(context, bloc),
            const SizedBox(width: lg),
            const TagsSection(),
          ],
        ),
        Padding(
          padding: dimen.top.xs,
          child: SizedBox(
            width: _inputWidth * nano + lg,
            child: CustomTextFormField(
              padding: dimen.top.xxs,
              labelText: 'Описание',
              keyboardType: TextInputType.multiline,
              onSaved: (value) {
                if (value != null) {
                  bloc.add(AddClientEvent.descriptionChanged(value));
                }
              },
              validator: FieldValidators.combine([
                FieldValidators.notEmpty(),
              ]),
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              filledColor: _inputColor,
              borderRadius: lg,
              maxLines: 5,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildBasicInfoSection(BuildContext context, AddClientBloc bloc) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: _inputWidth,
          child: CustomTextFormField(
            labelText: 'Име / Фирма',
            keyboardType: TextInputType.name,
            onSaved: (value) {
              if (value != null) {
                bloc.add(AddClientEvent.companyNameChanged(value));
              }
            },
            validator: FieldValidators.combine([
              FieldValidators.notEmpty(),
            ]),
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            filledColor: _inputColor,
            borderRadius: lg,
          ),
        ),
        // ID Field
        SizedBox(
          width: _inputWidth,
          child: CustomTextFormField(
            padding: dimen.top.micro,
            labelText: 'ЕГН / ЕИК',
            keyboardType: TextInputType.number,
            onSaved: (value) {
              if (value != null) {
                bloc.add(AddClientEvent.personalOrCompanyIdChanged(value));
              }
            },
            validator: FieldValidators.combine([
              FieldValidators.notEmpty(),
            ]),
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            filledColor: _inputColor,
            borderRadius: lg,
          ),
        ),
        // Phone Field
        SizedBox(
          width: _inputWidth,
          child: CustomTextFormField(
            padding: dimen.top.micro,
            labelText: 'Телефон',
            keyboardType: TextInputType.number,
            onSaved: (value) {
              if (value != null) {
                bloc.add(AddClientEvent.phoneChanged(value));
              }
            },
            validator: FieldValidators.combine([
              FieldValidators.notEmpty(),
              FieldValidators.phone(),
            ]),
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            filledColor: _inputColor,
            borderRadius: lg,
          ),
        ),
        // Birth Date Field
        SizedBox(
          width: _inputWidth,
          child: CustomTextFormField(
            padding: dimen.top.micro,
            labelText: 'Дата на раждане',
            keyboardType: TextInputType.datetime,
            onSaved: (value) {
              if (value != null) {
                bloc.add(AddClientEvent.dateOfBirthChanged(value));
              }
            },
            validator: FieldValidators.combine([
              FieldValidators.notEmpty(),
              FieldValidators.validDate(),
            ]),
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            filledColor: _inputColor,
            borderRadius: lg,
          ),
        ),
        // Industry Field
        SizedBox(
          width: _inputWidth,
          child: CustomTextFormField(
            padding: dimen.top.micro,
            labelText: 'Сектор',
            keyboardType: TextInputType.text,
            onSaved: (value) {
              if (value != null) {
                bloc.add(AddClientEvent.industryChanged(value));
              }
            },
            validator: FieldValidators.combine([
              FieldValidators.notEmpty(),
            ]),
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            filledColor: _inputColor,
            borderRadius: lg,
            suffixIcon: Icons.arrow_drop_down,
          ),
        ),
        // Status Field
        SizedBox(
          width: _inputWidth,
          child: CustomDropdownFormField<ClientStatus>(
            padding: EdgeInsets.zero,
            labelText: 'Статус',
            items: ClientStatus.values,
            dropdownValues: (status) => status.label,
            onSaved: (value) {
              if (value != null) {
                bloc.add(AddClientEvent.clientStatusChanged(value));
              }
            },
            borderRadius: lg,
            isExpanded: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: _inputColor,
              labelText: 'Статус',
              labelStyle: const TextStyle(color: Colors.black),
              floatingLabelBehavior: FloatingLabelBehavior.auto,
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
                horizontal: sm,
                vertical: xs + nano,
              ),
            ),
            dropdownItemBuilder: (status) => Text(
              status.label,
              style: TextStyle(
                color:
                    status == ClientStatus.active ? Colors.green : Colors.red,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
