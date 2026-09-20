import 'package:flutter/material.dart';
import 'package:moviereviewapp/core/app_colors.dart';
import 'package:moviereviewapp/core/app_strings.dart';
import 'package:moviereviewapp/core/services/shared_pref_service.dart';
import 'package:moviereviewapp/features/auth/presentation/screens/login_screen.dart';
import 'package:moviereviewapp/features/shared/presentation/screen/main_nav_screen.dart';

import '../../../../app/asset_path.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String name = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginState();
  }

  Future<void> _checkLoginState() async {
    // Wait for a few seconds to show splash
    await Future.delayed(const Duration(seconds: 3));
    
    bool isLoggedIn = await SharedPrefService.getLoginState();
    
    if (mounted) {
      if (isLoggedIn) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          MainNavScreen.name,
          (route) => false,
        );
      } else {
        // Stay on splash or we can move automatically to login if preferred.
        // The user has a "Get Started" button, so maybe we stay here.
        // But "automatically login" usually means skipping splash if logged in.
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 500,
            child: Stack(
              children: [
                const SizedBox(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  child: Image(
                    image: AssetImage(AssetPath.splashBanner),
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: 160,
                    height: 160,
                    child: Image(
                      image: const AssetImage(AssetPath.logoSplashScreen),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 32.0,
                vertical: 16,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 20,
                  children: [
                    Text(
                      AppStrings.splashScreenText,
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _moveToNextScreen,
                      child: const Text("Get Started"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _moveToNextScreen() async {
    bool isLoggedIn = await SharedPrefService.getLoginState();
    if (mounted) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        isLoggedIn ? MainNavScreen.name : LoginScreen.name,
        (route) => false,
      );
    }
  }
}
