import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class CustomPhoneTxtField extends StatelessWidget {
  final String title;
  final String? errorText;
  final String hint;
  final TextEditingController? controller;
  final bool enabled;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final ValueChanged<PhoneNumber>? onChanged;
  final ValueChanged<Country>? onCountryChanged;
  final void Function(String)? onSubmitted;
  final String? initialCountryCode;

  const CustomPhoneTxtField({
    super.key,
    required this.title,
    this.controller,
    required this.hint,
    this.enabled = true,
    this.textInputAction,
    this.errorText,
    this.focusNode,
    this.onChanged,
    this.onCountryChanged,
    this.onSubmitted,
    this.initialCountryCode,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title,
            style: context.textTheme.titleMedium?.copyWith(
                color: errorText != null ? AppColors.textFiledError : null)),
        context.hSBox(Const.scrnPer1),
        IntlPhoneField(
          keyboardType: TextInputType.phone,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly, // Allow only digits
          ],
          autovalidateMode: AutovalidateMode.disabled,
          controller: controller,
          focusNode: focusNode,
          enabled: enabled,
          textInputAction: textInputAction,
          flagsButtonPadding: const EdgeInsets.only(left: 8),
          disableLengthCheck: false,
          initialCountryCode: initialCountryCode ?? 'EG',
          dropdownIconPosition: IconPosition.trailing,
          style: context.textTheme.titleSmall?.copyWith(
              color: errorText != null ? AppColors.textFiledError : null),
          cursorColor: AppColors.primary,
          decoration: InputDecoration(
              errorText: errorText,
              hintText: hint,
              fillColor:
                  errorText != null ? AppColors.textFiledFillErrorColor : null),
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          onCountryChanged: onCountryChanged,
        )
      ],
    );
  }
}
