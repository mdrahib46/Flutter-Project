import 'package:flutter/material.dart';
import 'package:food/features/screens/onboardings/onboarding_screen.dart';
import 'features/screens/onboardings/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,

      initialRoute: SplashScreen.name,

      onGenerateRoute: (RouteSettings settings) {
        Widget widget;

        if (settings.name == SplashScreen.name) {
          widget = const SplashScreen();
        } else if (settings.name == OnboardingScreen.name) {
          widget = const OnboardingScreen();
        } else {
          widget = const Scaffold(
            body: Center(child: Text("No route found")),
          );
        }

        return MaterialPageRoute(builder: (context) => widget);
      },
    );
  }
}
