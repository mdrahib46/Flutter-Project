import 'package:flutter/material.dart';

import '../features/auth/presentation/screens/splash_screen.dart';
import 'app_routes.dart';
import 'app_theme.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: SplashScreen.name,
      onGenerateRoute: AppRoutes.onGeneratedRoute,
      home: SplashScreen(),
    );
  }
}
