import 'package:flutter/material.dart';
import 'package:food/utils/app_colors.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  final int index;
  final int activeIndex;

  const OnBoardingDotNavigation({
    super.key,
    required this.index,
    required this.activeIndex,
  });

  @override
  Widget build(BuildContext context) {
    final bool isActive = index == activeIndex;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive
            ? AppColors.activeDotColor
            : AppColors.inActiveDotColor,
      ),
    );
  }
}