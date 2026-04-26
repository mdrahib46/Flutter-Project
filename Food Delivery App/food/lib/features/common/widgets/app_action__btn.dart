import 'package:flutter/material.dart';
import 'package:food/utils/app_colors.dart';

import 'food_card_icon_widget.dart';

class AppActionButton extends StatelessWidget {
  const AppActionButton({super.key, this.isFoodCart = false, required this.onTap});
  final bool isFoodCart;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return isFoodCart
        ? FoodCardIconWidget()
        : Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: InkWell(
        onTap: onTap ,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.leadingIcnBtnClr,
          ),
          child: const Padding(
            padding: EdgeInsets.all(8),
            child: Icon(Icons.more_horiz, color: Colors.black),
          ),
        ),
      ),
    );
  }
}