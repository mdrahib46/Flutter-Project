import 'package:flutter/material.dart';
import 'package:moviereviewapp/app/asset_path.dart';
import 'package:readmore/readmore.dart';

import '../../../../core/app_colors.dart';

class MovieReviewCard extends StatelessWidget {
  const MovieReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF385263).withOpacity(0.3),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.white12,
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // LEFT SIDE - CONTENT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Review by
                RichText(
                  text: const TextSpan(
                    text: 'Review by ',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 10,
                    ),
                    children: [
                      TextSpan(
                        text: 'Dilhara',
                        style: TextStyle(
                          color: AppColors.accent,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 2),

                // Movie title
                const Text(
                  'Furiosa: A Mad Max Saga',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 4),

                // Rating
                Row(
                  children: List.generate(
                    4,
                    (index) => const Icon(
                      Icons.star,
                      color: AppColors.accent,
                      size: 14,
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // Description
                const ReadMoreText(
                  'As the world fell, young Furiosa is snatched from the Green Place of Many Mothers and falls into the hands of a great Biker Horde led by the Warlord Dementus. Sweeping through the Wasteland they come across the Ci...',
                  trimLines: 5,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Read More ›',
                  trimExpandedText: ' Read Less',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    height: 1.5,
                  ),
                  moreStyle: TextStyle(
                    color: AppColors.accent,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                  lessStyle: TextStyle(
                    color: AppColors.accent,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 16),

          // RIGHT SIDE - POSTER & STATS
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  AssetPath.dummyImage,
                  width: 90,
                  height: 120,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 90,
                      height: 120,
                      color: Colors.white10,
                      child: const Icon(
                        Icons.error_outline,
                        color: Colors.white24,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.favorite, color: AppColors.accent, size: 16),
                  const SizedBox(width: 4),
                  const Text(
                    '1.1K',
                    style: TextStyle(color: Colors.white70, fontSize: 10),
                  ),
                  const SizedBox(width: 10),
                  const Icon(Icons.mode_comment_outlined,
                      color: AppColors.accent, size: 16),
                  const SizedBox(width: 4),
                  const Text(
                    '0.6K',
                    style: TextStyle(color: Colors.white70, fontSize: 10),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
