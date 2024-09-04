import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'custom_loading_icon_widget.dart';

class CustomBtn extends StatefulWidget {
  const CustomBtn({
    super.key,
    this.inProgress = false,
    this.onPressed,
    required this.txt,
    this.style,
    this.textStyle,
  });

  final bool inProgress;
  final VoidCallback? onPressed;
  final String txt;
  final ButtonStyle? style;
  final TextStyle? textStyle;

  @override
  State<CustomBtn> createState() => _CustomBtnState();
}

class _CustomBtnState extends State<CustomBtn> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: widget.inProgress
          ? widget.style ??
              ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(
                      AppColors.buttonPrimaryLoading),
                  foregroundColor: WidgetStateProperty.all<Color>(
                      AppColors.buttonPrimaryForeground))
          : null,
      child: widget.inProgress
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.txt),
                context.wSBox(Const.scrnPer2),
                const CustomLoadingIcon()
              ],
            )
          : Text(
              widget.txt,
              style: widget.textStyle ?? context.textTheme.labelMedium,
            ),
    );
  }
}
