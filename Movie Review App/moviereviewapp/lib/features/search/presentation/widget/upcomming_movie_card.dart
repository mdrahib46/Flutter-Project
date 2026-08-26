
import 'package:flutter/material.dart';

import '../../../../app/asset_path.dart';
import '../../../../core/app_colors.dart';



class UpcomingMovieCard extends StatelessWidget {
  const UpcomingMovieCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: .min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: SizedBox(
            height: 150,
            width: 250,
            child: Image.asset(
              AssetPath.dummyImage2,
              fit: BoxFit.cover,
            ),
          ),
        ),

        const SizedBox(height: 6),

        SizedBox(
          width: 250,
          child: Text(
            'Movie: Super Man Movie',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),

        const SizedBox(height: 4),

        SizedBox(
          width: 250,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Oct 02, 2026',
                style: TextStyle(
                  color: Colors.white70,
                ),
              ),
              Icon(
                Icons.bookmark_border,
                color: AppColors.accent,
              ),
            ],
          ),
        ),
      ],
    );
  }
}