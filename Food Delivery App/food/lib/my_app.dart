import 'package:flutter/material.dart';
import 'package:food/features/screens/auth_screen/forgot_pass_screen.dart';
import 'package:food/features/screens/auth_screen/login_screen.dart';
import 'package:food/features/screens/auth_screen/otp_verify_screen.dart';
import 'package:food/features/screens/auth_screen/sign_up_screen.dart';
import 'package:food/features/screens/onboardings/onboarding_screen.dart';
import 'package:food/utils/app_colors.dart';
import 'features/screens/onboardings/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,

      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          filled: true,
          fillColor: AppColors.textFieldColor,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.buttonBackground,
            foregroundColor: AppColors.buttonForeground,
            minimumSize: Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(8),
            ),
          ),
        ),
      ),

      initialRoute: SplashScreen.name,

      onGenerateRoute: (RouteSettings settings) {
        Widget widget;

        if (settings.name == SplashScreen.name) {
          widget = const SplashScreen();
        } else if (settings.name == OnboardingScreen.name) {
          widget = const OnboardingScreen();
        } else if (settings.name == LoginScreen.name) {
          widget = const LoginScreen();
        } else if (settings.name == SignUpScreen.name) {
          widget = const SignUpScreen();
        } else if (settings.name == ForgotPassScreen.name) {
          widget = const ForgotPassScreen();
        }else if (settings.name == OtpVerifyScreen.name) {
          widget = const OtpVerifyScreen();
        }  else {
          widget = const Scaffold(body: Center(child: Text("No route found")));
        }

        return MaterialPageRoute(builder: (context) => widget);
      },
    );
  }
}
