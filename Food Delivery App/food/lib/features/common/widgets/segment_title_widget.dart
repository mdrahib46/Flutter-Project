import 'package:flutter/material.dart';
import 'package:food/utils/app_colors.dart';
import 'package:food/utils/app_text_style.dart';


class SegmentTitleWidget extends StatelessWidget {
  const SegmentTitleWidget({
    super.key,
    required this.title,
    this.onTap, this.isSeeAllVisible = true,
  });
  final String title;
  final VoidCallback? onTap;

  final bool isSeeAllVisible;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: AppTextStyles.primaryTitle),
        const Spacer(),
        InkWell(
          onTap: onTap,
          child: isSeeAllVisible ?   Row(
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
          ) : SizedBox(),
        ),
      ],
    );
  }
}