import 'package:flutter/material.dart';
import 'package:food/utils/app_colors.dart';

class FoodCardIconWidget extends StatelessWidget {
  const FoodCardIconWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Stack(
        children: [
           Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.actionBtnBg,
            ),
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Icon(
                Icons.shopping_bag_outlined,
                color: Colors.white,
              ),
            ),
          ),

          Positioned(
            right: 0,
            top: 0,
            child: Container(
              height: 18,
              width: 18,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primaryColor,
              ),
              child: Center(
                child: Text(
                  '12',
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}