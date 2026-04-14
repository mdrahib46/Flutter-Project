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
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(
        context,
        OnboardingScreen.name,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Image(image: AssetImage(AppImages.logo), height: 70,)),
    );
  }
}