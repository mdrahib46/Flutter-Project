import 'package:flutter/material.dart';

import '../core/app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme => _lightTheme;

  static final _lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.primary,
    fontFamily: "Poppins",

    colorSchemeSeed: AppColors.textPrimary,

    // App Bar Theme
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.textPrimary,
    ),

    // Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.accent,
        foregroundColor: Colors.white,
        minimumSize: const Size(
          double.infinity,
          40,
        ),
      ),
    ),

    // Text Theme
    textTheme: ThemeData.light().textTheme.apply(
      bodyColor: Colors.white,
      displayColor: Colors.white,
    ),

    // Input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      // Background
      filled: true,
      fillColor: const Color(0xFFC4C4C4).withAlpha(60),

      suffixIconColor: Colors.white,
      prefixIconColor: Colors.white,




      // Default Border
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          color: Colors.white,
        ),
      ),

      // Enabled Border
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          color: Colors.white,
        ),
      ),

      // Focused Border
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          color: Colors.white,
          width: 2,
        ),
      ),

      // Error Border
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 1.5,
        ),
      ),

      // Focused + Error Border
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 2,
        ),
      ),

      // Disabled Border
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          color: Colors.grey,
        ),
      ),

      // Error Text
      errorStyle: const TextStyle(
        color: Colors.red,
        fontSize: 12,
      ),

      // Hint Text
      hintStyle: TextStyle(
        color: Colors.white,
      ),

      // Content Padding
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
    ),
  );
}