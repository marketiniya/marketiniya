import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketinya/core/design_system/atoms/icons/file_type_icons.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/design_system/molecules/dialogs.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/client_attachments_tab/bloc/file_upload_bloc.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/client_attachments_tab/bloc/file_upload_event.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/client_attachments_tab/models/uploaded_file.dart';

class FileItem extends StatelessWidget {
  const FileItem({
    super.key,
    required this.file,
  });

  final UploadedFile file;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Column(
        children: [
          Stack(
            children: [
              FileIconButton(
                file: file,
                onPressed: () => _openFile(context),
              ),
              Positioned(
                top: none,
                right: none,
                child: IconButton(
                  onPressed: () => _deleteConfirmationDialog(context),
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: xxsPlus,
                  ),
                  tooltip: 'Delete',
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.red,
                    minimumSize: const Size(xs, xs),
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _deleteConfirmationDialog(BuildContext context) {
    final bloc = context.read<FileUploadBloc>();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomAlertDialog.deleteConfirmation(
          content: Text(
            file.name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black54,
              fontStyle: FontStyle.italic,
            ),
            maxLines: 3,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
          ),
          onConfirm: () {
            Navigator.of(context).pop();
            bloc.add(
              FileUploadEvent.fileRemoved(
                fileType: file.fileType,
                fileId: file.id,
              ),
            );
          },
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void _openFile(BuildContext context) {
    final bloc = context.read<FileUploadBloc>();

    if (file.downloadUrl != null) {
      bloc.add(
        FileUploadEvent.fileOpen(
          fileId: file.id,
          fileName: file.name,
          downloadUrl: file.downloadUrl!,
        ),
      );
    }
  }
}

class FileIconButton extends StatefulWidget {
  const FileIconButton({
    super.key,
    required this.file,
    required this.onPressed,
  });

  final UploadedFile file;
  final VoidCallback onPressed;

  @override
  State<FileIconButton> createState() => _FileIconButtonState();
}

class _FileIconButtonState extends State<FileIconButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final icon = FileTypeIcons.getIcon(widget.file.fileExtension, size: md);
    final decoratedIcon = _isHovered
        ? ColorFiltered(
            colorFilter: const ColorFilter.mode(
              Colors.black26,
              BlendMode.srcATop,
            ),
            child: icon,
          )
        : icon;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: IconButton(
        onPressed: widget.onPressed,
        icon: ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 100),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              decoratedIcon,
              const SizedBox(height: xs),
              Text(
                widget.file.name,
                style: const TextStyle(
                  fontSize: xxsPlus,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                widget.file.formattedSize,
                style: const TextStyle(
                  fontSize: xxs,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        tooltip: 'Open',
        style: IconButton.styleFrom(
          backgroundColor: Colors.transparent,
          overlayColor: Colors.transparent,
          padding: EdgeInsets.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
      ),
    );
  }
}
