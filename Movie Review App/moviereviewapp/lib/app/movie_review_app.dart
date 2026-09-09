import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../features/auth/presentation/screens/splash_screen.dart';
import '../features/shared/presentation/provider/bottom_nav_provider.dart';
import 'app_routes.dart';
import 'app_theme.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomNavProvider()),
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        initialRoute: SplashScreen.name,
        onGenerateRoute: AppRoutes.onGeneratedRoute,
        home: SplashScreen(),
      ),
    );
  }
}
