import 'package:flutter/material.dart';

import '../../../app/app_colors.dart';

class HomeSectionHeader extends StatelessWidget {
  const HomeSectionHeader({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.w600,
            color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextPrimary,
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: onTap,
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                'View All',
                style: TextStyle(
                  color: isDark ? AppColors.darkTextSecondary : AppColors.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 4),
              Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: isDark ? AppColors.darkTextSecondary : AppColors.primary,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
