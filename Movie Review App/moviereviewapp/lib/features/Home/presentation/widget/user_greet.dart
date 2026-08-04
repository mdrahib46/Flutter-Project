import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';

class UserGreetWidget extends StatelessWidget {
  const UserGreetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: "Welcome back,",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
            children: [
              TextSpan(
                text: ' Dilhara',
                style: TextStyle(
                  color: AppColors.titleTextColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextSpan(
                text: '!',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const Text(
          'Review or log film you’ve watched...',
          style: TextStyle(
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
