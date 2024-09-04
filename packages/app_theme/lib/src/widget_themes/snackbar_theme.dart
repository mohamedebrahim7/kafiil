import 'package:flutter/material.dart';

import '../util/colors.dart';

class AppSnackBarTheme {
  AppSnackBarTheme._(); // Private constructor to prevent instantiation

  static SnackBarThemeData lightSnackBarTheme() {
    return const SnackBarThemeData(
      backgroundColor: AppColors.snackBarSuccessColor,
      behavior: SnackBarBehavior.floating,

      //  showCloseIcon: false,
      // closeIconColor: AppColors.snackBarCloseIconColor
    );
  }
}
