import 'package:flutter/material.dart';

class AppColors {
  // App theme colors
  static const Color primary = Color(0xff1DBF73);
  static const Color secondary = Color(0xfffd5664);
  static const Color background = Colors.white;
  static const Color bgColor = Color(0xffF9F9F9);
  static const Color iconColor = Color(0xffAAAAAA);
  static const Color disabled = Color(0xffE6EAEF);

  /// AppBar colors
  static const Color appBarBackground = primary;
  static const Color appBarForeground = Colors.white;

  /// End of AppBar colors

  /// Text colors
  static const Color textPrimary = Colors.black;
  static const Color textSecondary = Color(0xff696F79);
  static const Color textQuaternary = Colors.white;
  static const Color textTertiary = Color(0xffaaaaaa);
  static const Color textDisabled = Color(0xffC3C5C8);
  static const Color textError = Color(0xffE0232E);

  /// End of Text colors

  /// Button colors
  static const Color buttonPrimary = Color(0xff1DBF73);
  static const Color buttonPrimaryForeground = Colors.white;
  static const Color buttonPrimaryLoading = Color(0xff61d0c2);

  static const Color buttonSecondary = Colors.white;
  static const Color buttonSecondaryForeground = secondary;
  static const Color buttonSecondaryBorder = secondary;

  static const Color buttonFloating = primary;
  static const Color buttonFloatingForeground = Colors.white;

  static const Color buttonDisabled = Colors.grey;

  ///End of Button colors

  /// TextFiled colors
  static const Color textFiledLabel = Color(0xFF2B2B2B);
  static Color textFiledSuffixIconColor =
      const Color(0xFFAAAAAA).withOpacity(0.5);
  static Color textFiledHint = const Color(0xFF626262).withOpacity(0.5);
  static const Color textFiledError = Color(0xFFE02B1D);
  static const Color textFiledBorderEnabled = Color(0xFFAFBACA);
  static const Color textFiledBorderDisabled = Color(0xFF626262);
  static const Color textFiledBorderError = Color(0xFFE92215);
  static const Color textFiledFillColor = Color(0xFFF9F9F9);
  static const Color textFiledFillErrorColor = Color(0xFFFFF5F4);
  static const Color errorColor = Color(0xFFFFF5F4);

  ///End of TextFiled colors

  /// CheckBox colors
  static const Color checkBoxCheckColor = background;
  static const Color checkBoxFillColor = primary;
  static const Color checkBoxBorderColor = Color(0xFFAFBACA);

  ///End of CheckBox colors

  /// SnackBar colors
  static const Color snackBarErrorColor = Color(0xFFFFF0ED);
  static const Color snackBarErrorBorderColor = secondary;
  static const Color snackBarSuccessColor = Color(0xFFEFFFFD);
  static const Color snackBarSuccessBorderColor = Color(0xFF009262);
  // static const Color snackBarCloseIconColor = Color(0xFFE02B1D);
  ///End of SnackBar colors

  /// TabBar colors
  static const Color tabBarLabelColor = secondary;
  static const Color tabBarUnselectedLabelColor = Color(0xFF4D4D4D);
  static const Color tabBarIndicatorColor = secondary;

  ///End of TabBar colors

  /// Radio colors
  static const Color radioColorOn = primary;
  static const Color radioColorOff = Color(0xFFC3C5C8);

  ///End of Radio colors

  /// Bottom Navigation Bar colors
  static const Color navBarSelectColor = primary;
  static const Color navBarUnSelectColor = Color(0xFFAAAAAA);
  static const Color navBarBackColor = background;

  ///End of Bottom Navigation Bar colors

  /// switch colors
  static const Color switchTrackColorOn = secondary;
  static const Color switchTrackColorOff = background;
  static const Color switchThumbColorOn = background;
  static const Color switchThumbColorOff = primary;
  static const Color switchBorderColorOn = secondary;
  static const Color switchBorderColorOff = primary;

  ///End of switch colors
}
