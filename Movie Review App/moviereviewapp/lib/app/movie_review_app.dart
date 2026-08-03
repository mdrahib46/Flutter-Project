import 'package:flutter/material.dart';
import 'package:moviereviewapp/app/app_theme.dart';

import '../features/auth/presentation/screens/splash_screen.dart';
import 'app_routes.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: AppTheme.lightTheme,
      initialRoute: SplashScreen.name,
      onGenerateRoute: AppRoutes.onGeneratedRoute,
      home: SplashScreen(),
    );
  }
}