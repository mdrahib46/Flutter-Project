import 'package:flutter/material.dart';
import 'package:moviereviewapp/core/app_colors.dart';
import 'package:moviereviewapp/core/app_strings.dart';
import 'package:moviereviewapp/features/Home/presentation/screens/home_screen.dart';
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
                      child: Text("Get Started"),
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

  void _moveToNextScreen() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      MainNavScreen.name,
      (route) => false,
    );
  }
}
