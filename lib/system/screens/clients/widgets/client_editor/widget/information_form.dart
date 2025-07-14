import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketinya/core/design_system/atoms/dimensions.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/design_system/molecules/fields.dart';
import 'package:marketinya/core/design_system/themes/app_colors.dart';
import 'package:marketinya/core/utils/validators/field_validators.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/bloc/add_client_bloc.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/bloc/add_client_event.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/bloc/add_client_state.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/enums/business_sector.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/enums/client_status.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/enums/priority_level.dart';

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
        const SizedBox(height: micro),
        SizedBox(
          width: _inputWidth,
          child: CustomTextFormField(
            padding: EdgeInsets.zero,
            value: state.companyName,
            labelText: 'Фирма',
            keyboardType: TextInputType.name,
            onSaved: (value) {
              if (value != null) {
                bloc.add(AddClientEvent.companyNameChanged(value));
              }
            },
            validator: FieldValidators.combine([
              FieldValidators.notEmpty(),
            ]),
            borderRadius: xs,
            borderColor: AppColors.oliveGreen,
          ),
        ),
        const SizedBox(height: xs),
        SizedBox(
          width: _inputWidth,
          child: CustomTextFormField(
            value: state.companyId,
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
            borderRadius: xs,
            borderColor: AppColors.oliveGreen,
          ),
        ),
        const SizedBox(height: xs),
        SizedBox(
          width: _inputWidth,
          child: CustomTextFormField(
            value: state.name,
            labelText: 'Име',
            keyboardType: TextInputType.name,
            onSaved: (value) {
              if (value != null) {
                bloc.add(AddClientEvent.nameChanged(value));
              }
            },
            validator: FieldValidators.combine([
              FieldValidators.notEmpty(),
            ]),
            borderRadius: xs,
            borderColor: AppColors.oliveGreen,
          ),
        ),
        const SizedBox(height: xs),
        SizedBox(
          width: _inputWidth,
          child: CustomTextFormField(
            value: state.personalId,
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
            borderRadius: xs,
            borderColor: AppColors.oliveGreen,
          ),
        ),
        const SizedBox(height: xs),
        SizedBox(
          width: _inputWidth,
          child: CustomTextFormField(
            value: state.phone,
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
            borderRadius: xs,
            borderColor: AppColors.oliveGreen,
          ),
        ),
        const SizedBox(height: xs),
        SizedBox(
          width: _inputWidth,
          child: CustomTextFormField(
            value: state.dateOfBirth,
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
            borderRadius: xs,
            borderColor: AppColors.oliveGreen,
          ),
        ),
        const SizedBox(height: xs),
        SizedBox(
          width: _inputWidth,
          child: CustomDropdownMenu<BusinessSector>(
            width: _inputWidth,
            value: state.businessSector,
            items: BusinessSector.values,
            labelText: 'Сектор',
            labelBuilder: (sector) => sector.label,
            isFilled: false,
            borderRadius: xs,
            borderColor: AppColors.oliveGreen,
            onSelected: (value) {
              if (value != null) {
                bloc.add(AddClientEvent.businessSectorChanged(value));
              }
            },
          ),
        ),
        const SizedBox(height: xs),
        SizedBox(
          width: _inputWidth,
          child: CustomDropdownMenu<ClientStatus>(
            width: _inputWidth,
            value: state.clientStatus,
            items: ClientStatus.values,
            isFilled: false,
            labelText: 'Статус',
            labelBuilder: (status) => status.label,
            borderRadius: xs,
            borderColor: AppColors.oliveGreen,
            onSelected: (value) {
              if (value != null) {
                bloc.add(AddClientEvent.clientStatusChanged(value));
              }
            },
          ),
        ),
        const SizedBox(height: xs),
        SizedBox(
          width: _inputWidth,
          child: CustomDropdownMenu<PriorityLevel>(
            width: _inputWidth,
            value: state.priorityLevel,
            items: PriorityLevel.values,
            isFilled: false,
            borderRadius: xs,
            borderColor: AppColors.oliveGreen,
            labelText: 'Приоритет',
            labelBuilder: (priority) => priority.label,
            onSelected: (value) {
              if (value != null) {
                bloc.add(AddClientEvent.priorityLevelChanged(value));
              }
            },
          ),
        ),
      ],
    );
  }
}
