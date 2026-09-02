import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';



class MovieSectionHeader extends StatelessWidget {
  const MovieSectionHeader({super.key, required this.title, this.onTap});

  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        const Spacer(),
        TextButton(
          onPressed: onTap,
          child: onTap != null ?  Text(
            'View All',
            style: TextStyle(color: AppColors.accent),
          ): SizedBox(),
        ),
      ],
    );
  }
}