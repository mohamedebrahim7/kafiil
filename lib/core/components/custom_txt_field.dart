import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomTxtField extends StatefulWidget {
  final String title;
  final String? Function(String?)? validator;
  final String? errorText;
  final String hint;
  final String? helper;
  final bool readOnly;
  final TextEditingController? textController;
  final bool isPassword;
  final TextInputType? keyboardType;
  final bool? enabled;
  final bool? autoFocus;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final int? maxLines;
  final EdgeInsetsGeometry? contentPadding;
  final ValueChanged<String>? onFieldSubmitted;
  final String? initialValue;

  const CustomTxtField(
      {super.key,
      this.initialValue,
      required this.title,
      this.textController,
      required this.hint,
      this.isPassword = false,
      this.keyboardType,
      this.enabled,
      this.textInputAction,
      this.errorText,
      this.focusNode,
      this.onChanged,
      this.onEditingComplete,
      this.validator,
      this.helper,
      this.maxLines,
      this.contentPadding,
      this.readOnly = false,
      this.onFieldSubmitted,
      this.autoFocus});

  @override
  State<CustomTxtField> createState() => _CustomTxtFieldState();
}

class _CustomTxtFieldState extends State<CustomTxtField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(widget.title,
            style: context.textTheme.titleMedium?.copyWith(
                color: widget.errorText != null
                    ? AppColors.textFiledError
                    : null)),
        context.hSBox(Const.scrnPer1),
        TextFormField(
          initialValue: widget.initialValue,
          autofocus: widget.autoFocus ?? false,
          readOnly: widget.readOnly,
          validator: widget.validator,
          onFieldSubmitted: widget.onFieldSubmitted,
          onEditingComplete: widget.onEditingComplete,
          focusNode: widget.focusNode,
          onChanged: widget.onChanged,
          textInputAction: widget.textInputAction,
          keyboardType: widget.keyboardType,
          obscureText: widget.isPassword ? obscureText : false,
          controller: widget.textController,
          enabled: widget.enabled,
          style: context.textTheme.headlineMedium?.copyWith(
              color:
                  widget.errorText != null ? AppColors.textFiledError : null),
          cursorColor: AppColors.primary,
          maxLines: widget.maxLines,
          decoration: InputDecoration(
              errorMaxLines: 4,
              errorStyle: context.textTheme.titleMedium?.copyWith(
                  color: AppColors.textFiledError,
                  fontSize: context.heightPercentage(1.3)),
              contentPadding: widget.contentPadding ??
                  EdgeInsets.symmetric(
                    vertical: context.heightPercentage(3),
                    horizontal: context.widthPercentage(3),
                  ),
              helperText: widget.helper,
              helperMaxLines: 2,
              suffixIcon: widget.isPassword
                  ? Padding(
                      padding:
                          EdgeInsets.only(right: context.widthPercentage(2)),
                      child: IconButton(
                        icon: Icon(
                          obscureText
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: const Color(0xFF8692A6),
                        ),
                        onPressed: () {
                          setState(
                            () {
                              obscureText = !obscureText;
                            },
                          );
                        },
                      ),
                    )
                  : null,
              errorText: widget.errorText,
              hintText: widget.hint,
              fillColor: widget.errorText != null
                  ? AppColors.textFiledFillErrorColor
                  : null),
        )
      ],
    );
  }
}
