import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketinya/core/design_system/atoms/dimensions.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/design_system/molecules/fields.dart';
import 'package:marketinya/core/design_system/themes/app_colors.dart';
import 'package:marketinya/core/utils/validators/field_validators.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/bloc/client_editor_bloc.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/bloc/client_editor_event.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/bloc/client_editor_state.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/enums/client_status.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/enums/department.dart';

class LeftColumnForm extends StatelessWidget {
  const LeftColumnForm({super.key, required this.state});

  final ClientEditorState state;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ClientEditorBloc>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: micro),
        CustomTextFormField(
          padding: EdgeInsets.zero,
          value: state.companyName,
          labelText: 'Компания',
          keyboardType: TextInputType.name,
          onSaved: (value) {
            if (value != null) {
              bloc.add(ClientEditorEvent.companyNameChanged(value));
            }
          },
          validator: FieldValidators.combine([
            FieldValidators.notEmpty(),
          ]),
          borderRadius: xs,
          borderColor: AppColors.oliveGreen,
        ),
        const SizedBox(height: xs),
        CustomTextFormField(
          value: state.name,
          labelText: 'Име',
          keyboardType: TextInputType.name,
          onSaved: (value) {
            if (value != null) {
              bloc.add(ClientEditorEvent.nameChanged(value));
            }
          },
          borderRadius: xs,
          borderColor: AppColors.oliveGreen,
        ),
        const SizedBox(height: xs),
        CustomTextFormField(
          value: state.email,
          labelText: 'Имейл',
          keyboardType: TextInputType.emailAddress,
          onSaved: (value) {
            if (value != null) {
              bloc.add(ClientEditorEvent.emailChanged(value));
            }
          },
          validator: FieldValidators.combine([
            FieldValidators.notEmpty(),
            FieldValidators.email(),
          ]),
          borderRadius: xs,
          borderColor: AppColors.oliveGreen,
        ),
        const SizedBox(height: xs),
        Container(
          height: 50,
          padding: dimen.horizontal.xs,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.oliveGreen, width: 1),
            borderRadius: BorderRadius.circular(xs),
            color: Colors.transparent,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Text(
                    'Прозвънен:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: xs,
                    ),
                  ),
                  const SizedBox(width: xxs),
                  Text(
                    state.hasBeenCalled ? 'Да' : 'Не',
                    style: TextStyle(
                      color: state.hasBeenCalled ? Colors.green : Colors.red,
                      fontSize: xs,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Switch(
                value: state.hasBeenCalled,
                onChanged: (value) {
                  bloc.add(ClientEditorEvent.hasBeenCalledChanged(value));
                },
                activeColor: AppColors.oliveGreen,
                inactiveTrackColor: Colors.grey.withValues(alpha: 0.3),
                inactiveThumbColor: Colors.white,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ],
          ),
        ),
        const SizedBox(height: xs),
        LayoutBuilder(
          builder: (context, constraints) {
            return CustomDropdownMenu<Department>(
              width: constraints.maxWidth,
              value: state.department,
              items: Department.values,
              labelText: 'Отдел',
              labelBuilder: (department) => department.label,
              isFilled: false,
              borderRadius: xs,
              borderColor: AppColors.oliveGreen,
              onSelected: (value) {
                if (value != null) {
                  bloc.add(ClientEditorEvent.departmentChanged(value));
                }
              },
            );
          },
        ),
        const SizedBox(height: xs),
        LayoutBuilder(
          builder: (context, constraints) {
            return CustomDropdownMenu<ClientStatus>(
              width: constraints.maxWidth,
              value: state.clientStatus,
              items: ClientStatus.values,
              isFilled: false,
              labelText: 'Статус',
              labelBuilder: (status) => status.label,
              borderRadius: xs,
              borderColor: AppColors.oliveGreen,
              onSelected: (value) {
                if (value != null) {
                  bloc.add(ClientEditorEvent.clientStatusChanged(value));
                }
              },
            );
          },
        ),
      ],
    );
  }
}
