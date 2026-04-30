import 'package:flutter/material.dart';
import 'package:food/utils/app_colors.dart';

import 'food_card_icon_widget.dart';

class AppActionButton extends StatelessWidget {
  const AppActionButton({
    super.key,
    this.isFoodCart = false,
    this.icon = Icons.more_horiz,
    this.bgColor,
    this.iconColor,
    required this.onTap,
  });
  final bool isFoodCart;
  final IconData icon;
  final Color? bgColor;
  final Color? iconColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return isFoodCart
        ? FoodCardIconWidget()
        : Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: InkWell(
              onTap: onTap,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: bgColor ?? AppColors.leadingIcnBtnClr.withOpacity(0.7),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Icon(icon, color: iconColor ?? AppColors.white),
                ),
              ),
            ),
          );
  }
}
