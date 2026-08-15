

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket_booking_app/app/app_theme.dart';
import 'package:ticket_booking_app/app/provider/theme_mode_provider.dart';

import '../features/shared/presentation/screen/main_bottom_nav_screen.dart';

class FlightBookingApp extends StatelessWidget {
  const FlightBookingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=> ThemeModeProvider(),
      child: Consumer<ThemeModeProvider>(
        builder: (context,provider,_) {
          return MaterialApp(
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: provider.themeMode,
            home: MainBottomNavScreen(),
          );
        }
      ),
    );
  }
}
