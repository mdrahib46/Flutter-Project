import 'package:flutter/material.dart';

class AppColorsScheme {
  AppColorsScheme._();

  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFFB90063),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFFFD9E2),
    onPrimaryContainer: Color(0xFF3E001D),

    secondary: Color(0xFF74565F),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFFFD9E2),
    onSecondaryContainer: Color(0xFF2B151C),

    tertiary: Color(0xFF7C5635),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFFFDCC1),
    onTertiaryContainer: Color(0xFF2E1500),

    error: Color(0xFFBA1A1A),
    onError: Color(0xFFFFFFFF),
    errorContainer: Color(0xFFFFDAD6),
    onErrorContainer: Color(0xFF410002),

    surface: Color(0xFFFFFBFF),
    onSurface: Color(0xFF201A1B),

    surfaceContainerHighest: Color(0xFFF2DDE1),
    onSurfaceVariant: Color(0xFF514347),

    outline: Color(0xFF837377),
    outlineVariant: Color(0xFFD5C2C6),

    inverseSurface: Color(0xFF352F30),
    onInverseSurface: Color(0xFFFAEEEF),
    inversePrimary: Color(0xFFFFB1C8),

    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFFB90063),
    scrim: Color(0xFF000000),
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,

    primary: Color(0xFFFFB1C8),
    onPrimary: Color(0xFF650033),
    primaryContainer: Color(0xFF8E004A),
    onPrimaryContainer: Color(0xFFFFD9E2),

    secondary: Color(0xFFE3BDC6),
    onSecondary: Color(0xFF422931),
    secondaryContainer: Color(0xFF5A3F47),
    onSecondaryContainer: Color(0xFFFFD9E2),

    tertiary: Color(0xFFEFBD94),
    onTertiary: Color(0xFF48290C),
    tertiaryContainer: Color(0xFF623F20),
    onTertiaryContainer: Color(0xFFFFDCC1),

    error: Color(0xFFFFB4AB),
    onError: Color(0xFF690005),
    errorContainer: Color(0xFF93000A),
    onErrorContainer: Color(0xFFFFDAD6),
    onBackground: Color(0xFFEBE0E1),

    surface: Color(0xFF201A1B),
    onSurface: Color(0xFFEBE0E1),

    surfaceContainerHighest: Color(0xFF514347),
    onSurfaceVariant: Color(0xFFD5C2C6),

    outline: Color(0xFF9E8C90),
    outlineVariant: Color(0xFF514347),

    inverseSurface: Color(0xFFEBE0E1),
    onInverseSurface: Color(0xFF201A1B),
    inversePrimary: Color(0xFFB90063),

    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFFFFB1C8),
    scrim: Color(0xFF000000),
  );
}
