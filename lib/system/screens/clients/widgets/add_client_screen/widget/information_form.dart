import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketinya/core/design_system/atoms/dimensions.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/design_system/molecules/fields.dart';
import 'package:marketinya/core/design_system/themes/app_colors.dart';
import 'package:marketinya/core/enums/business_sector.dart';
import 'package:marketinya/core/enums/client_status.dart';
import 'package:marketinya/core/utils/validators/field_validators.dart';
import 'package:marketinya/system/screens/clients/widgets/add_client_screen/bloc/add_client_bloc.dart';
import 'package:marketinya/system/screens/clients/widgets/add_client_screen/bloc/add_client_event.dart';
import 'package:marketinya/system/screens/clients/widgets/add_client_screen/bloc/add_client_state.dart';

class InformationForm extends StatelessWidget {
  const InformationForm({super.key, required this.state});

  final AddClientState state;
  static const double _inputWidth = 360.0;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AddClientBloc>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: _inputWidth,
          child: CustomTextFormField(
            controller: TextEditingController(text: state.companyName),
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
            contentPadding: dimen.horizontal.sm,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            filledColor: AppColors.lightOlive,
            borderRadius: lg,
          ),
        ),
        SizedBox(
          width: _inputWidth,
          child: CustomTextFormField(
            controller: TextEditingController(text: state.companyId),
            labelText: 'ЕИК',
            keyboardType: TextInputType.number,
            onSaved: (value) {
              if (value != null) {
                bloc.add(AddClientEvent.companyIdChanged(value));
              }
            },
            validator: FieldValidators.combine([
              FieldValidators.notEmpty(),
            ]),
            contentPadding: dimen.horizontal.sm,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            filledColor: AppColors.lightOlive,
            borderRadius: lg,
          ),
        ),
        SizedBox(
          width: _inputWidth,
          child: CustomTextFormField(
            controller: TextEditingController(text: state.personalId),
            labelText: 'ЕГН',
            keyboardType: TextInputType.number,
            onSaved: (value) {
              if (value != null) {
                bloc.add(AddClientEvent.personalIdChanged(value));
              }
            },
            validator: FieldValidators.combine([
              FieldValidators.notEmpty(),
            ]),
            contentPadding: dimen.horizontal.sm,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            filledColor: AppColors.lightOlive,
            borderRadius: lg,
          ),
        ),
        SizedBox(
          width: _inputWidth,
          child: CustomTextFormField(
            controller: TextEditingController(text: state.phone),
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
            contentPadding: dimen.horizontal.sm,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            filledColor: AppColors.lightOlive,
            borderRadius: lg,
          ),
        ),
        SizedBox(
          width: _inputWidth,
          child: CustomTextFormField(
            controller: TextEditingController(text: state.dateOfBirth),
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
            contentPadding: dimen.horizontal.sm,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            filledColor: AppColors.lightOlive,
            borderRadius: lg,
          ),
        ),
        SizedBox(
          width: _inputWidth,
          child: CustomDropdownFormField<BusinessSector>(
            value: state.businessSector,
            items: BusinessSector.values,
            dropdownValues: (businessSector) => businessSector.label,
            onSaved: (value) {
              if (value != null) {
                bloc.add(AddClientEvent.businessSectorChanged(value));
              }
            },
            borderRadius: lg,
            decoration: InputDecoration(
              contentPadding: dimen.horizontal.sm,
              filled: true,
              fillColor: AppColors.lightOlive,
              labelText: 'Сектор',
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
            ),
            dropdownItemBuilder: (status) => Text(status.label),
          ),
        ),
        SizedBox(
          width: _inputWidth,
          child: CustomDropdownFormField<ClientStatus>(
            value: state.clientStatus,
            padding: dimen.top.sm,
            items: ClientStatus.values,
            dropdownValues: (status) => status.label,
            onSaved: (value) {
              if (value != null) {
                bloc.add(AddClientEvent.clientStatusChanged(value));
              }
            },
            borderRadius: lg,
            decoration: InputDecoration(
              contentPadding: dimen.horizontal.sm,
              filled: true,
              fillColor: AppColors.lightOlive,
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
            ),
            dropdownItemBuilder: (status) => Text(status.label),
          ),
        ),
      ],
    );
  }
}
