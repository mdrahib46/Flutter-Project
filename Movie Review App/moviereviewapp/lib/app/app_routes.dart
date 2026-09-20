import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviereviewapp/features/Home/presentation/screens/home_screen.dart';
import 'package:moviereviewapp/features/auth/presentation/screens/splash_screen.dart';
import 'package:moviereviewapp/features/auth/presentation/screens/login_screen.dart';
import 'package:moviereviewapp/features/auth/presentation/screens/code_verification.dart';
import 'package:moviereviewapp/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:moviereviewapp/features/auth/presentation/screens/signup_screen.dart';
import 'package:moviereviewapp/features/shared/presentation/screen/main_nav_screen.dart';
import 'package:moviereviewapp/features/logger/presentation/screen/logger_screen.dart';
import 'package:moviereviewapp/features/shared/presentation/screen/movie_list_screen.dart';
import '../data/model/movie_model.dart';

class AppRoutes {
  static Route<dynamic>? onGeneratedRoute(RouteSettings settings) {
    Widget widget = const SizedBox();

    switch (settings.name) {
      case SplashScreen.name:
        widget = const SplashScreen();
      case LoginScreen.name:
        widget = const LoginScreen();
      case SignupScreen.name:
        widget = const SignupScreen();
      case ForgotPasswordScreen.name:
        widget = const ForgotPasswordScreen();
      case CodeVerificationScreen.name:
        widget = const CodeVerificationScreen();
      case MainNavScreen.name:
        widget = const MainNavScreen();

      case HomeScreen.name:
        widget = const HomeScreen();
      case LoggerScreen.name:
        widget = const LoggerScreen();
      case MovieListScreen.name:
        final args = settings.arguments as Map<String, dynamic>;
        widget = MovieListScreen(
          title: args['title'] as String,
          movies: args['movies'] as List<MovieModel>,
        );
    }

    return MaterialPageRoute(builder: (ctx) => widget);
  }
}
