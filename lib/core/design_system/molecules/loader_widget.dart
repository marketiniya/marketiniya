import 'package:flutter/material.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({
    super.key,
    this.loaderColor,
  })  : loadingTitle = '',
        textColor = null,
        onlyText = false,
        _useSmallLoader = false;

  const LoaderWidget.small({
    super.key,
    this.loaderColor,
  })  : loadingTitle = '',
        textColor = null,
        onlyText = false,
        _useSmallLoader = true;

  const LoaderWidget.text({
    super.key,
    required this.loadingTitle,
    this.textColor,
    this.loaderColor,
    this.onlyText = false,
  }) : _useSmallLoader = false;

  final String loadingTitle;
  final Color? textColor;
  final Color? loaderColor;
  final bool onlyText;
  final bool _useSmallLoader;

  @override
  Widget build(BuildContext context) {
    return onlyText
        ? Text(
            loadingTitle,
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: _loaderSize,
                width: _loaderSize,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(
                    loaderColor,
                  ),
                  backgroundColor: Colors.transparent,
                  strokeWidth: 2,
                ),
              ),
              if (loadingTitle.isNotEmpty) ...[
                const SizedBox(width: xxs),
                Text(
                  loadingTitle,
                ),
              ],
            ],
          );
  }

  double get _loaderSize => _useSmallLoader ? 14.7 : 22;
}
