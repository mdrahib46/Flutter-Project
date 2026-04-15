import 'package:flutter/material.dart';
import 'package:food/features/screens/auth_screen/login_screen.dart';
import 'package:food/features/screens/onboardings/widgets/onboarding_screen_widget.dart';
import 'package:food/provider/%20onBoardingProvider.dart';
import 'package:food/utils/app_colors.dart';
import 'package:food/utils/app_strings.dart';
import 'package:food/utils/image_path.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends StatefulWidget {
  static const String name = '/On-Boarding';
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController();
  late OnboardingProvider onboardingProvider;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      onboardingProvider = Provider.of<OnboardingProvider>(context, listen: false);
      onboardingProvider.startAutoSlide(controller);
    });
  }

  @override
  void dispose() {
    onboardingProvider.stopAutoSlide();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OnboardingProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              PageView(
                controller: controller,
                onPageChanged: provider.updateIndex,
                children: const [
                  OnBoardingScreenWidget(
                    imagePath: AppImages.onboarding1,
                    title: AppStrings.onBoardingTitle1,
                    subTitle: AppStrings.onBoardingSubTitle1,
                  ),
                  OnBoardingScreenWidget(
                    imagePath: AppImages.onboarding2,
                    title: AppStrings.onBoardingTitle2,
                    subTitle: AppStrings.onBoardingSubTitle2,
                  ),
                  OnBoardingScreenWidget(
                    imagePath: AppImages.onboarding3,
                    title: AppStrings.onBoardingTitle3,
                    subTitle: AppStrings.onBoardingSubTitle3,
                  ),
                ],
              ),


              Positioned(
                bottom: 240,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    3,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      height: 8,
                      width: provider.currentIndex == index ? 20 : 8,
                      decoration: BoxDecoration(
                        color: provider.currentIndex == index
                            ? AppColors.activeDotColor
                            : AppColors.inActiveDotColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),

              Positioned(
                bottom: 32,
                right: 10,
                left: 10,
                child: TextButton(
                  onPressed: () {
                    provider.skip(controller);
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.primaryColor,
                  ),
                  child: Text(provider.currentIndex < 2 ? "Skip" : '',),
                ),
              ),


              Positioned(
                bottom: 100,
                right: 0,
                left: 0,
                child: ElevatedButton(
                  onPressed: () {
                    if (provider.currentIndex == 2) {
                      onTapLogin();
                    } else {
                      provider.nextPage(controller);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.buttonBackground,
                    foregroundColor: AppColors.buttonForeground,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(8),
                    ),
                  ),
                  child: Text(
                    provider.currentIndex == 2 ? "Get Started" : "Next",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onTapLogin(){
    Navigator.pushNamedAndRemoveUntil(context, LoginScreen.name, (route)=> false);
  }
}
