import 'package:flutter/material.dart';
import '../util/colors.dart';

class AppCheckboxTheme {
  AppCheckboxTheme._(); // Private constructor to prevent instantiation

  static CheckboxThemeData lightCheckboxTheme() {
    return  CheckboxThemeData(
      checkColor: WidgetStateColor.resolveWith((states) => AppColors.checkBoxCheckColor), // Color of the checkmark when checkbox is checked
      side: const BorderSide(color: AppColors.checkBoxBorderColor,),
      fillColor: WidgetStateProperty.resolveWith((states) {
       if (states.contains(WidgetState.selected)) {
          return AppColors.checkBoxFillColor;
        }
        return null;
      }),
      // Border color of the checkbox
    );
  }
}
