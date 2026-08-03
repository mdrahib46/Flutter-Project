import 'package:flutter/material.dart';

import '../core/app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme => _lightTheme;

  static final _lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.primary,
    fontFamily: "Poppins",
    appBarTheme: AppBarTheme(backgroundColor: AppColors.primary,),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.accent,
        foregroundColor: Colors.white,
        minimumSize: Size(double.infinity, 40)
      ),
      
    ),
  );
}
