import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomDateTxtField extends StatefulWidget {
  final String title;
  final String? errorText;
  final String hint;
  final bool? enabled;
  final String? helper;
  final DateTime? selectedDate;
  final ValueChanged<DateTime?> onDateSelected;
  final String? initialValue;
  final TextEditingController? textController;
  final ValueChanged<String>? onChanged;
  final EdgeInsetsGeometry? contentPadding;

  const CustomDateTxtField(
      {super.key,
      required this.title,
      this.textController,
      this.initialValue,
      required this.hint,
      this.errorText,
      this.onChanged,
      this.helper,
      this.contentPadding,
      required this.onDateSelected,
      this.selectedDate,
      this.enabled});

  @override
  State<CustomDateTxtField> createState() => _CustomDateTxtFieldState();
}

class _CustomDateTxtFieldState extends State<CustomDateTxtField> {
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != widget.selectedDate) {
      widget.onDateSelected(picked);
      widget.textController?.text = "${picked.toLocal()}".split(' ')[0];
    }
  }

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
          onTap: () => _selectDate(context),
          enabled: widget.enabled,
          readOnly: true,
          controller: widget.textController,
          style: context.textTheme.headlineMedium?.copyWith(
              color:
                  widget.errorText != null ? AppColors.textFiledError : null),
          cursorColor: AppColors.primary,
          decoration: InputDecoration(
              errorMaxLines: 4,
              errorStyle: context.textTheme.titleMedium?.copyWith(
                  color: AppColors.textFiledError,
                  fontSize: context.heightPercentage(1.3)),
              contentPadding: widget.contentPadding ??
                  EdgeInsets.symmetric(
                    vertical: context.heightPercentage(3.5),
                    horizontal: context.widthPercentage(3.5),
                  ),
              helperText: widget.helper,
              helperMaxLines: 2,
              suffixIcon: Padding(
                padding: EdgeInsets.only(right: context.widthPercentage(2)),
                child: const Icon(
                  Icons.calendar_month_outlined,
                  color: Color(0xFF8692A6),
                ),
              ),
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
