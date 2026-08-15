import 'package:flutter/material.dart';

import '../../../app/app_colors.dart';

class TripTypeButton extends StatelessWidget {
  const TripTypeButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.selected,
  });

  final VoidCallback onTap;
  final String text;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: selected
              ? AppColors.primary
              : (isDark ? AppColors.darkInputBg : AppColors.lightInputBg),
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: selected
                ? AppColors.primary
                : (isDark ? AppColors.darkBorder : AppColors.lightBorder),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: selected
                ? Colors.white
                : (isDark
                      ? AppColors.darkTextSecondary
                      : AppColors.lightTextSecondary),
            fontWeight: selected ? FontWeight.bold : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
