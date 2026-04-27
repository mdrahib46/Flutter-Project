import 'package:flutter/material.dart';
import 'package:food/utils/app_colors.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({
    super.key,
    required this.foodTitle,
    required this.restaurantTitle,
    required this.price,
    required this.onTap,
    required this.imageUrl,
  });

  final String foodTitle, restaurantTitle, price, imageUrl;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 6),

            Text(
              foodTitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),

            Text(
              restaurantTitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w300,
              ),
            ),

            const SizedBox(height: 4),

            Row(
              children: [
                Text(
                  '\$$price',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: AppColors.primaryColor,
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(6),
                    child: const Icon(
                      Icons.add,
                      size: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}