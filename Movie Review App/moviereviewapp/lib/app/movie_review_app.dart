import 'package:flutter/material.dart';

import '../features/auth/presentation/screens/splash_screen.dart';
import 'app_routes.dart';
import 'app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: SplashScreen.name,
      onGenerateRoute: AppRoutes.onGeneratedRoute,
      home: SplashScreen(),
    );
  }
}
