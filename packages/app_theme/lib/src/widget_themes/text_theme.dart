import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../util/colors.dart';

/// Custom Class for Light & Dark Text Themes
class AppTextTheme {
  AppTextTheme._(); // To avoid creating instances

  /// Customizable Light Text Theme
  static TextTheme lightTextTheme(double size) {
    return TextTheme(
      /// The "headline" encapsulates the superstar text, the primary attention-grabber extensively used across the app.
      headlineLarge: GoogleFonts.montserrat(
          fontSize: size * .03,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary),
      headlineMedium: GoogleFonts.montserrat(
          fontSize: size * .02,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimary),
      headlineSmall: GoogleFonts.montserrat(
          fontSize: size * .018,
          fontWeight: FontWeight.w400,
          color: AppColors.textPrimary),

      /// "titleLine" serves as the secondary text element, providing important context and information.
      titleLarge: GoogleFonts.montserrat(
          fontSize: size * .03,
          fontWeight: FontWeight.bold,
          color: AppColors.textSecondary),
      titleMedium: GoogleFonts.montserrat(
          fontSize: size * .019,
          fontWeight: FontWeight.w500,
          color: AppColors.textSecondary),
      titleSmall: GoogleFonts.montserrat(
          fontSize: size * .014,
          fontWeight: FontWeight.w300,
          color: AppColors.textSecondary),

      /// "body" denotes the lowest priority, typically used for supplementary details and content within the app.
      bodyLarge: GoogleFonts.montserrat(
          fontSize: size * .02, color: AppColors.textTertiary),
      bodyMedium: GoogleFonts.montserrat(
          fontSize: size * .015, color: AppColors.textTertiary),
      bodySmall: GoogleFonts.montserrat(
          fontSize: size * .012, color: AppColors.textTertiary),

      displayLarge: GoogleFonts.montserrat(
          fontSize: size * .02,
          fontWeight: FontWeight.bold,
          color: Colors.black),
      displayMedium: GoogleFonts.montserrat(
          fontSize: size * .02,
          fontWeight: FontWeight.w500,
          color: AppColors.primary),
      displaySmall: GoogleFonts.montserrat(
          fontSize: size * .01,
          fontWeight: FontWeight.w300,
          color: Colors.black),

      labelMedium: GoogleFonts.montserrat(
          fontSize: size * .02,
          fontWeight: FontWeight.w400,
          color: AppColors.textQuaternary),

      labelSmall: GoogleFonts.montserrat(
          fontSize: size * .02,
          fontWeight: FontWeight.w400,
          color: AppColors.textDisabled),
    );
  }
}
