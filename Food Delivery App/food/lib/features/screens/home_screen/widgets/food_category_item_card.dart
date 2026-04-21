import 'package:flutter/material.dart';
import 'package:food/utils/app_colors.dart';

class FoodCategoryItemCard extends StatelessWidget {
  const FoodCategoryItemCard({
    super.key,
    required this.imageUrl,
    required this.cardTitle,
    required this.onTap,
  });
  final String imageUrl, cardTitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Card(
            color: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(8),
            ),
            child: Image(height: 80, width: 80, image: NetworkImage(imageUrl)),
          ),
          Text(cardTitle, style: TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}