import 'package:flutter/material.dart';
import 'package:food/utils/app_colors.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
    super.key, required this.restaurantTitle, required this.itemList, required this.imageUrl,
  });

  final String imageUrl, restaurantTitle, itemList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadiusGeometry.circular(16),
            image: DecorationImage(
              image: NetworkImage(
                imageUrl,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Text(
          restaurantTitle,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        Text(
          itemList,
          style: TextStyle(
            fontSize: 14,
            color: AppColors.textSecondaryColor,
          ),
        ),
        Row(children: [
          Icon(Icons.star_border, color: AppColors.primaryColor, size: 20,),
          Text(' 4.7', style: TextStyle(fontWeight: FontWeight.w600),),
          const SizedBox(width: 20,),
          Icon(Icons.delivery_dining, color: AppColors.primaryColor, size: 20,),
          Text(' Free', style: TextStyle(fontWeight: FontWeight.w600),),
          const SizedBox(width: 20,),
          Icon(Icons.access_time_rounded, color: AppColors.primaryColor, size: 20,),
          Text(' 20 min', style: TextStyle(fontWeight: FontWeight.w600),)
        ],)
      ],
    );
  }
}