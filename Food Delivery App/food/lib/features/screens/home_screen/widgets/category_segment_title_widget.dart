import 'package:flutter/material.dart';
import 'package:food/utils/app_colors.dart';
import 'package:food/utils/app_text_style.dart';


class CategorySegmentTitleWidget extends StatelessWidget {
  const CategorySegmentTitleWidget({
    super.key,
    required this.title,
    required this.onTap,
  });
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: AppTextStyles.primaryTitle),
        const Spacer(),
        InkWell(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('See All', style: TextStyle(fontWeight: FontWeight.w500)),
              const SizedBox(width: 4),
              Icon(
                Icons.arrow_forward_ios,
                size: 14,
                color: AppColors.hintTextColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}