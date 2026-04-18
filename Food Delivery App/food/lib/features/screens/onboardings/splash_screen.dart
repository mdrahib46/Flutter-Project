import 'package:flutter/material.dart';
import 'package:food/features/screens/onboardings/onboarding_screen.dart';
import 'package:food/utils/image_path.dart';


class SplashScreen extends StatefulWidget {
  static const String name = '/splash';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(
        context,
        OnboardingScreen.name,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image(
              image: AssetImage(AppImages.splashScreenBg),
              fit: BoxFit.cover,
            ),
          ),
          Center(child: Image(image: AssetImage(AppImages.logo), height: 70,))

        ],
      ),
    );
  }
}