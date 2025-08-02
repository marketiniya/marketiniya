import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/design_system/molecules/button/primary_button/primary_button.dart';
import 'package:marketinya/core/design_system/molecules/dialogs.dart';
import 'package:marketinya/core/design_system/themes/app_colors.dart';
import 'package:marketinya/core/enums/status.dart';
import 'package:marketinya/core/extensions/context_extension.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/bloc/client_editor_bloc.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/bloc/client_editor_event.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/bloc/client_editor_state.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  static const double _buttonWidth = 120.0;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ClientEditorBloc, ClientEditorState>(
      listener: (context, state) {
        if (state.status == Status.error) {
          context.showFailureSnackBar(state.errorMessage ?? 'An error occurred');
          return;
        }
        if (state.status == Status.success) {
          final message = state.isUpdateMode
              ? 'Client updated successfully'
              : 'Client created successfully';

          context.showSuccessSnackBar(message);
          Navigator.of(context).pop();
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              BlocBuilder<ClientEditorBloc, ClientEditorState>(
                builder: (context, state) {
                  final bloc = context.read<ClientEditorBloc>();
                  return SizedBox(
                    width: _buttonWidth,
                    child: PrimaryButton.responsive(
                      isLoading: state.status == Status.loading,
                      icon: const Icon(Icons.check),
                      title: state.isUpdateMode ? 'Запази' : 'Добави',
                      onPressed: () {
                        if (formKey.currentState?.validate() ?? false) {
                          formKey.currentState?.save();
                          bloc.add(
                            state.isUpdateMode
                                ? const ClientEditorEvent.update()
                                : const ClientEditorEvent.save(),
                          );
                        }
                      },
                      backgroundColor: AppColors.oliveGreen,
                      activeTitleColor: Colors.white,
                    ),
                  );
                },
              ),
              const SizedBox(width: md),
              SizedBox(
                width: _buttonWidth,
                child: PrimaryButton.responsive(
                  icon: const Icon(Icons.close),
                  title: 'Отказ',
                  borderColor: AppColors.oliveGreen,
                  onPressed: () => context.pop(),
                ),
              ),
              const Spacer(),
              SizedBox(
                child: PrimaryButton.responsive(
                  icon: const Icon(Icons.delete),
                  title: 'Изтрий профил',
                  activeTitleColor: Colors.red,
                  borderColor: Colors.red,
                  overlayButtonColor: Colors.red.withValues(alpha: 200),
                  onPressed: () => _deleteConfirmationDialog(context),
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
                width: imageWidth + lg,
                child: Divider(thickness: nano, color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _deleteConfirmationDialog(BuildContext context) {
    final bloc = context.read<ClientEditorBloc>();
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent closing dialog by clicking outside
      builder: (BuildContext dialogContext) {
        return BlocProvider.value(
          value: bloc, // Provide the existing bloc to the dialog
          child: BlocConsumer<ClientEditorBloc, ClientEditorState>(
            listener: (context, state) {
              if (state.status == Status.success &&
                  state.shouldRedirectToHome) {
                Navigator.of(dialogContext).pop();
              }
              if (state.status == Status.error) {
                Navigator.of(dialogContext).pop();
                context.showFailureSnackBar(
                  state.errorMessage ?? 'Failed to delete client',
                );
              }
            },
            builder: (context, state) {
              final isLoading = state.status == Status.loading;

              return CustomAlertDialog.deleteConfirmation(
                onConfirm: isLoading
                    ? null
                    : () => bloc.add(const ClientEditorEvent.delete()),
                onCancel:
                    isLoading ? null : () => Navigator.of(dialogContext).pop(),
                isLoading: isLoading,
              );
            },
          ),
        );
      },
    );
  }
}
