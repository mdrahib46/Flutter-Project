import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class MovieReviewCard extends StatelessWidget {
  const MovieReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF385263),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.white24,
          width: 2,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // LEFT SIDE
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
                      fontSize: 12,
                    ),
                    children: [
                      TextSpan(
                        text: 'Dilara',
                        style: TextStyle(
                          color: Colors.amber,
                          fontWeight: FontWeight.bold,
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
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 2),

                // Rating
                const Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 18,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 18,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 18,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 18,
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                // Description
                const ReadMoreText(
                  'As the world fell, young Furiosa is snatched from the Green Place of Many Mothers and falls into the hands of a great Biker Horde led by the Warlord Dementus. Sweeping through the Wasteland they come across the Citadel.',
                  trimLines: 5,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: ' Read more ›',
                  trimExpandedText: ' Read less',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    height: 1.45,
                  ),
                  moreStyle: TextStyle(
                    color: Colors.amber,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                  lessStyle: TextStyle(
                    color: Colors.amber,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          // RIGHT SIDE - POSTER
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              'assets/images/furiosa.jpg',
              width: 130,
              height: 185,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}