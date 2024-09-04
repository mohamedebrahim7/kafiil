import 'package:app_theme/app_theme.dart';
import 'package:app_theme/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

extension BuildContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSuccessSnackBar(
      String message) {
    ScaffoldMessenger.of(this).removeCurrentSnackBar();

    return ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        content: Row(
          children: [
            SvgPicture.asset(
              Assets.assetsSuccessIcon,
            ),
            wSBox(3),
            Expanded(
              child: Text(
                message,
                style: TextStyle(
                    color: AppColors.snackBarSuccessBorderColor,
                    fontSize: heightPercentage(1.6)),
              ),
            ),
            wSBox(3),
            GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(this).hideCurrentSnackBar();
              },
              child: SvgPicture.asset(
                colorFilter:
                    const ColorFilter.mode(Color(0xFF2DC071), BlendMode.srcIn),
                Assets.assetsErrorCancelIcon,
              ),
            ),
          ],
        ),
      ),
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showErrorSnackBar(
      String message) {
    double heightWithoutappBarNavBar = MediaQuery.of(this).size.height -
        (kBottomNavigationBarHeight + kToolbarHeight);

    ScaffoldMessenger.of(this).removeCurrentSnackBar();
    return ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        dismissDirection: DismissDirection.up,
        margin: EdgeInsets.only(
            left: widthPercentage(4),
            right: widthPercentage(4),
            bottom: heightWithoutappBarNavBar),
        padding: EdgeInsets.symmetric(vertical: heightPercentage(1)),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widthPercentage(1))),
        duration: const Duration(seconds: 2),
        backgroundColor: AppColors.snackBarErrorColor,
        content: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            //add an  icon  widget of information
            wSBox(2),

            Icon(
              Icons.info_outline,
              color: const Color(0xFFF56342),
              size: heightPercentage(2),
            ),
            wSBox(2),
            Expanded(
              child: Text(
                message,
                style: GoogleFonts.montserrat(
                    color: const Color(0xFFF56342),
                    fontSize: heightPercentage(2),
                    fontWeight: FontWeight.w500),
              ),
            ),
            wSBox(3),
          ],
        ),
      ),
    );
  }

//  ColorScheme get colorScheme => theme.colorScheme;
}
