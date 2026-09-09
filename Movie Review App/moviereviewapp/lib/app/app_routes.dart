import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviereviewapp/features/Home/presentation/screens/home_screen.dart';
import 'package:moviereviewapp/features/auth/presentation/screens/splash_screen.dart';
import 'package:moviereviewapp/features/auth/presentation/screens/login_screen.dart';
import 'package:moviereviewapp/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:moviereviewapp/features/auth/presentation/screens/signup_screen.dart';
import 'package:moviereviewapp/features/shared/presentation/screen/main_nav_screen.dart';

class AppRoutes {
  static Route<dynamic>? onGeneratedRoute(RouteSettings settings) {
    Widget widget = SizedBox();

    switch (settings.name) {
      case SplashScreen.name:
        widget = SplashScreen();
      case LoginScreen.name:
        widget = LoginScreen();
      case SignupScreen.name:
        widget = SignupScreen();
      case ForgotPasswordScreen.name:
        widget = ForgotPasswordScreen();
      case MainNavScreen.name:
        widget = MainNavScreen();

      case HomeScreen.name:
        widget = HomeScreen();
    }

    return MaterialPageRoute(builder: (ctx) => widget);
  }
}
