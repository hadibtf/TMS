import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tms/theme/design_constants.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.lightBackground, // Default background
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.accent,
        background: AppColors.background,
        surface: AppColors.cardBackground,
        onPrimary: AppColors.textPrimary,
        onSecondary: AppColors.textPrimary,
        onBackground: AppColors.textPrimary,
        onSurface: AppColors.textPrimaryDark,
        error: Colors.redAccent,
        onError: Colors.white,
      ),
      textTheme: GoogleFonts.latoTextTheme(
        ThemeData.dark().textTheme.copyWith(
              displayLarge: const TextStyle(fontSize: AppFontSizes.xl, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
              displayMedium: const TextStyle(fontSize: AppFontSizes.xxl, fontWeight: FontWeight.bold, color: AppColors.textPrimaryDark),
              headlineMedium: const TextStyle(fontSize: AppFontSizes.lg, fontWeight: FontWeight.w500, color: AppColors.textPrimaryDark),
              bodyMedium: const TextStyle(fontSize: AppFontSizes.md, color: AppColors.textSecondary),
              labelLarge: const TextStyle(fontSize: AppFontSizes.md, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
            ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.lato(
          fontSize: AppFontSizes.lg,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
        ),
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
      ),
      cardTheme: CardTheme(
        color: AppColors.cardBackground,
        elevation: 2,
        margin: const EdgeInsets.symmetric(vertical: AppDimensions.paddingSm, horizontal: AppDimensions.paddingMd),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.borderRadius),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.primary,
        selectedItemColor: AppColors.accent,
        unselectedItemColor: AppColors.textSecondary,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}