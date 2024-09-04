import 'package:app_theme/app_theme.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  final String title;
  final String? errorText;
  final String hint;
  final bool? enabled;
  final ValueSetter? onChanged;
  final FocusNode? focusNode;
  final List<DropDownValueModel> dropDownList;

  const CustomDropDown({
    super.key,
    required this.title,
    required this.hint,
    this.enabled,
    this.focusNode,
    this.errorText,
    this.onChanged,
    required this.dropDownList,
  });

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
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
        DropDownTextField(
          textFieldFocusNode: widget.focusNode,
          clearOption: false,
          onChanged: widget.onChanged,
          isEnabled: widget.enabled ?? true,
          textStyle: context.textTheme.titleMedium?.copyWith(
              color:
                  widget.errorText != null ? AppColors.textFiledError : null),
          textFieldDecoration: InputDecoration(
              errorMaxLines: 4,
              errorStyle: context.textTheme.titleMedium?.copyWith(
                  color: AppColors.textFiledError,
                  fontSize: context.heightPercentage(1.3)),
              contentPadding: EdgeInsets.symmetric(
                vertical: context.heightPercentage(3),
                horizontal: context.widthPercentage(3),
              ),
              helperMaxLines: 2,
              errorText: widget.errorText,
              hintText: widget.hint,
              fillColor: widget.errorText != null
                  ? AppColors.textFiledFillErrorColor
                  : null),
          dropDownList: widget.dropDownList,
        )
      ],
    );
  }
}
