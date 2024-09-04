import 'package:flutter/material.dart';
import '../util/colors.dart';

class AppSwitchTheme {
  AppSwitchTheme._(); // Private constructor to prevent instantiation

  static SwitchThemeData lightSwitchTheme() {
    return SwitchThemeData(
      thumbColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.switchThumbColorOn;
        }
        return AppColors.switchThumbColorOff;
      }),
      trackColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.switchTrackColorOn;
        }
        return AppColors.switchTrackColorOff;
      }),
      trackOutlineColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.switchBorderColorOn;
        }
        return AppColors.switchBorderColorOff;
      })
    );
  }
}
