import 'package:flutter/material.dart';

import '../util/colors.dart';

class AppElevatedButtonTheme {
  AppElevatedButtonTheme._(); //To avoid creating instances

  /* -- Light Theme -- */

  static ElevatedButtonThemeData lightElevatedButtonTheme(double size) {
    return ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.buttonPrimary,
      foregroundColor: AppColors.buttonPrimaryForeground,
      disabledBackgroundColor: AppColors.buttonDisabled,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: size * .023),
      minimumSize: Size.fromHeight(size * .075),
    ));
  }
}

/// shapes of button you can apply

/*
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0),)

shape: BeveledRectangleBorder()

shape: StadiumBorder(),

shape: CircleBorder()


 */
