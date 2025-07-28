import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/design_system/molecules/fields.dart';
import 'package:marketinya/core/design_system/themes/app_colors.dart';
import 'package:marketinya/core/utils/validators/field_validators.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/bloc/client_editor_bloc.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/bloc/client_editor_event.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/bloc/client_editor_state.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/enums/business_sector.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/enums/priority_level.dart';

class MiddleColumnForm extends StatelessWidget {
  const MiddleColumnForm({super.key, required this.state});

  final ClientEditorState state;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ClientEditorBloc>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: micro),
        CustomTextFormField(
          value: state.companyId,
          labelText: 'ЕИК',
          keyboardType: TextInputType.number,
          onSaved: (value) {
            if (value != null) {
              bloc.add(ClientEditorEvent.companyIdChanged(value));
            }
          },
          borderRadius: xs,
          borderColor: AppColors.oliveGreen,
        ),
        const SizedBox(height: xs),
        CustomTextFormField(
          value: state.personalId,
          labelText: 'ЕГН',
          keyboardType: TextInputType.number,
          onSaved: (value) {
            if (value != null) {
              bloc.add(ClientEditorEvent.personalIdChanged(value));
            }
          },
          borderRadius: xs,
          borderColor: AppColors.oliveGreen,
        ),
        const SizedBox(height: xs),
        CustomTextFormField(
          value: state.phone,
          labelText: 'Телефон',
          keyboardType: TextInputType.number,
          onSaved: (value) {
            if (value != null) {
              bloc.add(ClientEditorEvent.phoneChanged(value));
            }
          },
          validator: FieldValidators.combine([
            FieldValidators.notEmpty(),
            FieldValidators.phone(),
          ]),
          borderRadius: xs,
          borderColor: AppColors.oliveGreen,
        ),
        const SizedBox(height: xs),
        CustomTextFormField(
          value: state.dateOfBirth,
          labelText: 'Дата на раждане',
          keyboardType: TextInputType.datetime,
          onSaved: (value) {
            if (value != null) {
              bloc.add(ClientEditorEvent.dateOfBirthChanged(value));
            }
          },
          validator: FieldValidators.combine([
            FieldValidators.validDate(),
          ]),
          borderRadius: xs,
          borderColor: AppColors.oliveGreen,
        ),
        const SizedBox(height: xs),
        LayoutBuilder(
          builder: (context, constraints) {
            return CustomDropdownMenu<BusinessSector>(
              width: constraints.maxWidth,
              value: state.businessSector,
              items: BusinessSector.values,
              labelText: 'Сектор',
              labelBuilder: (sector) => sector.label,
              isFilled: false,
              borderRadius: xs,
              borderColor: AppColors.oliveGreen,
              onSelected: (value) {
                if (value != null) {
                  bloc.add(ClientEditorEvent.businessSectorChanged(value));
                }
              },
            );
          },
        ),
        const SizedBox(height: xs),
        LayoutBuilder(
          builder: (context, constraints) {
            return CustomDropdownMenu<PriorityLevel>(
              width: constraints.maxWidth,
              value: state.priorityLevel,
              items: PriorityLevel.values,
              isFilled: false,
              borderRadius: xs,
              borderColor: AppColors.oliveGreen,
              labelText: 'Приоритет',
              labelBuilder: (priority) => priority.label,
              onSelected: (value) {
                if (value != null) {
                  bloc.add(ClientEditorEvent.priorityLevelChanged(value));
                }
              },
            );
          },
        ),
      ],
    );
  }
}
